package com.kakao.controller;

import com.kakao.domain.KakaoDTO;
import com.kakao.service.KakaoService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
@Log4j
public class KakaoController {
    @Autowired
    private KakaoService kakaoService;
    private HttpSession session;

    @GetMapping("/testLogin")
    public void testLogin() {

    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
        // 접속 토큰 get
        System.out.println("### code ### :: " + code);
        String access_token = kakaoService.getAccessToken(code);

        // 접속자 정보 get
        HashMap<String, Object> result = kakaoService.getUserInfo(access_token);
        log.info("### access_token ### :: " + access_token);
        log.info("### 아이디 ########## :: " + result.get("id"));
        log.info("### 닉네임 ########## :: " + result.get("nickname"));
        log.info("### 이미지 ########## :: " + result.get("thumbnail_image"));
        log.info("### 이메일 ########## :: " + result.get("email"));

        return "main";
    }

}
