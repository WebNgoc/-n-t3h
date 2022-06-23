package com.example.baitap.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "item", schema = "2202", catalog = "")
@Data
public class ItemEntity {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private CustomerEntity customerEntity;
    @Column
    private Timestamp orderDate;
    @Column
    private int quantity;
    @Column
    private double amount;
    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "item_id",referencedColumnName = "id")
    List<OrderDetailEntity> listOrder;

}
