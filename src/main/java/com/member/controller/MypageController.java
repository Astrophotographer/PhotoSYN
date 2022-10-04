package com.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/mypage/*")
public class MypageController {

    @GetMapping("profile")
    public void profile() {

    }
}
