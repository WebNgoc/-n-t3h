package com.example.baitap.converter;

import com.example.baitap.dto.ProductDto;
import com.example.baitap.entity.ProductEntity;
import org.springframework.stereotype.Component;

@Component
public class ProductConverter {
    public ProductEntity convertEntity(ProductDto productDto) {
        ProductEntity productEntity = new ProductEntity();
        productEntity.setNameProduct(productDto.getNameProduct());
        productEntity.setPrice(productDto.getPrice());
        productEntity.setDescription(productDto.getDescription());
        productEntity.setQuantity(productDto.getQuantity());
        productEntity.setImage(productDto.getImage());
        return productEntity;
    }

    public ProductDto convertDto(ProductEntity productEntity) {
        ProductDto productDto = new ProductDto();
        if (productEntity.getId() != 0L) {
            productDto.setId(productEntity.getId());
        }
        productDto.setNameProduct(productEntity.getNameProduct());
        productDto.setPrice(productEntity.getPrice());
        productDto.setDescription(productEntity.getDescription());
        productDto.setImage(productEntity.getImage());
        productDto.setQuantity(productEntity.getQuantity());
        return productDto;
    }

    public ProductEntity convertEntity(ProductEntity productEntity, ProductDto productDto) {
        productEntity.setId(productDto.getId());
        productEntity.setNameProduct(productDto.getNameProduct());
        productEntity.setPrice(productDto.getPrice());
        productEntity.setDescription(productDto.getDescription());
        productEntity.setImage(productDto.getImage());
        productEntity.setQuantity(productDto.getQuantity());
        return productEntity;
    }
}
