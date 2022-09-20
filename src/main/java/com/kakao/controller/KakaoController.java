package com.kakao.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Log4j
@RequestMapping("/user/*")
public class KakaoController {

    @GetMapping("k_login")
    public String kakaoLogin(@RequestParam (value = "code", required = false) String code) throws Exception {
        System.out.println("#########" + code);

        return "testPage"; // 나중에 경로 변경
    }

}
