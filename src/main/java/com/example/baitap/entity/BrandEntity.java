package com.example.baitap.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "brand", schema = "2202", catalog = "")
@Data
public class BrandEntity {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Basic
    @Column(name = "nameBrand")
    private String nameBrand;
    @Basic
    @Column(name = "description")
    private String description;
}
