package com.nc13.coupang.controller;

import com.nc13.coupang.model.CartDTO;
import com.nc13.coupang.model.ProductDTO;
import com.nc13.coupang.model.UserDTO;
import com.nc13.coupang.service.CartService;
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
@RequestMapping("/cart/")
public class CartController {
    @Autowired
    private CartService cartService;

    @GetMapping("selectAll")
    public String selectAll(HttpSession session, Model model) {
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        if (logIn == null) {
            return "redirect:/";
        }

        List<CartDTO> list = cartService.selectAll();
        model.addAttribute("list", list);
        System.out.println(list);

        return "cart/selectAll";
    }

    @GetMapping("selectOne/{id}")
    public String selectOne(HttpSession session, @PathVariable int id, Model model, RedirectAttributes redirectAttributes) {
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        if (logIn == null) {
            return "redirect:/";
        }

        CartDTO cartDTO = cartService.selectOne(id);

        if (cartDTO == null) {
            redirectAttributes.addFlashAttribute("message", "장바구니가 비어있습니다.");
            return "redirect:/showMessage";
        }

        model.addAttribute("cartDTO", cartDTO);

        return "cart/showOne";
    }

}
