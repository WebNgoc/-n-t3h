package com.example.baitap.repository;

import com.example.baitap.entity.UserTestEntity;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UserRepository extends JpaRepository<UserTestEntity, Long> {

    UserTestEntity findFirstByUserName(String userName);

    UserTestEntity findByEmail(String email);

    UserTestEntity findByToken(String token);

    Boolean existsByUserName(String userName);
    Boolean existsByEmail(String email);
}
