package com.example.baitap.controller.admin;

import com.example.baitap.dto.UserDto;
import com.example.baitap.entity.UserTestEntity;
import com.example.baitap.service.Impl.UserServiceImpl;
import net.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Controller
@RequestMapping("/")
public class LoginController {
    @Autowired
    UserServiceImpl userServiceImpl;
    @Autowired
    JavaMailSender mailSender;

    @RequestMapping({"login"})
    public String login(Model model) {

        return "backend/login";
    }
    @GetMapping("forgot")
    public String forgot(Model model) {
        return "backend/forgot";
    }

    @GetMapping("resetPassword")
    public String showChangPassword(@Param(value = "token") String token, Model model) {
        UserTestEntity userEntity = userServiceImpl.get(token);
        if (userEntity == null) {
            model.addAttribute("message", "ERROR");
        }
        model.addAttribute("token", token);
        return "backend/resetPassword";
    }

    @PostMapping("forgot-form")
    public String fogotPassword(RedirectAttributes redirectAttributes, UserDto userDto) {
        String email = userDto.getEmail();
        String token = RandomString.make(45);
        userServiceImpl.updateResetPassWord(token, email);
        String url = "http://localhost:8080/resetPassword?token=" + token;
        try {
            sendMail(email, url);
            redirectAttributes.addFlashAttribute("message", "Check mail!");
        } catch (MessagingException e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Mail gửi fail!");
        }
        return "redirect:forgot";
    }

    @PostMapping("resetPassword")
    public String changePassword(UserDto userDto, RedirectAttributes redirectAttributes) {
        String token = userDto.getToken();
        String newPassword = userDto.getPassWord();
        String checkPass = userDto.getCheckPass();
        if (!newPassword.equals(checkPass)) {
            UserTestEntity userEntity = userServiceImpl.get(token);
            if (userEntity == null) {
                redirectAttributes.addFlashAttribute("error", "Có lỗi!");
            } else {
                userServiceImpl.updatePassWord(userEntity, newPassword);
                redirectAttributes.addFlashAttribute("message", "Bạn đã thay đổi mật khẩu thành công !");
            }
            return "redirect:login";
        } else {
            redirectAttributes.addFlashAttribute("error", "Có lỗi!");
            return "redirect:backend/resetPassword";
        }

    }

    private void sendMail(String email, String url) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);
        helper.setFrom("bui1562000@gmail.com");
        helper.setTo(email);
        String content = "<a href=\"" + url + "\">change my password</a>";
        helper.setText(content, true);
        mailSender.send(message);
    }

}
