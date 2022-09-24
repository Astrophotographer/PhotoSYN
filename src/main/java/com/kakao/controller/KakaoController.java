package com.kakao.controller;

import com.kakao.service.KakaoService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;

@Controller
@Log4j
public class KakaoController {
    @Autowired
    private KakaoService kakaoService;

    @GetMapping("/testLogin")
    public void testLogin() {

    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String home(@RequestParam(value = "code", required = false) String code) throws Exception {
        System.out.println("### code ### :: " + code);
        String access_token = kakaoService.getAccessToken(code);

        HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_token);
        log.info("### access_token ### :: " + access_token);
        log.info("### 아이디 ########## :: " + userInfo.get("id"));
        log.info("### 닉네임 ########## :: " + userInfo.get("nickname"));
        log.info("### 이미지 ########## :: " + userInfo.get("profile_image"));
        log.info("### 이메일 ########## :: " + userInfo.get("email"));

        return "main";
    }

}
