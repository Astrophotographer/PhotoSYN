package com.admin.controller;

import com.admin.domain.*;
import com.admin.service.AdminService;
import com.blog.domain.Blog_Criteria;
import com.blog.domain.Blog_PageDTO;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
        log.info("cri : " + cri.toString());

        //상단 카드들에 들어갈 정보
        model.addAttribute("adminMainDTO", adminMainDTO);
        //유저 들~
//        model.addAttribute("memberDTOList", memberDTOList);
        model.addAttribute("memberDTOList", adminService.getMemberDTOList_WithPaging(cri));
        return "admin/adminmain";
    }

    @RequestMapping(value = "user", method = RequestMethod.GET)
    public String users(Model model, Admin_Criteria cri) {
        log.info("user Start...");

        //페이징 처리 이전
//        model.addAttribute("memberDTOList", adminService.getMemberDTOList());
        //페이징 처리 이후


        model.addAttribute("memberDTOList", adminService.getMemberDTOList_WithPaging(cri));
        model.addAttribute("pager", new Admin_PageDTO(cri, adminService.getUserTotalCount(cri)));

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
    @RequestMapping(value = "gallery", method = RequestMethod.GET)
    public String adminGallery(Model model, Gallery_Criteria cri) {
        log.info("adminGallery");

        model.addAttribute("galleryDTOList", adminService.getGalleryDTOList_WithPaging(cri));
//        model.addAttribute("pager",new Admin_PageDTO(cri, adminService.getGalleryTotalCount(cri)));
        Gallery_PageDTO dto = new Gallery_PageDTO(cri, adminService.getGalleryTotalCount(cri));
        log.info("dto : " + dto.toString());
        //dto 값...
        //dto : Gallery_PageDTO(startPage=1, endPage=1, prev=false, next=false, total=10, cri=Gallery_Criteria(u_id=null, option=null, sort=null, pageNum=1, listQty=10, keyword=null))
//        model.addAttribute("pager",dto);

        return "admin/admingallery";
    }

    @RequestMapping(value = "blog", method = RequestMethod.GET)
    public String adminBlog(Model model, Blog_Criteria cri) {
        log.info("adminBlog");

        model.addAttribute("blogDTOList", adminService.getBlogDTOList_WithPaging(cri));

        log.info("1111111111111111111111111111111111111111111111");
        model.addAttribute("pager", new Blog_PageDTO(cri, adminService.getBlogTotalCount(cri)));


        return "admin/adminblog";
    }


    //현재 메인태그들 띄워주기
    @RequestMapping(value = "maintag", method = RequestMethod.GET)
    public String adminMainTag(Model model) {
        log.info("adminMainTag");

        log.info("adminService.getMainTagDTOList() : " + adminService.getMainTagDTOList().toString());
        model.addAttribute("mainTagDTOList", adminService.getMainTagDTOList());

        return "admin/adminmaintag";
    }

    //메인태그 추가, 수정 및 사진 추가, 수정
//    @RequestMapping(value="maintagupdate", method = RequestMethod.POST)
    @PostMapping(value = "maintagupdate")
    public String adminMainTagUpsert(@RequestParam(value = "originTag", required = false) String orignTag, @RequestParam(value = "updateTag", required = false) String updateTag,
                                     @RequestParam(value = "newTag", required = false) String newTag, MultipartHttpServletRequest request, Admin_UpsertTagDTO admin_upsertTagDTO) {
        log.info("adminMainTagUpsert");
        int result = 0;

        log.info("orignTag : " + orignTag);
        log.info("updateTag : " + updateTag);
        log.info("newTag : " + newTag);

        try {
            admin_upsertTagDTO.setOriginTag(orignTag);
            admin_upsertTagDTO.setUpdateTag(updateTag);
            admin_upsertTagDTO.setNewTag(newTag);
        } catch (NullPointerException nullPointerException) {
            log.info("maintag NullPointerException...");
            log.info("nullPointerException : " + nullPointerException.getMessage());
        } catch (Exception e) {
            log.info("maintag Exception...");
            log.info("e : " + e.getMessage());
        } finally {
            result = adminService.tagUpsert(admin_upsertTagDTO, request);
        }

        log.info("admin_upsertTagDTO : " + admin_upsertTagDTO.toString());
        log.info("result : " + result);


        // 주석
//        try{
//            MultipartFile file = request.getFile("tagImg");
//            if(file != null) {
//                log.info(file);
//                log.info("file.getname : " + file.getName());
//                log.info("file.getOriginalFilename : " + file.getOriginalFilename());
//                log.info("file.getSize : " + file.getSize());
//                log.info("file.getContentType : " + file.getContentType());
//                log.info("file.getBytes : " + file.getBytes());
//
//
//
//                //새로운 태그 추가+파일저장
//                if(newTag != null && !(newTag.isEmpty())){
//                    //new Tag
//                    log.info("newTag (if) : "+newTag);
//
//
//                }else if((orignTag != null && !(orignTag.isEmpty())) && (updateTag != null && !(updateTag.isEmpty()))){
//                    //기존 태그 수정 + 파일 저장
//                    log.info("orignTag (if) : "+orignTag);
//                    log.info("updateTag (if) : "+updateTag);
//                }
//
//            }else{
//                //파일 업로드 없음. 태그명만 수정하기
//                log.info("file is null");
//            }
//
//        }catch (NullPointerException nullPointerException){
//            log.info("nullPointerException : "+nullPointerException);
//        }catch (Exception e){
//            log.info("file : "+e.getMessage());
//        }


        return "redirect:/admin/maintag";
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

    @RequestMapping(value = "blog/hide", method = RequestMethod.POST)
    public ResponseEntity<String> hideBlog(@RequestParam(value = "chk_listArr[]", required = false) List<Integer> chk_list) {
        log.info("hideBlog");
        int result = 0;

        for (int i = 0; i < chk_list.size(); i++) {
            log.info("chk_list : " + chk_list.get(i));
            //숨김처리 진행하기
//            result = adminService.hideBlog(chk_list.get(i));
        }

        //방법1
        //for문으로 한번씩 진행 --> sql 여러번 접속

        //방법2 --> 이걸로 하기
        // 배열로 던져줘서 한번에 처리
        result = adminService.hideBlog(chk_list);

        //result = adminService.hideBlog(chk_list);
        return result >= 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @RequestMapping(value = "blog/show", method = RequestMethod.POST)
    public ResponseEntity<String> showBlog(@RequestParam(value = "chk_listArr[]", required = false) List<Integer> chk_list) {
        log.info("hideBlog");
        int result = 0;

        result = adminService.showBlog(chk_list);

        //result = adminService.hideBlog(chk_list);
        return result >= 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @RequestMapping(value = "gallery/hide", method = RequestMethod.POST)
    public ResponseEntity<String> hideGallery(@RequestParam(value = "chk_listArr[]", required = false) List<Integer> chk_list) {
        log.info("hideGallery");
        int result = 0;

        result = adminService.hideGallery(chk_list);

        log.info("gallery/hide result : " + result);

        return result >= 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @RequestMapping(value = "gallery/show", method = RequestMethod.POST)
    public ResponseEntity<String> showGallery(@RequestParam(value = "chk_listArr[]", required = false) List<Integer> chk_list) {
        log.info("hideGallery");
        int result = 0;

        result = adminService.showGallery(chk_list);

        log.info("gallery/show result : " + result);

        return result >= 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
    }


}