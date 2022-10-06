package com.member.controller;

import com.member.domain.MemberDTO;
import com.member.service.MemberService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/member/mypage/*")
@Log4j
public class MypageController {

    @Autowired
    private MemberService service;

    @GetMapping("profile")
    public String profile(Model model) {
        String membership = "다이아";
        model.addAttribute("membership", membership);

        return "/member/mypage/profile";
    }

    // 프로필 사진 수정
    @GetMapping("profileModify")
    public void modifyPage() {

    }

    @RequestMapping(value = "profileModifyPro", method = RequestMethod.POST)
    public String modifyPro(HttpServletRequest request, @RequestParam("filename") MultipartFile mFile, Model model) throws Exception {
        String upload_path = "D:/yesung/intellij/PhotoSYN3/src/main/webapp/resources/member/img/profile"; // 프로필 사진들 모아두는 폴더
        String id = SecurityContextHolder.getContext().getAuthentication().getName();
        MemberDTO memberDTO = service.getMember(id);
        String redirect_url = "redirect:/member/mypage/profile/"; // 사진업로드 이후 redirect될 url

        try {
            if (memberDTO.getPic() != null) { // 이미 프로필 사진이 있을경우
                File file = new File(upload_path + memberDTO.getPic()); // 경로 + 유저 프로필사진 이름을 가져와서
                file.delete(); // 원래파일 삭제
            }
            mFile.transferTo(new File(upload_path + mFile.getOriginalFilename()));  // 경로에 업로드
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }
        log.info("##################################### 확인!1111111111");
        int result = service.updateImg(id, mFile.getOriginalFilename()); // 프로필 사진 이름 db에 update

        log.info("##################################### result :: " + result);

        return redirect_url;
    }

    /*
    @RequestMapping("profileModifyPro")
    public String fileUpload(@RequestParam("uploadFile") MultipartFile file, Model model) throws Exception {
        String id = SecurityContextHolder.getContext().getAuthentication().getName();
        String savedFileName = "";
        MemberDTO memberDTO = service.getMember(id);
        // 1. 파일 저장 경로 설정 : 실제 서비스되는 위치 (프로젝트 외부에 저장)
        String uploadPath = "D:/yesung/intellij/PhotoSYN3/src/main/webapp/resources/member/img/profile";
        // 2. 원본 파일 이름 알아오기
        String originalFileName = file.getOriginalFilename();
        // 3. 파일 이름 중복되지 않게 이름 변경(서버에 저장할 이름) UUID 사용
        UUID uuid = UUID.randomUUID();
        savedFileName = uuid.toString() + "_" + originalFileName;
        // 4. 파일 생성
        File file1 = new File(uploadPath + savedFileName);
        // 5. 서버로 전송
        file.transferTo(file1);
        log.info("##################################### 확인!1111111111");
        // DB 저장
        service.updateImg(memberDTO);
        // model로 저장
        //model.addAttribute("originalFileName", originalFileName);
        log.info("##################################### 확인!2222222222");

        return "/member/mypage/profile";
    }
     */

}
