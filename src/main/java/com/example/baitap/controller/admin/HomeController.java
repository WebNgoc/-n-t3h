package com.example.baitap.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = {"/admin"})
public class HomeController {
    @GetMapping("")
    public String loadPageHome() {
        return "backend/home";
    }


}
