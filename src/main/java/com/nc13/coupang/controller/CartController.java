package com.nc13.coupang.controller;

import com.fasterxml.jackson.core.JsonToken;
import com.nc13.coupang.model.CartDTO;
import com.nc13.coupang.model.UserDTO;
import com.nc13.coupang.service.CartService;
import com.nc13.coupang.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cart/")
public class CartController {
    @Autowired
    private CartService cartService;
    @Autowired
    private UserService userService;

    @GetMapping("selectAll/{userId}")
    public String selectAll(HttpSession session, Model model, @PathVariable int userId, RedirectAttributes redirectAttributes) {
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        if (logIn == null) {
            return "redirect:/";
        }

        List<CartDTO> list = cartService.selectAll(userId);
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

    @GetMapping("insert/{productId}/{quantity}")
    public String insert(HttpSession session, CartDTO cartDTO, @PathVariable("productId") int productId, @PathVariable("quantity") int quantity) {
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        if (logIn == null) {
            return "redirect:/";
        }

        cartDTO.setItemId(productId);
        cartDTO.setItemValue(quantity);
        cartDTO.setOwnerId(logIn.getId());

        System.out.println(cartDTO);
        cartService.insert(cartDTO);

        return "redirect:/product/showOne/" + productId;

    }
}
