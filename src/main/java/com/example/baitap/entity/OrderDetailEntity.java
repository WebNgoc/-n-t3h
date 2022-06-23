package com.example.baitap.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "order_detail", schema = "2202", catalog = "")
@Data
public class OrderDetailEntity {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "item_id")
    private ItemEntity itemEntity;
    @Column
    private Long product_id;
    @Column
    private double priceProduct;
    @Column
    private String nameProduct;
    @Column
    private String imageProduct;
    @Column
    private int quantity;
    @Column
    private double total;
    @Column
    private double amount;

}
