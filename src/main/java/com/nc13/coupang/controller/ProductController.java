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
import org.springframework.web.bind.annotation.PostMapping;
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

    @GetMapping("write")
    public String showWrite(HttpSession session) {
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        if (logIn == null) {
            return "redirect:/user/auth";
        }

        return "product/write";

    }

    @PostMapping("write")
    public String write(HttpSession session, ProductDTO productDTO) {
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        if (logIn == null) {
            return "redirect:/user/auth";
        }

        productDTO.setWriterId(logIn.getId());
        productService.insert(productDTO);

        return "redirect:/product/showOne/" + productDTO.getId();
    }

    @GetMapping("update/{id}")
    public String showUpdate(@PathVariable int id, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        if (logIn == null) {
            return "redirect:/user/auth";
        }

        ProductDTO productDTO = productService.selectOne(id);

        if (productDTO == null) {
            redirectAttributes.addFlashAttribute("message", "존재하지 않는 글 번호입니다.");
            return "redirect:/showMessage";
        }

        if (productDTO.getWriterId() != logIn.getId()) {
            redirectAttributes.addFlashAttribute("message", "권한이 없습니다.");
            return "redirect:/showMessage";
        }

        model.addAttribute("productDTO", productDTO);

        return "product/update";
    }

    @PostMapping("update/{id}")
    public String update(@PathVariable int id, HttpSession session, RedirectAttributes redirectAttributes, ProductDTO attempt) {
        UserDTO logIn = (UserDTO)session.getAttribute("logIn");
        if (logIn == null) {
            return "redirect:/user/auth";
        }

        ProductDTO productDTO = productService.selectOne(id);
        if (productDTO == null) {
            redirectAttributes.addFlashAttribute("message", "유효하지 않은 상품 번호입니다.");
            return "redirect:/showMessage";
        }

        if (logIn.getId() != productDTO.getWriterId()) {
            redirectAttributes.addFlashAttribute("message", "권한이 없습니다.");
            return "redirect:/showMessage";
        }

        attempt.setId(id);

        productService.update(attempt);


        return "redirect:/product/showOne/" + id;

    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable int id, HttpSession session, RedirectAttributes redirectAttributes) {
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        if (logIn == null) {
            return "redirect:/";
        }

        ProductDTO productDTO = productService.selectOne(id);
        if (productDTO == null) {
            redirectAttributes.addFlashAttribute("message", "존재하지 않는 상품번호");
            return "redirect:/showMessage";
        }

        if (productDTO.getWriterId() != logIn.getId()) {
            redirectAttributes.addFlashAttribute("message", "권한 없음");
            return "redirect:/showMessage";
        }

        productService.delete(id);

        return "redirect:/product/showAll";
    }
}
