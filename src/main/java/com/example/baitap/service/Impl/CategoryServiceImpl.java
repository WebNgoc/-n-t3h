package com.example.baitap.service.Impl;

import com.example.baitap.converter.CategoryConverter;
import com.example.baitap.dto.CategoryDto;
import com.example.baitap.entity.CategoryEntity;
import com.example.baitap.repository.CategoryRepository;
import com.example.baitap.service.CartService;
import com.example.baitap.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryRepository categoryRepository;
    @Autowired
    CategoryConverter categoryConverter;
    @Override
    public CategoryDto saveOrUpdateCat(CategoryDto categoryDto){
        CategoryEntity categoryEntity = new CategoryEntity();
        if(categoryDto.getId()!= null){
             CategoryEntity oldCat = categoryRepository.findById(categoryDto.getId()).get();
           categoryEntity = categoryConverter.convertEntity(oldCat,categoryDto);
        }else{
            categoryEntity = categoryConverter.convertEntity(categoryDto);
        }

        categoryRepository.save(categoryEntity);
        return categoryConverter.convertDto(categoryEntity);
    }
    @Override
    public List<CategoryEntity> listAllCat() {
        return categoryRepository.findAll();
    }
    @Override
    public CategoryEntity detail(Long id) {
        return categoryRepository.findById(id).orElse(null);
    }
    public void deleteById(Long id){
        categoryRepository.deleteById(id);
    }

}
