package com.example.baitap.service.Impl;

import com.example.baitap.entity.CartEntity;
import com.example.baitap.entity.CustomerEntity;
import com.example.baitap.entity.ProductEntity;
import com.example.baitap.repository.CartRepository;
import com.example.baitap.repository.ProductRepository;
import com.example.baitap.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@Transactional
public class CartServiceImpl implements CartService {
    @Autowired
    private CartRepository cartRepository;
    @Autowired
    ProductRepository productRepository;
    @Autowired
    HttpSession session;

    @Override
    public void saveCart(Long id, Long idCustomer) {
        CartEntity cartEntity = cartRepository.findCartItemsByProductIdAndCustomerId(id, idCustomer);
        if (cartEntity != null) {
            cartEntity.setQuantity(cartEntity.getQuantity() + 1);
            cartRepository.save(cartEntity);
        } else {
            CartEntity cartEntity1 = new CartEntity();
            ProductEntity productEntity = productRepository.findById(id).get();
            cartEntity1.setProductId(id);
            cartEntity1.setCustomerId(idCustomer);
            cartEntity1.setNameProduct(productEntity.getNameProduct());
            cartEntity1.setPriceProduct(productEntity.getPrice());
            cartEntity1.setImageProduct(productEntity.getImage());
            cartEntity1.setQuantity(1);
            cartRepository.save(cartEntity1);
        }
    }

    @Override
    public List<CartEntity> getCartItemsByCustomerId(Long id) {
        return cartRepository.findCartItemsByCustomerId(id);
    }

    @Override
    public List<CartEntity> listAllCart() {
        return cartRepository.findAll();
    }

    @Override
    public void removeAllCart(Long id) {
        cartRepository.deleteCartItems(id);
    }

    @Override
    public void removeCart(Long id) {
        cartRepository.deleteById(id);
    }

    @Override
    public double amount() {
        CustomerEntity customerEntity = (CustomerEntity) session.getAttribute("customer");
        double amount = 0;
        for (CartEntity c : getCartItemsByCustomerId(customerEntity.getId())) {
            amount += c.getQuantity() * c.getPriceProduct();
        }
        return amount;
    }

    @Override
    public int count() {
        CustomerEntity customerEntity = (CustomerEntity) session.getAttribute("customer");
        if (customerEntity == null) {
            return 0;
        }

        int count = 0;
        for (CartEntity c : getCartItemsByCustomerId(customerEntity.getId())) {
            count += c.getQuantity();
        }
        return count;
    }

    @Override
    public void updateCart(Long id, int qty) {
        CustomerEntity customerEntity = (CustomerEntity) session.getAttribute("customer");
        List<CartEntity> cartEntity = getCartItemsByCustomerId(customerEntity.getId());
        for (CartEntity c : cartEntity) {
            if (cartEntity != null && c.getProductId() == id) {
                c.setQuantity(c.getQuantity() + (qty - c.getQuantity()));
                cartRepository.save(c);
                return;
            } else {

            }
        }
    }
}