package com.member.controller;

import com.member.domain.MemberDTO;
import com.member.service.MemberService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/member/*")
@Log4j
public class MemberController {
    @Autowired
    private MemberService memberService;
    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    private BCryptPasswordEncoder encoder;

    @GetMapping("main")
    public void mainPage() {

    }

    @GetMapping("signup")
    public void signupPage() {

    }
    // 회원가입
    @PostMapping("signup")
    public String signupPro(MemberDTO memberDTO, String auth, RedirectAttributes redirectAttributes) throws Exception {
        log.info("************* signupPro memberDTO : " + memberDTO);
        log.info("************* signupPro auth : " + auth);

        int result = memberService.addMember(memberDTO);    // 회원 추가
        memberService.addAuth(auth, memberDTO.getId());     // 권한 추가

        if (result == 1) {
            redirectAttributes.addFlashAttribute("msg", "success");
        }

        return "redirect:/member/login";
    }

    @GetMapping("login")
    public void loginPage(String error, String logout, Model model, HttpServletRequest request) {
        log.info("error :: " + error);
        log.info("logout :: " + logout);

        if (error != null) {
            model.addAttribute("error", "Login Error Check Your Account");
        }
        if (logout != null) {
            model.addAttribute("logout", "Logout!!");
        }

//        String referrer = request.getHeader("Referer");
//        request.getSession().setAttribute("prevPage", referrer);
    }
    
    // 아이디 중복확인
    @ResponseBody
    @GetMapping("idCheck")
    public int idCheck(@RequestParam("id") String id) throws Exception {
        int result = memberService.idCheck(id);

        return result;
    }

    // 닉네임 중복확인
    @ResponseBody
    @PostMapping("nameCheck")
    public int nameCheck(@RequestParam("name") String name) throws Exception {
        return memberService.nameCheck(name);
    }

    // 접근 제한시 보여줄 페이지 경로 매핑
    @GetMapping("accessError")
    public void accessError(Authentication auth) {
        log.info("########## 접근제한 ##########: " + auth);
    }

    /* *********************************** 비밀번호 (이메일 전송, 변경)  *********************************** */
    // 비밀번호 찾기 페이지
    @RequestMapping(value = "searchPw", method = RequestMethod.GET)
    public void searchPwPage() {

    }

    // 임시 비밀번호 이메일 전송
    @RequestMapping(value = "searchPwPro", method = RequestMethod.POST)
    public ModelAndView sendEmailAction(@RequestParam Map<String, Object> paramMap, ModelMap model, ModelAndView mv,
                                        HttpServletResponse response, MemberDTO memberDTO) throws Exception {
        String id = (String) paramMap.get("id");
        String name = (String) paramMap.get("name");
        String password = "";

        memberDTO.setId(id);

        if (memberDTO.getId().equals(id)) {
            for (int i = 0; i < 12; i++) {
                password += (char) ((Math.random() * 26) + 97);
            }
            memberDTO.setPw(encoder.encode(password));

        }

        try {
            MimeMessage msg = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");

            messageHelper.setSubject(name + "님 임시 비밀번호 발급 안내드립니다.");
            messageHelper.setText("임시 비밀번호는 " + password + " 입니다.");
            messageHelper.setTo(id);
            msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(id));
            mailSender.send(msg);

        } catch (MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        }
        memberService.updatePw(memberDTO);

        mv.setViewName("/member/login");
        return mv;
    }


}
