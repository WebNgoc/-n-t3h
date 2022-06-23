package com.example.baitap.converter;

import com.example.baitap.dto.BrandDto;
import com.example.baitap.entity.BrandEntity;
import org.springframework.stereotype.Component;

@Component
public class BrandConverter {
    public BrandEntity convertEntity(BrandDto brandDto) {
        BrandEntity brandEntity = new BrandEntity();
        brandEntity.setId(brandDto.getId());
        brandEntity.setNameBrand(brandDto.getNameBrand());
        brandEntity.setDescription(brandDto.getDescription());
        return brandEntity;
    }


}
