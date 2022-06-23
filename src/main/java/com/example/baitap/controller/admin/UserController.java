package com.example.baitap.controller.admin;

import com.example.baitap.common.PagingAndSortObject;
import com.example.baitap.common.PagingAndSortParam;
import com.example.baitap.dto.UserDto;
import com.example.baitap.service.Impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.sql.SQLException;

@Controller
@RequestMapping("backend/user")
public class UserController {
    @Autowired
    UserServiceImpl userServiceImpl;

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("create")
    public String loadPageCreate(Model model) {
//        model.addAttribute()
        return "backend/user/create";
    }

    @GetMapping("list")
    public String loadPageList(@PagingAndSortParam(path = "user") PagingAndSortObject pagingAndSortObject,Model model) {
        userServiceImpl.listUser(pagingAndSortObject);
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();


        return "backend/user/list";
    }

    @GetMapping("edit/{id}")
    public String loadPageEdit(@PathVariable Long id, Model model) throws SQLException {
        model.addAttribute("user", userServiceImpl.findById(id).get());
        return "backend/user/detail";
    }

    @PostMapping(value = "create-form", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String createUser(@ModelAttribute(name = "user") @Valid UserDto userDto, BindingResult bindingResult, RedirectAttributes redirectAttributes) throws SQLException {
        if (bindingResult.hasErrors()) {
            return "backend/user/create";
        }
        userServiceImpl.saveOrEditUser(userDto);
        redirectAttributes.addFlashAttribute("message", "Tạo mới tài khoản " + userDto.getFullName() + " thành công!");
        return "redirect:backend/user/create";
    }

    @PostMapping(value = "edit-form", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String editUser(UserDto userDto, Model model) throws SQLException {
        userServiceImpl.saveOrEditUser(userDto);
        model.addAttribute("message", "Sửa tài khoản " + userDto.getFullName() + " thành công!");
        return "backend/user/create";
    }

    @GetMapping(value = "/delete/{id}")
    public String loadDelete(@PathVariable Long id, Model model) throws SQLException {
        userServiceImpl.deleteById(id);
        return "redirect:/backend/user/list";
    }

}
