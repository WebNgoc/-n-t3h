package com.example.baitap.service.Impl;

import com.example.baitap.common.PagingAndSortObject;
import com.example.baitap.converter.ProductConverter;
import com.example.baitap.dto.ExportReportDTO;
import com.example.baitap.dto.ProductDto;
import com.example.baitap.entity.BrandEntity;
import com.example.baitap.entity.CategoryEntity;
import com.example.baitap.entity.ProductEntity;
import com.example.baitap.entity.SizeEntity;
import com.example.baitap.repository.BrandRepository;
import com.example.baitap.repository.CategoryRepository;
import com.example.baitap.repository.ProductRepository;
import com.example.baitap.repository.SizeRepository;
import com.microsoft.schemas.office.visio.x2012.main.CellType;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

@Service
public class ProductService {
    @Autowired
    ProductRepository productRepository;
    @Autowired
    CategoryRepository categoryRepository;
    @Autowired
    BrandRepository brandRepository;
    @Autowired
    SizeRepository sizeRepository;
    @Autowired
    ProductConverter productConverter;

    public ProductDto saveOrEditProduct(ProductDto productDto) throws SQLException {
        ProductEntity productEntity = new ProductEntity();

        if (productDto.getId() != null) {
            ProductEntity oldProductEntity = productRepository.findById(productDto.getId()).get();
            productEntity = productConverter.convertEntity(oldProductEntity, productDto);
            productEntity.setModifiedDate(new Timestamp(System.currentTimeMillis()));
        } else {
            productEntity = productConverter.convertEntity(productDto);
            productEntity.setCreateDate(new Timestamp(System.currentTimeMillis()));
        }
        CategoryEntity categoryEntity = categoryRepository.findById(productDto.getCategoryId()).get();
        productEntity.setCategoryEntity(categoryEntity);
        BrandEntity brandEntity = brandRepository.findById(productDto.getBrandId()).get();
        productEntity.setBrandEntity(brandEntity);

        productRepository.save(productEntity);
        return productConverter.convertDto(productEntity);
    }

    public Optional<ProductEntity> findById(long id) {
        return productRepository.findById(id);
    }
    public ProductEntity detail(Long id) {
        return productRepository.findById(id).orElse(null);
    }
    public List<ProductEntity> listAllProduct() {
        return productRepository.findAll();
    }

    //    public List<ProductEntity> listProductTop3() {
//        return productRepository.getTop3();
//    }
    public List<ProductEntity> listProductByCategory(CategoryEntity category,BrandEntity brandEntity) {
        return productRepository.findAllByCategoryEntityAndBrandEntity(category,brandEntity);
    }

    public List<CategoryEntity> listAllCat() {
        return categoryRepository.findAll();
    }

    public List<BrandEntity> listAllBrand() {
        return brandRepository.findAll();
    }

    public void deleteById(Long id) throws SQLException {
        productRepository.deleteById(id);
    }

    public void ListProduct(PagingAndSortObject pagingAndSortObject) {
        pagingAndSortObject.findAll(productRepository);
    }

    public List<SizeEntity> listSize(Long productId){
        return null;
    }

    public List<ProductEntity> searchList(Double min,Double  max ){
        List<ProductEntity> productEntity =  productRepository.searchProductByPrice(min,max);
        if(productEntity == null){
            return null;
        }
        return productEntity;
    }
    public List<ProductEntity> listSearch(Long idCat,Long idBrand,Double min,Double max){
        return productRepository.findProductByCategoryIdAndAndBrandId(idCat,idBrand,min,max);
    }
    private static HSSFCellStyle createStyleForTitle(HSSFWorkbook workbook) {
        HSSFFont font = workbook.createFont();
        font.setBold(true);
        HSSFCellStyle style = workbook.createCellStyle();
        style.setFont(font);
        return style;
    }

}
