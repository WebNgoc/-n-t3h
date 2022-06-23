package com.example.baitap.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "cart", schema = "2202", catalog = "")
@Data
public class CartEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Column
    private int quantity;
    //    @Column
//    private double mrpPrice;
    @Column
    private Long productId;
    @Column
    private double priceProduct;
    @Column
    private String nameProduct;
    @Column
    private String imageProduct;
    @Column
    private Long customerId;

//    @ManyToOne
//    @JoinColumn(name = "product_id")
//    private ProductEntity productEntity;

//    @Column
//    private double totalPrice;
}
