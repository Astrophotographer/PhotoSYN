package com.user.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user/*")
@Log4j
public class UserController {

//    @Autowired
//    private userService us;

    @GetMapping("login")
    public void login() {

    }
    /* 아직 미완성 코드
    // Controller에 code를 받을 메서드
    @GetMapping("kakaoLogin")
    public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
        log.info("####code####" + code);
        String access_Token = ms.getAccessToken(code);
		log.info("###access_Token#### : " + access_Token);
        return "/user/login";
    }
    */
}