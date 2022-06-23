package com.example.baitap.controller.admin;

import com.example.baitap.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.Month;
import java.time.MonthDay;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("backend/report")
public class ReportController {
    @Autowired
    ProductRepository productRepository;
    Calendar c = Calendar.getInstance();
    int month = c.get(Calendar.MONTH) + 1;
    int day = c.get(Calendar.DAY_OF_MONTH);
    int year=c.get(Calendar.YEAR);

    @GetMapping("")
    public String list(Model model) {
        model.addAttribute("listInventory", productRepository.inventory(month));
        return "backend/report/list";
    }
    @PostMapping("")
    public String listInventory(Model model,@RequestParam(value = "date") Date date) {
        month= date.getMonth()+1;
        model.addAttribute("listInventory", productRepository.inventory(month));
        return "backend/report/list";
    }
    @GetMapping("product")
    public String listSaleProduct(Model model){
        model.addAttribute("listSale",productRepository.sales(month));
        return "backend/report/sales";
    }
    @PostMapping("product")
    public String listSale_Product(Model model,@RequestParam(value = "date") Date date){
        month= date.getMonth()+1;
        day = date.getDate();
        year=date.getYear()+1900;
        model.addAttribute("listSale",productRepository.sales(month));
        return "backend/report/sales";
    }
    @GetMapping("sales_product")
    public String listProduct(Model model){
//        model.addAttribute("month", monthDay);
        model.addAttribute("listSale",productRepository.sales_product(month));
        return "backend/report/sales_product";
    }
    @GetMapping("sales_cat")
    public String listCat(Model model){

        model.addAttribute("listSale",productRepository.sales_category(month+1));
        return "backend/report/sales_cat";
    }
    @GetMapping("sales_cus")
    public String listCustomer(Model model){
//        model.addAttribute("month", monthDay);
        model.addAttribute("listSale",productRepository.customerVip(month+1));
        return "backend/report/sales_cus";
    }


}
