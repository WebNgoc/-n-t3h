package com.example.baitap.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.List;


@Entity
@Table(name = "category", schema = "2202", catalog = "")
@Data
public class CategoryEntity {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Basic
    @Column(name = "parent_id")
    private String parentId;
    @Basic
    @Column(name = "name")
    private String name;
    @Basic
    @Column(name = "description")
    private String description;

    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id",referencedColumnName = "id")
    List<ProductEntity> listProduct;

}
