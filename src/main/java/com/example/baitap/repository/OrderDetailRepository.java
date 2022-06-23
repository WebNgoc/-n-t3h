package com.example.baitap.repository;

import com.example.baitap.entity.CartEntity;
import com.example.baitap.entity.CustomerEntity;
import com.example.baitap.entity.ItemEntity;
import com.example.baitap.entity.OrderDetailEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderDetailRepository extends JpaRepository<OrderDetailEntity,Long> {

    @Query(value = "select c from OrderDetailEntity c where c.itemEntity=?1")
    List<OrderDetailEntity> findOrderDetailEntitiesByItemEntity(ItemEntity itemEntity);
}
