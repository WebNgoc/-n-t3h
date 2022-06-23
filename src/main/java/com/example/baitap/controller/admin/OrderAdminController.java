package com.example.baitap.controller.admin;

import com.example.baitap.entity.CustomerEntity;
import com.example.baitap.entity.ItemEntity;
import com.example.baitap.repository.ItemRepository;
import com.example.baitap.repository.OrderDetailRepository;
import com.example.baitap.repository.ProductRepository;
import com.example.baitap.service.Impl.CartServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("backend/order")
public class OrderAdminController {
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
    @GetMapping("")
    public String listOrder(Model model){
        CustomerEntity customerEntity = (CustomerEntity) session.getAttribute("customer");
        model.addAttribute("listOrders",itemRepository.findAll());
        return "backend/order/order_list";
    }
    @GetMapping("detail/{id}")
    public String listOrder(Model model, @PathVariable Long id){
        CustomerEntity customerEntity = (CustomerEntity) session.getAttribute("customer");
        ItemEntity itemEntity = itemRepository.findById(id).get();
        model.addAttribute("listOrderId",itemEntity);
        model.addAttribute("listOrder",itemEntity.getListOrder());
        return "backend/order/order_detail";
    }
}
