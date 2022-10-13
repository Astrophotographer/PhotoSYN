package com.admin.controller;

import com.admin.domain.AdminMainDTO;
import com.admin.service.AdminService;
import com.member.domain.MemberDTO;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @RequestMapping(value="userInfo", method = RequestMethod.GET)
    public String userInfo(Model model, String u_id){
        log.info("u_id : "+u_id);

        MemberDTO memberDTO = adminService.getMemberDTO(u_id);
        log.info("memberDTO : "+memberDTO.toString());

        model.addAttribute("memberDTO", memberDTO);

        log.info("userInfo");
        return "admin/adminusers";
    }

    @RequestMapping(value="updateMemberShip",method = RequestMethod.POST)
    public ResponseEntity updateMemberShip(@RequestBody MemberDTO memberDTO){
        log.info("memberDT22222O : "+memberDTO.toString());
        // INFO : com.admin.controller.AdminController - memberDT22222O : MemberDTO(id=testid2@testid2, name=null, pic=null, pw=null, phone=null, reg=null, status=0, point=0, membership=2, sns=null, snsToken=null, authDTOList=null)
        int result = 0;
        result = adminService.updateMemberShip(memberDTO);

        return result == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
    }



}
