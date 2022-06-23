package com.example.baitap.controller.web;

import com.example.baitap.entity.CartEntity;
import com.example.baitap.entity.CustomerEntity;
import com.example.baitap.repository.CartRepository;
import com.example.baitap.repository.CustomerRepository;
import com.example.baitap.repository.ProductRepository;
import com.example.baitap.service.Impl.CustomerService;
import com.example.baitap.service.Impl.CartServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("cart")
public class CartController {
    @Autowired
    CartServiceImpl cartService;
    @Autowired
    CustomerService customerService;
    @Autowired
    CustomerRepository customerRepository;
    @Autowired
    ProductRepository productRepository;
    @Autowired
    CartRepository cartRepository;
    @Autowired
    HttpSession session;

    @GetMapping("")
    String showMyCartItems(CustomerEntity customer, HttpServletRequest request,
                           HttpSession session, Model model) {
        try {
            CustomerEntity customerEntity = (CustomerEntity) session.getAttribute("customer");
            if (customerEntity == null) {
                return "redirect:/account/login";
            } else {
                model.addAttribute("items", cartRepository.findCartItemsByCustomerId(customerEntity.getId()));
                model.addAttribute("count",cartService.count());
                model.addAttribute("amount",cartService.amount());
                model.addAttribute("name",customerEntity.getFullName());
                return "/client/cart";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/webshop";
        }
    }

    @GetMapping("add/{id}")
    public String orderCheckout(HttpSession session, @PathVariable Long id,Model model) {
        try {
            CustomerEntity customerEntity = (CustomerEntity) session.getAttribute("customer");
            if (customerEntity == null) {
                return "redirect:/account/login";
            } else {
                model.addAttribute("name",customerEntity.getFullName());
                Long idCustomer = customerEntity.getId();
                cartService.saveCart(id,idCustomer);
            }
            model.addAttribute("count",cartService.count());
            return "redirect:/webshop";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/webshop";
        }
    }
    @PostMapping(value = "update/{id}",consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String updateCart(HttpSession session,
                             @PathVariable Long id, Model model,@RequestParam("quantity") int qty) {
        try {
            CustomerEntity customerEntity = (CustomerEntity) session.getAttribute("customer");
            if (customerEntity == null) {
                return "redirect:/account/login";
            } else {
                cartService.updateCart(id,qty);
            }
            model.addAttribute("count",cartService.count());
            return "redirect:/cart";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/webshop";
        }
    }
    @GetMapping("delete/{id}")
    public String delete(@PathVariable Long id) {
        CustomerEntity customerEntity = (CustomerEntity) session.getAttribute("customer");
        if (customerEntity == null) {
            return "redirect:/account/login";
        }
        List<CartEntity> cartEntityList = cartRepository.findCartItemsByCustomerId(customerEntity.getId());
        for (CartEntity d : cartEntityList){
            if(d.getProductId() == id && d.getCustomerId()==customerEntity.getId()){
                cartService.removeCart(d.getId());
            }
        }
       return "redirect:/cart";
    }
    @GetMapping("delete")
    public String deleteAll() {
        CustomerEntity customerEntity = (CustomerEntity) session.getAttribute("customer");
        if (customerEntity == null) {
            return "redirect:/account/login";
        }
        cartService.removeAllCart(customerEntity.getId());
        return "redirect:/cart";
    }
}
