package com.example.baitap.repository;

import com.example.baitap.dto.ExportReportDTO;
import com.example.baitap.entity.BrandEntity;
import com.example.baitap.entity.CategoryEntity;
import com.example.baitap.entity.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;
import java.util.Optional;


public interface ProductRepository extends JpaRepository<ProductEntity, Long> {
    @Query(value = "SELECT p.* FROM product p ORDER BY p.create_date asc", nativeQuery = true)
    List<ProductEntity> getProductNew();
    @Query("SELECT p from ProductEntity p where (?1 is null or p.categoryEntity = ?1) and (?2 is null or p.brandEntity=?2)")
    List<ProductEntity> findAllByCategoryEntityAndBrandEntity(CategoryEntity categoryEntity,BrandEntity brandEntity);
    @Query(value = "SELECT\n" +
            "        t.category_id,\n" +
            "        t.name,\n" +
            "        t.sl,\n" +
            "        SUM(t.sl_ton) ,\n" +
            "        t.create_date\n" +
            "    from\n" +
            "        ( SELECT\n" +
            "            p.category_id,\n" +
            "            c.name,\n" +
            "            sum(p.quantity) AS sl,\n" +
            "            SUM(p.quantity) AS sl_ton ,p.create_date\n" +
            "        FROM\n" +
            "            product p \n" +
            "        INNER JOIN\n" +
            "            category c \n" +
            "                ON p.category_id = c.id \n" +
            "        \n" +
            "        GROUP BY\n" +
            "            p.category_id \n" +
            "        UNION\n" +
            "        SELECT\n" +
            "            p.category_id,\n" +
            "            c.name,\n" +
            "            sum(p.quantity) AS sl,\n" +
            "            SUM((-1)*o.quantity) AS sl_ton ,p.create_date\n" +
            "        FROM\n" +
            "            product p \n" +
            "        JOIN\n" +
            "            order_detail o \n" +
            "                ON p.id=o.product_id \n" +
            "        INNER JOIN\n" +
            "            category c \n" +
            "                ON p.category_id = c.id \n" +
            "        \n" +
            "        GROUP BY\n" +
            "            p.category_id \n" +
            "    ) t \n" +
            "WHERE MONTH(t.create_date) = ?1\n" +
            "GROUP BY\n" +
            "    t.category_id",nativeQuery = true)
    List<Object> inventory(int month);
    @Query(value = "SELECT t.id,t.image,t.name_product,t.price,t.quantity, SUM(t.sl_ton) AS sl_tonkho,t.price*(t.quantity-SUM(t.sl_ton)),t.create_date FROM \n" +
            "( SELECT p.id,p.image,p.name_product,p.price,p.quantity,SUM(p.quantity) AS sl_ton,p.create_date\n" +
            "FROM product p\n" +
            " GROUP BY p.id \n" +
            "UNION \n" +
            "SELECT p.id,p.image,p.name_product,p.price,p.quantity,SUM((-1)*o.quantity) AS sl_ton ,p.create_date\n" +
            "FROM product p JOIN order_detail o ON p.id=o.product_id\n" +
            "GROUP BY p.id\n" +
            ") t\n" +
            "WHERE MONTH(t.create_date) = 6\n" +
            "GROUP BY t.id", nativeQuery = true)
    List<Object> sales(int month);
    @Query(value = "SELECT p.*,SUM(o.quantity),SUM(o.total) FROM \n" +
            "product p JOIN order_detail o ON p.id=o.product_id\n" +
            "WHERE MONTH(p.create_date) = ?1 OR DATE_FORMAT(p.create_date, '%m/%d/%Y') = ?2\n" +
            "GROUP BY p.id\n" +
            "ORDER BY SUM(o.total) desc", nativeQuery = true)
    List<Object> sales_product(int month);
    @Query(value = "SELECT c.name,SUM(o.quantity),SUM(o.total) FROM \n" +
            "product p JOIN order_detail o ON p.id=o.product_id\n" +
            "INNER JOIN category c ON p.category_id=c.id\n" +
            "WHERE MONTH(p.create_date) = ?1\n" +
            "GROUP BY p.category_id\n" +
            "ORDER BY SUM(o.total) desc", nativeQuery = true)
    List<Object> sales_category(int month);
    @Query(value = "SELECT c.full_name,i.order_date,SUM(quantity),SUM(i.amount)\n" +
            "FROM item i \n" +
            "JOIN customer c ON i.customer_id= c.id \n" +
            "WHERE MONTH(i.order_date) = ?1\n" +
            "GROUP BY c.id\n" +
            "ORDER BY SUM(i.amount) desc",nativeQuery = true)
    List<Object> customerVip(int month);
    //----------search----------//
    @Query(value = "SELECT p FROM  ProductEntity p where p.price >= ?1 and p.price <= ?2")
    List<ProductEntity> searchProductByPrice(double min, double max);
    @Query("SELECT p FROM ProductEntity p WHERE p.nameProduct LIKE %?1%")
    List<ProductEntity> findProductByKey(String keyWord);
    @Query("SELECT p from ProductEntity p where (?1 is null or p.categoryEntity.id = ?1) and (?2 is null or p.brandEntity.id=?2) and (?3 is null or p.price >= ?3) and (?4 is null or p.price <= ?4)")
    List<ProductEntity> findProductByCategoryIdAndAndBrandId(Long idCat, Long idBrand,double min, double max);

    @Query("select p from ProductEntity p order by p.price asc")
    List<ProductEntity> findAllPriceAsc();
    @Query("select p from ProductEntity p order by p.price desc ")
    List<ProductEntity> findAllPriceDesc();
    @Query(value = "SELECT p.*,sum(o.quantity)\n" +
            "FROM product p JOIN order_detail o ON p.id=o.product_id\n" +
            "GROUP BY p.id\n" +
            "ORDER BY sum(o.quantity) desc",nativeQuery = true)
    List<ProductEntity> findAllByOrderDesc();


}
