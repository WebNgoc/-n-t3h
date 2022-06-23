package com.example.baitap.converter;

import com.example.baitap.dto.CategoryDto;
import com.example.baitap.entity.CategoryEntity;
import org.springframework.stereotype.Component;

@Component
public class CategoryConverter {
    public CategoryEntity convertEntity(CategoryDto categoryDto) {
        CategoryEntity categoryEntity = new CategoryEntity();
//        categoryEntity.setId(categoryDto.getId());
        categoryEntity.setName(categoryDto.getNameCategory());
        categoryEntity.setDescription(categoryDto.getDescription());
        return categoryEntity;
    }

    public CategoryDto convertDto(CategoryEntity categoryEntity) {
        CategoryDto categoryDto = new CategoryDto();
        categoryDto.setId(categoryEntity.getId());
        categoryDto.setNameCategory(categoryEntity.getName());
        categoryDto.setDescription(categoryEntity.getDescription());
        return categoryDto;
    }

    public CategoryEntity convertEntity(CategoryEntity categoryEntity, CategoryDto categoryDto) {
        categoryEntity.setId(categoryDto.getId());
        categoryEntity.setName(categoryDto.getNameCategory());
        categoryEntity.setDescription(categoryDto.getDescription());
        return categoryEntity;
    }
}
