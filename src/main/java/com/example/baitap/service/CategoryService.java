package com.example.baitap.service;

import com.example.baitap.dto.CategoryDto;
import com.example.baitap.entity.CategoryEntity;

import java.util.List;

public interface CategoryService {
    CategoryDto saveOrUpdateCat(CategoryDto categoryDto);
    List<CategoryEntity> listAllCat();
    CategoryEntity detail(Long id);
    void deleteById(Long id);
}
