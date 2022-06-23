package com.example.baitap.dto;

import com.example.baitap.entity.UserTestEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.validation.constraints.NotBlank;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDto  {
    private Long id;
    @NotBlank(message = "Không được phép để trống")
    private String userName;
    @NotBlank(message = "Không được phép để trống")
    private String passWord;
    @NotBlank(message = "Không được phép để trống")
    private String fullName;
    @NotBlank(message = "Không được phép để trống")
    private Integer gender;
    @NotBlank(message = "Không được phép để trống")
    private Integer status;
    @NotBlank(message = "Không được phép để trống")
    private String email;
    @NotBlank(message = "Không được phép để trống")
    private String phone;
    @NotBlank(message = "Không được phép để trống")
    private String role;
    private String token;
    private String checkPass;



}