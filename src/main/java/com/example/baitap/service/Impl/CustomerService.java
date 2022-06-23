package com.example.baitap.service.Impl;

import com.example.baitap.common.PagingAndSortObject;
import com.example.baitap.dto.ResponseDto;
import com.example.baitap.entity.CategoryEntity;
import com.example.baitap.entity.CustomerEntity;
import com.example.baitap.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Service
public class CustomerService {
    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpServletResponse response;

    public Cookie getCookie(String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(name))
                    return cookie;
            }
        }
        return null;
    }

    public String getCookieValue(String name, String defaultValue) {
        Cookie cookie = getCookie(name);
        if (cookie == null) {
            return defaultValue;
        }
        return cookie.getValue();
    }

    public void addCookie(String name, String value, int days) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(days * 24 * 60 * 60);
        cookie.setPath("/");
        response.addCookie(cookie);
    }

    public void deleteCookie(String name) {
        addCookie(name, "", 0);
    }

    @Autowired
    CustomerRepository customerRepository;

    public ResponseDto verifyPassword(String token) {
        CustomerEntity customerEntity = customerRepository.findFirstByToken(token);
        if (customerEntity == null || customerEntity.getTimeReset() == null)
            return ResponseDto.builder()
                    .code(0).message("Token không đúng").build();

        if (System.currentTimeMillis() - customerEntity.getTimeReset().getTime() > 30_000) {
            return ResponseDto.builder()
                    .code(0).message("Token hết hạn 30 giây").build();
        }
//        customerEntity.setPassWord(passwordEncoder.encode(userEntity.getResetPassword()));
        customerEntity.setToken(null);
//        customerEntity.setResetPassword(null);
        customerEntity.setTimeReset(null);
        customerEntity.setStatus(1);
        customerRepository.save(customerEntity);
        return ResponseDto.builder()
                .code(1).message("Kích hoạt tài khoản thành công, vui lòng đăng nhập!").build();
    }
    public void ListProduct(PagingAndSortObject pagingAndSortObject) {
        pagingAndSortObject.findAll(customerRepository);
    }
}
