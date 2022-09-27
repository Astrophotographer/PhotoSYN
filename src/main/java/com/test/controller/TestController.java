package com.test.controller;

import com.test.domain.Editor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.UUID;

@Controller
@Log4j
public class TestController {


    @GetMapping("hello")
    public String hello() {
        log.info("helloggooooo");
        //log.info("helloggooooo");
        return "index";
    }

}

