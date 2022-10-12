package com.admin.controller;

import com.admin.service.AdminService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping(value="main", method = RequestMethod.GET)
    public String goMain(){
        adminService.testPrint("hehehe");
        return "admin/adminmain";
    }

}
