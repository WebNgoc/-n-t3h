package com.example.baitap.service.Impl;

import com.example.baitap.converter.BrandConverter;
import com.example.baitap.dto.BrandDto;
import com.example.baitap.entity.BrandEntity;
import com.example.baitap.repository.BrandRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

@Service
public class BrandService {
    @Autowired
    BrandRepository brandRepository;
    @Autowired
    BrandConverter brandConverter;

    public BrandDto saveBrand(BrandDto brandDto) throws SQLException {
        BrandEntity brandEntity = brandConverter.convertEntity(brandDto);
        brandRepository.save(brandEntity);
        return brandDto;
    }

    public List<BrandEntity> listAllBrand() {
        return brandRepository.findAll();
    }
    public Optional<BrandEntity> findById(Long id){
        return brandRepository.findById(id);
    }
}
