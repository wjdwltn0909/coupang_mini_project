package com.nc13.coupang.controller;

import com.nc13.coupang.model.UserDTO;
import com.nc13.coupang.model.ProductDTO;
import com.nc13.coupang.service.ProductService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/product/")
public class ProductController {
    @Autowired
    private ProductService productService;

    @GetMapping("showAll")
    public String showAll(HttpSession session, Model model) {
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        if (logIn == null) {
            return "redirect:/";
        }

        List<ProductDTO> list = productService.selectAll();
        model.addAttribute("list", list);

        return "product/showAll";
    }

    @GetMapping("showOne/{id}")
    public String showOne(HttpSession session, @PathVariable int id, Model model, RedirectAttributes redirectAttributes) {
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        if (logIn == null) {
            return "redirect:/";
        }

        ProductDTO productDTO = productService.selectOne(id);

        if (productDTO == null) {
            redirectAttributes.addFlashAttribute("message", "해당 상품 번호는 유효하지 않습니다.");
            return "redirect:/showMessage";
        }

        model.addAttribute("productDTO", productDTO);

        return "product/showOne";
    }
}
