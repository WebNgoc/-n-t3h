package com.example.baitap.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerDto {
    private Long id;
    @NotBlank(message = "Không được phép để trống")
    private String fullName;
    @NotBlank(message = "Không được phép để trống")
    private String passWord;
    @NotBlank(message = "Không được phép để trống")
    private String email;
    @NotBlank(message = "Không được phép để trống")
    private String address;
    private Integer status;
}
