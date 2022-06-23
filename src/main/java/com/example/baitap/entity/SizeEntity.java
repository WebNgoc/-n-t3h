package com.example.baitap.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "size", schema = "2202", catalog = "")
@Data
public class SizeEntity {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Basic
    @Column
    private String nameSize;

}
