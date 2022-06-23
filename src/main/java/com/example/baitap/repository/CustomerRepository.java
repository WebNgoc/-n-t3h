package com.example.baitap.repository;

import com.example.baitap.entity.CustomerEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CustomerRepository extends JpaRepository<CustomerEntity,Long> {
    CustomerEntity findByEmail(String email);
    CustomerEntity findFirstByToken(String token);
}
