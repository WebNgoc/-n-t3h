package com.example.baitap.dto;

import com.example.baitap.entity.ProductEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDto {
    private Long id;
    @NotBlank(message = "Không được phép để trống")
    private String nameProduct;
    @Min(value = 6, message = "nhập só có độ dài lớn hơn 6")
    private double price;
//    @NotBlank(message = "Không được phép để trống")
    private int quantity;
    private String description;
    private Long brandId;
    private Long categoryId;
    private String image;
    private Long create_By;
    private String nameCat;
    private String nameBrand;
}
