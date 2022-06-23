package com.example.baitap.controller.web;

import com.example.baitap.dto.ResponseDto;
import com.example.baitap.entity.CustomerEntity;
import com.example.baitap.repository.CustomerRepository;
import com.example.baitap.service.Impl.CustomerService;
import com.example.baitap.service.Impl.EmailService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.sql.Timestamp;
import java.util.UUID;

@Controller
@RequestMapping("account")
public class AccountController {
    @Autowired
    CustomerRepository customerRepository;
    @Autowired
    CustomerService customerService;
    @Autowired
    HttpSession session;
    @Autowired
    HttpServletRequest request;
    @Autowired
    EmailService emailService;
    @Autowired
    PasswordEncoder passwordEncoder;
    @GetMapping("login")
    public String login(Model model){
        model.addAttribute("email",customerService.getCookieValue("customer",""));
        model.addAttribute("pass",customerService.getCookieValue("pass",""));
        return "client/account/login";
    }
    @GetMapping("logout")
    public String logout(Model model){
        session.removeAttribute("customer");
        return "redirect:/webshop";
    }
    @GetMapping("register")
    public String register(Model model){
        model.addAttribute("customer",new CustomerEntity());
        return "client/account/register";
    }
    @GetMapping("status/{token}")
    public String register(Model model, @PathVariable String token, RedirectAttributes redirectAttributes){
        ResponseDto responseDto =customerService.verifyPassword(token);
        if (responseDto.getCode() != 1) {
            redirectAttributes.addFlashAttribute("message", responseDto.getMessage());
            return "redirect:/account/register";
        }
        redirectAttributes.addFlashAttribute("message", responseDto.getMessage());
        return "redirect:/account/login";
    }
    @PostMapping(value = "register",consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String registerPost(@ModelAttribute("customer") @Valid CustomerEntity customer,
                                BindingResult bindingResult,
                               Model model,@RequestParam("passWord2") String passWord2){
        if (bindingResult.hasErrors()) {
            return "client/account/register";
        }
        CustomerEntity customerEntity = customerRepository.findByEmail(customer.getEmail());
        if(!customer.getPassWord().equals(passWord2)){
            model.addAttribute("error","Mật khẩu xác nhận không đúng");
        }
        else if(customerEntity==null){
            CustomerEntity customerEntity1 = new CustomerEntity();
            String token = UUID.randomUUID().toString();
            customer.setPassWord(passwordEncoder.encode(customer.getPassWord()));
            customer.setTimeReset(new Timestamp(System.currentTimeMillis()));
            customer.setCreatedDate(new Timestamp(System.currentTimeMillis()));
            customer.setToken(token);
            BeanUtils.copyProperties(customer,customerEntity1);
            customerRepository.save(customerEntity1);
            model.addAttribute("message","Đăng ký thành công");
//            String to = customer.getEmail();
//            String subject = "Wecome to Shop";
//
//            String url=request.getRequestURL().toString().replace("register","status/" + token);
//            String body =  "<a href = "+ url +">Kích hoạt tài khoản</a>";
//
//            emailService.sendMail(subject,body,to);
//            model.addAttribute("message","Gửi mail thành công, kiểm tra hòm thư để kích hoạt tài khoản");

        }
        else if(customerEntity.getEmail().equals(customer.getEmail())){
            model.addAttribute("error","Email đã được sử dụng");
        }
        return "client/account/register";
    }
    @PostMapping("login")
    public String loginPost(@RequestParam(value = "id",required = false) Long id,
                            @RequestParam(value = "email") String email,
                            @RequestParam(value = "password") String pass,
                            @RequestParam(value = "remember",defaultValue = "false") boolean rem,
                            Model model){
        CustomerEntity customerEntity = customerRepository.findByEmail(email);

         boolean check = passwordEncoder.matches(pass,customerEntity.getPassWord());
        if(customerEntity == null){
            model.addAttribute("error","Nhập không đúng email");
            return "client/account/login";
        }
        else if(check == false){
            model.addAttribute("error","Sai mật khẩu đăng nhập");
            return "client/account/login";
        }
        else if(customerEntity.getStatus()==null){
            model.addAttribute("error","Tài khoản chưa kích hoạt ");
            return "client/account/login";
        }else{
            model.addAttribute("message","Đăng nhập thành công");
            session.setAttribute("customer",customerEntity);
            if(rem == true){
                customerService.addCookie("customer",email,30);
                customerService.addCookie("pass",pass,30);
            }
            else {
                customerService.deleteCookie("customer");
                customerService.deleteCookie("pass");
            }
            String requester = (String) session.getAttribute("raquel");
            if(requester != null){
                return "redirect:"+requester;
            }
        }
        return "redirect:/webshop";
    }
}
