package com.kakao.controller;

import com.kakao.domain.KakaoDTO;
import com.kakao.service.KakaoService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/member/*")
@Log4j
public class KakaoController {
    @Autowired
    private KakaoService kakaoService;

    @GetMapping("main")
    public void main() {

    }

    @GetMapping("login")
    public void login() {

    }

    @RequestMapping(value = "loginPro", method = RequestMethod.GET)
    public String kakaoLogin(@RequestParam(value = "code") String code, HttpSession session, HttpServletRequest request) throws Exception {
        // 접속 토큰 get
        System.out.println("### code ### :: " + code);
        String access_token = kakaoService.getAccessToken(code);

        // 접속자 정보 get
        KakaoDTO kakaoDTO = kakaoService.getUserInfo(access_token);
        log.info("### access_token ### :: " + access_token);

        // #1. 세션 저장.
        // 닉네임이 존재할 때, 세션에 해당 닉네임과 토큰 등록. (닉네임 = 필수동의)
        if (kakaoDTO.getName() != null) {
            session.setAttribute("nickname", kakaoDTO.getName());
            session.setAttribute("access_token", access_token);
        }
        // 없으면 회원가입 -> 회원가입 폼에 카카오에서 받은 email, nickname, thumbnail 보내놓기

        kakaoService.kakaoInsert(kakaoDTO);

        return "member/main";
    }

    @GetMapping("logout") // 수정 필요함.
    public String kakaoLogout(HttpSession session) {
        String access_token = (String) session.getAttribute("access_token");
        log.info("access token :: " + access_token);
        /*
        session 에 저장된 access_token 가져와서 서버에 해당 access_token 에 대한 로그아웃 처리를 진행하고,
        session 에서 저장된 nickname 과 access_token 을 지운다.
        */
        if (access_token != null && !"".equals(access_token)) {
            kakaoService.kakaoLogout(access_token);
            session.removeAttribute("access_token");
            session.removeAttribute("nickname");
            log.info("로그아웃 완료!");
        } else {
            log.info("access_token null");
        }
        log.info("access token :: " + access_token);

        return "member/login";
    }

}
