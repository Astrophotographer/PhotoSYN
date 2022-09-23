package com.test.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j
public class TestController {


    @GetMapping("hello")
    public String hello() {
        log.info("helloggooooo");
        //log.info("helloggooooo");
        return "index";
    }

    @RequestMapping("testeditor")
    public String testeditor(){
        log.info("testEditor Start...");

        return "/testpage/editor";
    }
}