package com.member.controller;

import com.member.domain.MemberDTO;
import com.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequestMapping("/member/mypage/*")
public class MypageController {

    @Autowired
    private MemberService service;

    @GetMapping("profile")
    public String profile(Model model, Authentication authentication, Principal principal) {
        // 주석 처리 부분은 시큐리티 정보를 View 로 전송할 때 사용.
        //UserDetails userDetails  = (UserDetails) authentication.getPrincipal();
        String membership = "다이아";

        //model.addAttribute("author", userDetails.getUsername());
        model.addAttribute("membership", membership);

        return "/member/mypage/profile";
    }
}
