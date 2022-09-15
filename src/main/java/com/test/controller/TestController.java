package com.test.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j
public class TestController {

    @GetMapping("hello")
    public String hello(){
        return "index";
    }
}
