package com.example.baitap.repository;

import com.example.baitap.entity.CustomerEntity;
import com.example.baitap.entity.ItemEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ItemRepository extends JpaRepository<ItemEntity,Long> {
    List<ItemEntity> findByCustomerEntity(CustomerEntity customerEntity);
    ItemEntity findAllById(Long id);
}
