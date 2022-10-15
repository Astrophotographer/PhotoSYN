package com.admin.controller;

import com.admin.domain.AdminMainDTO;
import com.admin.domain.AdminMemberDTO;
import com.admin.domain.Admin_Criteria;
import com.admin.domain.Admin_PageDTO;
import com.admin.service.AdminService;
import com.gallery.domain.Gallery_Criteria;
import com.gallery.domain.Gallery_PageDTO;
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

    @RequestMapping(value = "main", method = RequestMethod.GET)
    public String goMain(Model model, Admin_Criteria cri) {
        adminService.testPrint("hehehe");

        //유저수, 판매수, 최근 갤러리수, 최근 블로그수
        AdminMainDTO adminMainDTO = adminService.getAdminMainDTO();
        log.info("adminMainDTO : " + adminMainDTO);
        //유저 정보 들
        List<MemberDTO> memberDTOList = adminService.getMemberDTOList();
        for (int i = 0; i < memberDTOList.size(); i++) {
            log.info("memberDTOList : " + memberDTOList.get(i));
        }
//        log.info("memberDTOList : "+memberDTOList);

        //1페이지
        cri.setPageNum(1);
        //20명
        cri.setListQty(20);

        log.info("+++++++++++++++++++++++++++++++++++++");
        log.info("cri : "+cri.toString());

        //상단 카드들에 들어갈 정보
        model.addAttribute("adminMainDTO", adminMainDTO);
        //유저 들~
//        model.addAttribute("memberDTOList", memberDTOList);
        model.addAttribute("memberDTOList", adminService.getMemberDTOList_WithPaging(cri));
        return "admin/adminmain";
    }

    @RequestMapping(value="user",method = RequestMethod.GET)
    public String users(Model model, Admin_Criteria cri){
        log.info("user Start...");

        //페이징 처리 이전
//        model.addAttribute("memberDTOList", adminService.getMemberDTOList());
        //페이징 처리 이후


        model.addAttribute("memberDTOList", adminService.getMemberDTOList_WithPaging(cri));
        model.addAttribute("pager",new Admin_PageDTO(cri, adminService.getUserTotalCount(cri)));

        return "admin/adminalluser";
    }

    @RequestMapping(value = "userInfo", method = RequestMethod.GET)
    public String userInfo(Model model, String u_id) {
        log.info("u_id : " + u_id);

        MemberDTO memberDTO = adminService.getMemberDTO(u_id);
        log.info("memberDTO : " + memberDTO.toString());

        model.addAttribute("memberDTO", memberDTO);

        AdminMemberDTO adminMemberDTO = adminService.getMemeberINFO(u_id);
        log.info("adminMemberDTO : " + adminMemberDTO.toString());
        model.addAttribute("adminMemberDTO", adminMemberDTO);

        log.info("userInfo");
        return "admin/adminusers";
    }


    //TODO 1015 구현시키기.
    @RequestMapping(value="gallery", method = RequestMethod.GET)
    public String adminGallery(Model model, Gallery_Criteria cri){
        log.info("adminGallery");

        model.addAttribute("galleryDTOList", adminService.getGalleryDTOList_WithPaging(cri));
//        model.addAttribute("pager",new Admin_PageDTO(cri, adminService.getGalleryTotalCount(cri)));
        Gallery_PageDTO dto = new Gallery_PageDTO(cri, adminService.getGalleryTotalCount(cri));
        log.info("dto : "+dto.toString());
        //dto 값...
        //dto : Gallery_PageDTO(startPage=1, endPage=1, prev=false, next=false, total=10, cri=Gallery_Criteria(u_id=null, option=null, sort=null, pageNum=1, listQty=10, keyword=null))
//        model.addAttribute("pager",dto);

        return "admin/admingallery";
    }

    @RequestMapping(value="blog", method = RequestMethod.GET)
    public String adminBlog(){
        log.info("adminBlog");



        return "admin/adminblog";
    }








    @RequestMapping(value = "updateMemberShip", method = RequestMethod.POST)
    public ResponseEntity<String> updateMemberShip(@RequestBody MemberDTO memberDTO) {
        log.info("updateMemberShip memberDTO : " + memberDTO.toString());
        // INFO : com.admin.controller.AdminController - memberDT22222O : MemberDTO(id=testid2@testid2, name=null, pic=null, pw=null, phone=null, reg=null, status=0, point=0, membership=2, sns=null, snsToken=null, authDTOList=null)
        int result = 0;
        result = adminService.updateMemberShip(memberDTO);

        return result == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @RequestMapping(value = "chargePoint", method = RequestMethod.POST)
    public ResponseEntity<String> chargePoint(@RequestBody MemberDTO memberDTO) {
        log.info("chargePoint memberDTO : " + memberDTO.toString());

        int result = 0;
        //memberDTO 안에 id랑 point에 정상적으로 값 넘어옴. DB에 값 넣어주기
        result = adminService.updatePoint(memberDTO);

        return result == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @RequestMapping(value = "updateUserStatus", method = RequestMethod.POST)
    public ResponseEntity<String> updateUserStatus(@RequestBody MemberDTO memberDTO) {
        log.info("updateUserStatus memberDTO : " + memberDTO.toString());

        int result = 0;
        //memberDTO 안에 id랑 status 정상적으로 값 넘어옴. DB에 값 넣어주기
        result = adminService.updateUserStatus(memberDTO);
        return result == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
    }


}
