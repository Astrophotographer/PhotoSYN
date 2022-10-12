package com.admin.controller;

import com.admin.service.AdminService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
@Log4j
public class AdminController {

    @Autowired
    private AdminService adminService;
}
