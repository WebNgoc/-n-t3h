package com.example.baitap.repository;

import com.example.baitap.entity.CartEntity;
import com.example.baitap.entity.CustomerEntity;
import com.example.baitap.entity.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CartRepository extends JpaRepository<CartEntity, Long> {
    @Query(value = "select c from CartEntity c where c.productId=?1 and c.customerId =?2")
    CartEntity findCartItemsByProductIdAndCustomerId(Long id,Long idCustomer);

    @Query(value = "select c from CartEntity c where c.customerId =?1")
    List<CartEntity> findCartItemsByCustomerId(Long id);

    @Modifying(clearAutomatically = true)
    @Query(value = "delete from CartEntity c where c.customerId=?1")
    void deleteCartItems(Long id);

//    @Modifying(clearAutomatically = true)
    @Query(value = "delete from CartEntity c where c.id=?1")
    void deleteCartItem(Long id);
}
