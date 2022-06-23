package com.example.baitap.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;


@Entity
@Table(name = "product", schema = "2202", catalog = "")
@Data
public class ProductEntity {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Basic
    @Column
    private String nameProduct;
    @Basic
    @Column
    private double price;
    @Basic
    @Column
    private int quantity;
    @Basic
    @Column
    private String description;
    @Basic
    @Column
    private String image;
    @Basic
    @Column
    private Long createBy;
    @Column
    private Timestamp createDate;
    @Column
    private Timestamp modifiedDate;
    @ManyToOne
    @JoinColumn(name = "brand_id")
    private BrandEntity brandEntity;
    @ManyToOne
    @JoinColumn(name = "category_id")
    private CategoryEntity categoryEntity;
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "product_size",joinColumns = @JoinColumn(name = "product_id"),inverseJoinColumns = @JoinColumn(name = "size_id"))
    Set<SizeEntity> size =  new HashSet<>();

    public void setSize(SizeEntity sizeEntity) {
        size.add(sizeEntity);
    }
}