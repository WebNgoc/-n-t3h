package com.example.baitap.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartDto {
    private Long id;
    private String name;
    private Long price;
    private int quantity;
    private Long productId;
    private String image;
}
