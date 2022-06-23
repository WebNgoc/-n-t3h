package com.example.baitap.controller.admin;

import com.example.baitap.dto.BrandDto;
import com.example.baitap.service.Impl.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.SQLException;

@Controller
@RequestMapping("backend/brand")
public class BrandController {
    @Autowired
    BrandService brandService;

    @GetMapping("create")
    public String loadPage() {
        return "backend/brand/create";
    }

    @GetMapping("edit/{id}")
    public String loadPageEdit(@PathVariable Long id, Model model) throws SQLException {
        model.addAttribute("listBrandById", brandService.findById(id));
        return "backend/brand/detail";
    }

    @GetMapping("list")
    public String loadPageList(Model model) throws SQLException {
        model.addAttribute("listBrand", brandService.listAllBrand());
        return "backend/brand/list";
    }

    @PostMapping(value = "create", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String createBrand(Model model, BrandDto brandDto) throws SQLException {
        brandService.saveBrand(brandDto);
        model.addAttribute("message", "Tạo mới thương hiệu " + brandDto.getNameBrand() + " thành công!");
        return "redirect:/backend/brand/create";
    }

    @PostMapping(value = "edit", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String editBrand(Model model, BrandDto brandDto) throws SQLException {
//        brandService.editBrand(brandDto);
        model.addAttribute("message", "Tạo mới thương hiệu " + brandDto.getNameBrand() + " thành công!");
        return "redirect:/backend/brand/list";
    }
}
