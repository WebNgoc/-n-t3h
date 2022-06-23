package com.example.baitap.service;

import com.example.baitap.entity.CartEntity;

import java.util.List;

public interface CartService {
    void saveCart(Long id,Long idCustomer);
    List<CartEntity> getCartItemsByCustomerId(Long id);
    List<CartEntity> listAllCart();
    void removeAllCart(Long id);
   void removeCart(Long id);
    double amount();
    int count();

    void updateCart(Long id, int qty);
}
