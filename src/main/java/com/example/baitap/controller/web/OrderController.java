package com.example.baitap.controller.web;

import com.example.baitap.entity.*;
import com.example.baitap.repository.ItemRepository;
import com.example.baitap.repository.OrderDetailRepository;
import com.example.baitap.repository.ProductRepository;
import com.example.baitap.service.Impl.CartServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;

@Controller
@RequestMapping("order")
public class OrderController {
    @Autowired
    HttpSession session;

    @Autowired
    ProductRepository productRepository;
    @Autowired
    CartServiceImpl cartService;

    @Autowired
    OrderDetailRepository orderDetailRepository;
    @Autowired
    ItemRepository itemRepository;
    @GetMapping("checkout")
    public String checkout(Model model){
        CustomerEntity customerEntity = (CustomerEntity) session.getAttribute("customer");
        List<CartEntity> cartEntities=cartService.getCartItemsByCustomerId(customerEntity.getId());
        model.addAttribute("order",new Timestamp(System.currentTimeMillis()));
        model.addAttribute("InfoCustomer",customerEntity);
        model.addAttribute("listItem",cartEntities);
        model.addAttribute("count",cartService.count());
        model.addAttribute("amount",cartService.amount());
        return "client/order/checkout";
    }
    @GetMapping("orderDetail/{id}")
    public String detail(Model model, @PathVariable Long id){
        CustomerEntity customerEntity = (CustomerEntity) session.getAttribute("customer");
        ItemEntity itemEntity=itemRepository.findAllById(id);
        model.addAttribute("listOrder",itemEntity.getListOrder());
        model.addAttribute("amount",itemEntity.getAmount());
        model.addAttribute("count",itemEntity.getQuantity());
        return "client/order/order_detail";
    }
    @GetMapping("orders")
    public String listOrder(Model model){
        CustomerEntity customerEntity = (CustomerEntity) session.getAttribute("customer");
        model.addAttribute("listOrders",itemRepository.findByCustomerEntity(customerEntity));
        return "client/order/purchased_orders";
    }
    @PostMapping(value = "purchase",consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String purchase(Model model,@RequestParam("fullName") String customerName){
        CustomerEntity customerEntity = (CustomerEntity) session.getAttribute("customer");
        List<CartEntity> cartEntities=cartService.getCartItemsByCustomerId(customerEntity.getId());
        ItemEntity itemEntity = new ItemEntity();
        itemEntity.setCustomerEntity(customerEntity);
        itemEntity.setOrderDate(new Timestamp(System.currentTimeMillis()));
        itemEntity.setAmount(cartService.amount());
        itemEntity.setQuantity(cartService.count());
        itemRepository.save(itemEntity);
        for (CartEntity c : cartEntities){
            OrderDetailEntity orderDetailEntity = new OrderDetailEntity();
            orderDetailEntity.setNameProduct(c.getNameProduct());
            orderDetailEntity.setProduct_id(c.getProductId());
            orderDetailEntity.setPriceProduct(c.getPriceProduct());
            orderDetailEntity.setQuantity(c.getQuantity());
            orderDetailEntity.setTotal(c.getQuantity()*c.getPriceProduct());
            orderDetailEntity.setImageProduct(c.getImageProduct());
            orderDetailEntity.setAmount(cartService.amount());
            orderDetailEntity.setItemEntity(itemEntity);
            orderDetailRepository.save(orderDetailEntity);
        }
        return "client/order/ok";
    }
}
