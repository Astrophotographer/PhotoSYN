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
        HashMap<String, String> userInfo = kakaoService.getUserInfo(access_token);

        log.info("### access_token ### :: " + access_token);
        log.info("### 아이디 ########## :: " + userInfo.get("id"));
        log.info("### 닉네임 ########## :: " + userInfo.get("nickname"));
        log.info("### 이미지 ########## :: " + userInfo.get("thumbnail_image"));
        log.info("### 이메일 ########## :: " + userInfo.get("email")); // id

        // 가입여부 db에서 확인하고, 있으면 로그인처리 (세션)
        // 없으면 회원가입 -> 회원가입 폼에 카카오에서 받은 email, nickname, thumbnail 보내놓기
        kakaoService.kakaoInsert(userInfo);


        return "main";
    }

}
