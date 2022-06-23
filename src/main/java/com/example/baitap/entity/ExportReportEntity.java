package com.example.baitap.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;
import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;


@Entity
@Table(name = "export", schema = "2202", catalog = "")
@Data
public class ExportReportEntity {
    @Id
    @Column
    private Long id;
    @Column
    private String nameProduct;
    @Column
    private double price;
    @Column
    private int quantity;
    @Column
    private int inventory;
    @Column
    private double sale;
    @Column
    private Timestamp date;
}
