package com.example.baitap.controller.admin;

import com.example.baitap.dto.CategoryDto;
import com.example.baitap.service.CategoryService;
import com.example.baitap.service.Impl.CategoryServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.SQLException;

@Controller
@RequestMapping("backend/category")
public class CategoryController {
    @Autowired
    CategoryService categoryServiceImpl;

    @GetMapping("create")
    public String loadPageCreateCat(Model model) throws SQLException {

        return "backend/category/create";
    }

    @GetMapping("list")
    public String loadCat(Model model){
        model.addAttribute("listCat", categoryServiceImpl.listAllCat());
        return "backend/category/list";
    }
    @GetMapping("edit/{id}")
    public String loadDetailCat(Model model, @PathVariable Long id)
    {
        model.addAttribute("editCat",categoryServiceImpl.detail(id));
        return "backend/category/detail";
    }

    @PostMapping(value = "create", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String createCat(CategoryDto categoryDto, Model model){
        categoryServiceImpl.saveOrUpdateCat(categoryDto);
        model.addAttribute("message", "Tạo mới danh mục " + categoryDto.getNameCategory() + " thành công!");
        return "redirect:backend/category/create";
    }
    @PostMapping(value = "edit", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String editCat(CategoryDto categoryDto, Model model){
        categoryServiceImpl.saveOrUpdateCat(categoryDto);
        model.addAttribute("message", "Chỉnh sửa danh mục " + categoryDto.getNameCategory() + " thành công!");
        return "redirect:backend/category/edit";
    }
    @PreAuthorize("hasAnyRole('ADMIN')")
    @GetMapping(value = "delete/{id}")
    public String loadDelete(@PathVariable Long id){
        categoryServiceImpl.deleteById(id);
        return "redirect:/backend/category/list";
    }
}
