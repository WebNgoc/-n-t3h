package com.example.baitap.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "customer", schema = "2202", catalog = "")
@Data
public class CustomerEntity {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Basic
    @Column
    private String fullName;
    @Basic
    @Column
    private String passWord;
    @Basic
    @Column
    private String email;
    @Basic
    @Column
    private String address;
    @Basic
    @Column
    private int phone;
    @Basic
    @Column
    private Integer status;
    @Basic
    @Column(name = "TOKEN")
    private String token;

    @Basic
    @Column(name = "RESET_PASSWORD")
    private String resetPassword;
    @Basic
    @Column(name = "TIME_RESET")
    private Timestamp timeReset;
    @Basic
    @Column(name = "CREATE_DATE")
    private Timestamp createdDate;

}
