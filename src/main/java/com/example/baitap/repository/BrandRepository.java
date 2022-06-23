package com.example.baitap.repository;

import com.example.baitap.entity.BrandEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BrandRepository extends JpaRepository<BrandEntity, Long> {
//    BrandEntity findById(Long id);
}
