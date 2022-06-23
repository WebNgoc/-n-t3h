package com.example.baitap.controller.admin;

import com.example.baitap.common.PagingAndSortObject;
import com.example.baitap.common.PagingAndSortParam;
import com.example.baitap.repository.CustomerRepository;
import com.example.baitap.service.Impl.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("backend/customer")
public class CustomerController {
    @Autowired
    CustomerRepository customerRepository;
    @Autowired
    CustomerService customerService;
    @GetMapping("list")
    public String loadCat(@PagingAndSortParam(path = "customer") PagingAndSortObject pagingAndSortObject, Model model){
        customerService.ListProduct(pagingAndSortObject);
//        model.addAttribute("list",customerService.);
        return "backend/customer/list";
    }
}
