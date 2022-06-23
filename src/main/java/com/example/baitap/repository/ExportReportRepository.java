package com.example.baitap.repository;

import com.example.baitap.entity.ExportReportEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ExportReportRepository extends JpaRepository<ExportReportEntity,Long> {
    @Query(value = "SELECT t.id,t.name_product,t.price,t.quantity, SUM(t.sl_ton) AS sl_tonkho,t.price*(t.quantity-SUM(t.sl_ton)),t.create_date FROM \n" +
            "( SELECT p.id,p.name_product,p.price,p.quantity,SUM(p.quantity) AS sl_ton,p.create_date\n" +
            "FROM product p\n" +
            " GROUP BY p.id \n" +
            "UNION \n" +
            "SELECT p.id,p.name_product,p.price,p.quantity,SUM((-1)*o.quantity) AS sl_ton ,p.create_date\n" +
            "FROM product p JOIN order_detail o ON p.id=o.product_id\n" +
            "GROUP BY p.id\n" +
            ") t\n" +
            "WHERE MONTH(t.create_date) = 6\n" +
            "GROUP BY t.id ",nativeQuery = true)
    List<ExportReportEntity> exportReport();
}
