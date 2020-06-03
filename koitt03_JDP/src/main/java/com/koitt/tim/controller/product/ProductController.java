package com.koitt.tim.controller.product;

import com.koitt.tim.dto.product.ProductDto;
import com.koitt.tim.service.product.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class ProductController {

    @Autowired
    ProductService pServ;

    @RequestMapping("list")
    public String productList(Model model){
        List<ProductDto> list=pServ.getProductList();

        model.addAttribute("dtos",list);
        return "product/list";
    }

}