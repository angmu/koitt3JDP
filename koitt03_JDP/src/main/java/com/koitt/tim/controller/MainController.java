package com.koitt.tim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koitt.tim.dto.product.ProductDto;
import com.koitt.tim.service.main.MainService;

@Controller
public class MainController {

	@Autowired
	MainService mainService;

	@GetMapping(path = { "/", "main" })
	public String main(Model model) {
		List<ProductDto> hitPro = mainService.hitProduct();

		model.addAttribute("hitPro", hitPro);
		return "main";
	}

	@RequestMapping("header")
	public String footer() {
		return "common/header";
	}

	@GetMapping("test")
	public String test() {
		return "test";
	}

}
