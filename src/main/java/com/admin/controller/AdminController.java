package com.admin.controller;

import com.admin.domain.AdminMainDTO;
import com.admin.service.AdminService;
import com.member.domain.MemberDTO;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping(value="main", method = RequestMethod.GET)
    public String goMain(Model model){
        adminService.testPrint("hehehe");

        //유저수, 판매수, 최근 갤러리수, 최근 블로그수
        AdminMainDTO adminMainDTO = adminService.getAdminMainDTO();
        log.info("adminMainDTO : "+adminMainDTO);
        //유저 정보 들
        List<MemberDTO> memberDTOList = adminService.getMemberDTOList();
        for(int i=0;i<memberDTOList.size();i++){
            log.info("memberDTOList : "+memberDTOList.get(i));
        }
//        log.info("memberDTOList : "+memberDTOList);

        model.addAttribute("adminMainDTO", adminMainDTO);
        model.addAttribute("memberDTOList", memberDTOList);
        return "admin/adminmain";
    }

}
