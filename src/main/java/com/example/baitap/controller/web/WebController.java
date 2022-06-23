package com.example.baitap.controller.web;

import com.example.baitap.entity.BrandEntity;
import com.example.baitap.entity.CategoryEntity;
import com.example.baitap.entity.CustomerEntity;
import com.example.baitap.entity.ProductEntity;
import com.example.baitap.repository.BrandRepository;
import com.example.baitap.repository.ProductRepository;
import com.example.baitap.service.Impl.BrandService;
import com.example.baitap.service.CartService;
import com.example.baitap.service.Impl.CategoryServiceImpl;
import com.example.baitap.service.Impl.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("webshop")
public class WebController {
    @Autowired
    CategoryServiceImpl categoryServiceImpl;
    @Autowired
    BrandService brandService;
    @Autowired
    ProductService productService;
    @Autowired
    CartService cartService;
    @Autowired
    ProductRepository productRepository;
    @Autowired
    BrandRepository brandRepository;
    @GetMapping("")
    public String loadPageHome(Model model, HttpSession session){
        model.addAttribute("danhsachCategory", categoryServiceImpl.listAllCat());
        model.addAttribute("listBrand", brandService.listAllBrand());
        model.addAttribute("danhsachProduct", productRepository.findAllByOrderDesc());
        model.addAttribute("count",cartService.count());
        model.addAttribute("listFeaturesItemNew",productRepository.getProductNew());
        CustomerEntity customerEntity = (CustomerEntity) session.getAttribute("customer");
        if (customerEntity == null) {
            return "client/index";
        }
        model.addAttribute("name",customerEntity.getFullName());
        return "client/index";
    }
    @RequestMapping("product/{id}")
    public String product(Model model, @PathVariable Long id) {
        // Query trong db sác sản phẩm có category id = {id}
        model.addAttribute("product", productService.detail(id));// lấy từ db
        model.addAttribute("danhsachCategory", categoryServiceImpl.listAllCat());// lấy từ db
        model.addAttribute("listSize",productService.listSize(id));
        ProductEntity productEntity = productRepository.findById(id).get();
        model.addAttribute("category", categoryServiceImpl.detail(productEntity.getCategoryEntity().getId()));
        return "client/product_detail";
    }

    // Lấy danh sản phẩm theo category id
    @RequestMapping("category/{id}")
    public String category(Model model, @PathVariable Long id) {
        // Query trong db sác sản phẩm có category id = {id}
        CategoryEntity categoryEntity = categoryServiceImpl.detail(id);
        model.addAttribute("listBrand", brandService.listAllBrand());
        model.addAttribute("danhsachProduct", productService.listProductByCategory(categoryEntity,null));
        model.addAttribute("danhsachCategory", categoryServiceImpl.listAllCat());
        model.addAttribute("category", categoryServiceImpl.detail(id));
        model.addAttribute("brand", null);

        return "client/index";
    }
    @RequestMapping("brand/{id}")
    public String brand(Model model, @PathVariable Long id) {
        // Query trong db sác sản phẩm có category id = {id}
        BrandEntity brandEntity = brandRepository.findById(id).get();
        model.addAttribute("listBrand", brandService.listAllBrand());
        model.addAttribute("danhsachProduct", productService.listProductByCategory(null,brandEntity));
        model.addAttribute("danhsachCategory", categoryServiceImpl.listAllCat());
        model.addAttribute("brand", brandEntity);
        model.addAttribute("category", null);

        return "client/index";
    }
    @RequestMapping("products")
    public String products(Model model) {
        // Query trong db sác sản phẩm có category id = {id}
//        model.addAttribute("danhsachProduct", productService.listProductByCategory(id));
        model.addAttribute("listBrand", brandService.listAllBrand());
        model.addAttribute("danhsachCategory", categoryServiceImpl.listAllCat());
//        model.addAttribute("category", categoryService.detail(id));
        return "client/products";
    }
    @RequestMapping("products/products_new")
    public String products_new(Model model) { ;
        model.addAttribute("listBrand", brandService.listAllBrand());
        model.addAttribute("danhsachCategory", categoryServiceImpl.listAllCat());
        model.addAttribute("listFeaturesItemNew",productRepository.getProductNew());
        return "client/products_new";
    }
    @RequestMapping("products/products_order_desc")
    public String products_orderDesc(Model model) { ;
        model.addAttribute("listBrand", brandService.listAllBrand());
        model.addAttribute("danhsachCategory", categoryServiceImpl.listAllCat());
        model.addAttribute("orderDesc",productRepository.findAllByOrderDesc());
        return "client/products_order_desc";
    }
    @RequestMapping("products/products_price_desc")
    public String products_price_desc(Model model) { ;
        model.addAttribute("listBrand", brandService.listAllBrand());
        model.addAttribute("danhsachCategory", categoryServiceImpl.listAllCat());
        model.addAttribute("priceDesc",productRepository.findAllPriceDesc());
        return "client/products_price_desc";
    }
    @RequestMapping("products/products_price_asc")
    public String products_price_asc(Model model) { ;
        model.addAttribute("listBrand", brandService.listAllBrand());
        model.addAttribute("danhsachCategory", categoryServiceImpl.listAllCat());
        model.addAttribute("priceAsc",productRepository.findAllPriceAsc());
        return "client/products_price_asc";
    }
    @GetMapping("search")
    public String listProductByPrice(Model model, @RequestParam(name = "minPrice",defaultValue = "1",required = false) Double min,
                                     @RequestParam(name = "maxPrice",defaultValue = "99999999",required = false) Double max,@RequestParam(value = "idCat",required = false) Long idCat
            ,@RequestParam(value = "idBrand",required = false) Long idBrand){
        model.addAttribute("danhsachCategory", categoryServiceImpl.listAllCat());
        model.addAttribute("listBrand", brandService.listAllBrand());
        model.addAttribute("danhsachProduct", productService.listAllProduct());
        model.addAttribute("count",cartService.count());
        model.addAttribute("listFeaturesItemNew",productRepository.getProductNew());

        model.addAttribute("filter",productService.listSearch(idCat,idBrand,min,max));


            return "client/index";
    }
    @PostMapping("key")
    public String listProductByName(Model model,@RequestParam(name = "txt",required = false) String keyWord){
        model.addAttribute("danhsachCategory", categoryServiceImpl.listAllCat());
        model.addAttribute("listBrand", brandService.listAllBrand());
        model.addAttribute("danhsachProduct", productService.listAllProduct());
        model.addAttribute("count",cartService.count());
        model.addAttribute("listFeaturesItemNew",productRepository.getProductNew());

        model.addAttribute("search",productRepository.findProductByKey(keyWord));
        model.addAttribute("key",keyWord);
        return "client/index";
    }
}
