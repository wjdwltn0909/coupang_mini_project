package com.nc13.coupang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping("/")
    public String showIndex(){
        // 특정 페이지를 실행시키는 메소드는
        // 해당 페이지의 폴더명+파일 이름 을
        // 리턴하게 된다.
        return "index";
    }
}
