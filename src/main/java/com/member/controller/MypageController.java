package com.member.controller;

import com.member.domain.MemberDTO;
import com.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/mypage/*")
public class MypageController {

    @Autowired
    private MemberService service;

    @GetMapping("profile")
    public String profile(Model model) {
        String membership = "다이아";
        model.addAttribute("membership", membership);

        return "/member/mypage/profile";
    }

    @PostMapping("profileModify")
    public String modifyPro(MemberDTO memberDTO) {



        return "/member/mypage/profile";
    }

}
