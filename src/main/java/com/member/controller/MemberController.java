package com.member.controller;

import com.member.domain.MemberDTO;
import com.member.service.MemberService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/member/*")
@Log4j
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("main")
    public void mainPage() {

    }

    @GetMapping("signup")
    public void signupPage() {

    }

    @PostMapping("signup")
    public String signupPro(MemberDTO memberDTO, String auth, RedirectAttributes redirectAttributes) {
        log.info("************* signupPro memberDTO : " + memberDTO);
        log.info("************* signupPro auth : " + auth);

        int result = memberService.addMember(memberDTO);    // 회원 추가
        memberService.addAuth(auth, memberDTO.getId());     // 권한 추가

        if (result == 1) {
            redirectAttributes.addFlashAttribute("msg", "success");
        }

        return "redirect:/member/main";
    }

    @GetMapping("login")
    public void loginPage(String error, String logout, Model model) {
        log.info("error" + error);
        log.info("logout" + logout);

        if (error != null) {
            model.addAttribute("error", "Login Error Check Your Account");
        }
        if (logout != null) {
            model.addAttribute("logout", "Logout!!");
        }
    }

    @GetMapping("/member/idCheck")
    @ResponseBody
    public int idCheck(@RequestParam("id") String id, HttpServletRequest req, HttpServletResponse httpServletResponse, HttpSession session) {
        int result = memberService.idCheck(id);

        return result;

    }

    // 접근 제한시 보여줄 페이지 경로 매핑
    @GetMapping("accessError")
    public void accessError(Authentication auth) {
        log.info("########## 접근제한 ##########: " + auth);
    }

    /************************************ 카카오 로그인 ************************************/
    @RequestMapping(value = "kakao_callback", method = RequestMethod.GET)
    public String kakaoLogin(@RequestParam(value = "code") String code, HttpSession session,
                             HttpServletRequest request) throws Exception {
        // 접속 토큰 get
        System.out.println("### code ### :: " + code);
        String access_token = memberService.getAccessToken(code);

        // 접속자 정보 get
        MemberDTO memberDTO = memberService.getUserInfo(access_token);
        memberService.kakaoInsert(memberDTO);

        // 닉네임이 존재할 때, 세션에 해당 닉네임과 토큰 등록. (닉네임 == 필수동의)
        if (memberDTO.getName() != null) {
            session.setAttribute("nickname", memberDTO.getName());
            session.setAttribute("access_token", access_token);
            // 없으면 회원가입 -> 회원가입 폼에 카카오에서 받은 email, nickname, thumbnail 보내놓기
        } else {
            return "/member/signup";
        }

        return "redirect:/member/main";

    }

    // 비밀번호 찾기 및 임시 비밀번호 발급 (Gmail)
    /* 비밀번호 찾기 */
    @RequestMapping(value = "findpw", method = RequestMethod.GET)
    public void findPwGET() throws Exception {

    }

    @RequestMapping(value = "findpw", method = RequestMethod.POST)
    public void findPwPOST(@ModelAttribute MemberDTO memberDTO, HttpServletResponse response) throws Exception {
        memberService.findPw(response, memberDTO);

    }

}
