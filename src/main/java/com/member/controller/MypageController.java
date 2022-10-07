package com.member.controller;

import com.member.domain.MemberDTO;
import com.member.domain.PasswordDTO;
import com.member.security.MemberUser;
import com.member.security.MemberUserDetailsService;
import com.member.service.MemberService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/member/mypage/*")
@Log4j
public class MypageController {

    @Autowired
    private MemberService memberService;
    @Autowired
    private MemberUserDetailsService memberUserDetailsService;
    @Autowired
    private PasswordEncoder encoder;

    @GetMapping("profile")
    public String profile(Model model, Authentication auth) {
        log.info(((MemberUser) auth.getPrincipal()).getMember().getPic());

        return "/member/mypage/profile";
    }

    // 프로필 수정 페이지
    @GetMapping("profileModify")
    public void modifyPage() {

    }

    // 프로필 이미지 수정
    @RequestMapping(value = "profileImgModify", method = RequestMethod.POST)
    public String profileImgModify(@RequestParam("uploadFile") MultipartFile file, Model model) throws Exception {
        /****************************************** 프로필 사진 수정 ******************************************/
        String id = SecurityContextHolder.getContext().getAuthentication().getName();
        String savedFileName = "";
        MemberDTO memberDTO = memberService.getMember(id);
        // 1. 파일 저장 경로 설정 : 실제 서비스되는 위치 (프로젝트 외부에 저장)
        String uploadPath = "D:/yesung/intellij/PhotoSYN3/src/main/webapp/resources/member/img/profile/";
        // 2. 원본 파일 이름 알아오기
        String originalFileName = file.getOriginalFilename();
        // 3. 파일 이름 중복되지 않게 이름 변경(서버에 저장할 이름) UUID 사용
        UUID uuid = UUID.randomUUID();
        savedFileName = uuid.toString() + "_" + originalFileName;
        memberDTO.setPic(savedFileName);
        // 4. 파일 생성
        File file1 = new File(uploadPath + savedFileName);
        try {
            if (memberDTO.getPic() != null) {
                log.info("##################################################### 진입");
                File file2 = new File(uploadPath + memberDTO.getPic());
                file2.delete();
                log.info("##################################################### 나가기");
            }
            // 5. 서버로 전송
            file.transferTo(file1);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // DB 저장
        memberService.updateImg(memberDTO);

        return renewalAuth() ? "redirect:/member/mypage/profile" : "redirect:/member/mypage/profile";
    }

    // 프로필 정보 수정
    @RequestMapping(value = "profileInfoModify", method = RequestMethod.POST)
    public String profileInfoModify(Authentication auth, @RequestParam("password") String pw, MemberDTO memberDTO, RedirectAttributes rttr) {
        MemberUser user = (MemberUser) auth.getPrincipal();
        String password = user.getMember().getPw();

        if (encoder.matches(pw, password)) {
            //memberService.updateMember(memberDTO); (에러발생)
        } else {
            rttr.addFlashAttribute("msg", "비밀번호를 다시 확인해 주세요.");
            return "redirect:/member/mypage/profileModify";
        }

        return renewalAuth() ? "redirect:/member/mypage/profile" : "redirect:/member/mypage/profile";
    }

    // 비밀번호 변경
    @GetMapping("updatePw")
    public void updatePw() {

    }

    @PostMapping("updatePwPro")
    public String updatePwPro(Authentication auth, @RequestParam("password1") String pw1, @RequestParam("password2") String pw2,
                              @RequestParam("password3") String pw3, MemberDTO memberDTO, RedirectAttributes rttr) throws Exception {
        MemberUser user = (MemberUser) auth.getPrincipal();
        String password1 = user.getMember().getPw();

        if (encoder.matches(pw1, password1)) {
            if (pw2.equals(pw3)) {
                String changePw = encoder.encode(pw2);
                memberService.updatePw(memberDTO);
                ((MemberUser) auth.getPrincipal()).getMember().setPw(changePw);
            }
        }

        return renewalAuth() ? "redirect:/member/mypage/profile" : "redirect:/member/mypage/profile";
    }

    // 시큐리티 정보 갱신
    private boolean renewalAuth() {
        // 기존 정보 꺼내기
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        MemberUser userAccount = (MemberUser) authentication.getPrincipal(); // principal만 꺼내서다음

        // 현재 Authentication로 사용자 인증 후, 새 Authentication 정보를 SecurityContextHolder에 세팅
        SecurityContextHolder.getContext().setAuthentication(createNewAuthentication(authentication, userAccount.getUsername()));

        return true;
    }

    // 기존 권한과 사용자 id를 받아서, 새 principal로 인증과 토큰 갱신해주는 메서드
    protected Authentication createNewAuthentication(Authentication currentAuth, String username) {
        UserDetails newPrincipal = memberUserDetailsService.loadUserByUsername(username); // DB가서 새로운 정보로 가져와 pricipal 새로만들기
        // 새로운 principal로 시큐리티 인증 권한(토큰) 생성
        UsernamePasswordAuthenticationToken newAuth = new UsernamePasswordAuthenticationToken(newPrincipal, currentAuth.getCredentials(), newPrincipal.getAuthorities());
        newAuth.setDetails(currentAuth.getDetails()); // 현재 정보 추가

        return newAuth;
    }

}
