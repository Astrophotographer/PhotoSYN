package com.member.controller;

import com.gallery.domain.GalleryDTO;
import com.gallery.service.GalleryService;
import com.member.domain.*;
import com.member.security.MemberUser;
import com.member.security.MemberUserDetailsService;
import com.member.service.MemberService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/member/mypage/*")
@Log4j
public class MypageController {
    private static final String uploadPath = "D:/yesung/intellij/PhotoSYN3/src/main/webapp/resources/member/img/";
    @Autowired
    private MemberService memberService;
    @Autowired
    private GalleryService galleryService;
    @Autowired
    private MemberUserDetailsService memberUserDetailsService;
    @Autowired
    private BCryptPasswordEncoder encoder;

    @GetMapping("profile")
    public String profile(Model model, Authentication auth, GalleryDTO galleryDTO, BuyDTO buyDTO) {
        MemberUser user = (MemberUser) auth.getPrincipal();
        log.info("########################################## :: " + buyDTO);

        buyDTO.setId(user.getMember().getId());
        int result = memberService.sum(buyDTO);
        model.addAttribute("tot", result);
        log.info("########################################## :: " + buyDTO);
        log.info("########################################## :: " + result);

        return "/member/mypage/profile";
    }

    /****************************************** 프로필 사진 수정 ******************************************/
    // 프로필 수정 페이지
    @GetMapping("profileModify")
    public void modifyPage() {

    }

    // 프로필 이미지 수정
    @PostMapping("profileModify")
    public String profileImgModify(MultipartHttpServletRequest request,
                                   @RequestParam("pw") String pw, MemberDTO memberDTO, RedirectAttributes rttr, Authentication auth) throws Exception {
        MemberUser user = (MemberUser) auth.getPrincipal();
        String pic = user.getMember().getPic(); // 기존사진
        String password = user.getMember().getPw();

        if (encoder.matches(pw, password)) {
            memberDTO.setId(user.getMember().getId());
            memberService.updateMember(memberDTO); // 일반 정보 업데이트

            try {
                // 전송한 파일 정보 꺼내기
                MultipartFile mf = request.getFile("uploadFile");
                log.info("*************************** mf :  " + mf.isEmpty()); // 보낸 이미지 파일 없다 -> 사용자가 수정안함 == true

                // 새로 수정하는 이미지파일이 있을 경우
                if (!mf.isEmpty()) { // 이미지보냄 == !false == true == if문 실행 == 파일 새로 저장 db에도 수정
                    // 이미지 안보냄 == !true == false == if문 실행안함 == 파일 수정안하면 저장,db수정도 안함

                    // 기존 파일 지우기 (미등록 : user.png 지우면 안됨. 등록한적있다 : 기존 이미지 파일 지우기 )
                    if (!pic.equals("user.png")) {
                        // 경로에 있는 유저 프로필 사진 가져와서
                        File file2 = new File(uploadPath + pic);
                        // 원래 파일 삭제
                        file2.delete();
                    }
                    String savedFileName = "";
                    // 1. 원본 파일 이름 알아오기
                    String originalFileName = mf.getOriginalFilename();
                    // 1-1. 원본파일에서 확장자명만 알아오기
                    String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
                    log.info("*************************** ext : " + ext);
                    // 2. 파일 이름 중복되지 않게 이름 변경(서버에 저장할 이름) UUID 사용
                    UUID uuid = UUID.randomUUID();
                    savedFileName = uuid.toString() + ext;
                    // 3. 파일 생성
                    File file1 = new File(uploadPath + savedFileName);
                    // 4. 서버로 전송
                    mf.transferTo(file1);

                    memberDTO.setPic(savedFileName); // db에 update 시키기전에 dto에 저장한 이름 추가하기

                    // DB 저장
                    memberService.updateImg(memberDTO); // 사진 업데이트
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            renewalAuth(); // 갱신!!

        } else {
            rttr.addFlashAttribute("msg", "비밀번호를 다시 확인해 주세요.");

            return "redirect:/member/mypage/profileModify";
        }

        return "redirect:/member/mypage/profile";
    }


    // 닉네임 중복확인
    @ResponseBody
    @PostMapping("nameCheck")
    public int nameCheck(@RequestParam("name") String name) throws Exception {
        return memberService.nameCheck(name);
    }


    @GetMapping("updatePw")
    public void updatePwPage() {

    }

    // 비밀번호 변경
    @PostMapping("updatePwPro")
    public String updatePwPro(Authentication auth,
                              @RequestParam("pw1") String pw1,
                              @RequestParam("pw2") String pw2,
                              @RequestParam("pw3") String pw3, MemberDTO memberDTO, RedirectAttributes rttr) throws Exception {

        MemberUser user = (MemberUser) auth.getPrincipal();
        String password = user.getMember().getPw();

        // 현재 비밀번호와 새 비밀번호 둘 다 일치할 때, 비밀번호 변경
        if (encoder.matches(pw1, password) && pw2.equals(pw3)) {
            String changePw = encoder.encode(pw2);
            memberDTO.setPw(changePw);
            memberDTO.setId(user.getMember().getId());
            memberService.updatePw(memberDTO);
            ((MemberUser) auth.getPrincipal()).getMember().setPw(changePw);
            rttr.addFlashAttribute("msg1", "비밀번호 변경이 완료되었습니다.");
        }
        // 현재 비밀번호는 일치하지만 새 비밀번호가 일치하지 않음.
        if (encoder.matches(pw1, password) && !pw2.equals(pw3)) {
            rttr.addFlashAttribute("msg2", "새 비밀번호가 일치하지 않습니다.");
            return "redirect:/member/mypage/updatePw";
        }
        // 새 비밀번호는 일치하지만 현재 비밀번호가 일치하지 않음.
        if (!encoder.matches(pw1, password) && pw2.equals(pw3)) {
            rttr.addFlashAttribute("msg3", "현재 비밀번호가 일치하지 않습니다.");
            return "redirect:/member/mypage/updatePw";
        }
        renewalAuth();

        return "redirect:/member/mypage/profile";
    }

    // 포인트 충전 페이지
    @GetMapping("profilePointAdd")
    public void pointAddPage() {

    }

    // 포인트 충전
    @PostMapping("profilePointAddPro")
    public String pointAdd(Authentication auth, MemberDTO memberDTO, String point) {
        MemberUser user = (MemberUser) auth.getPrincipal();
        memberDTO.setId(user.getMember().getId());
        int pointAdd = Integer.parseInt(point);
        memberDTO.setPoint(pointAdd);
//        user.getMember().setPoint(pointAdd);

        memberService.updatePoint(memberDTO);
        renewalAuth();

        return "redirect:/member/mypage/profile";
    }

    // 회원 탈퇴 페이지
    @GetMapping("profileDelete")
    public void profileDeletePage() {

    }

    // 회원 탈퇴
    @PostMapping("deletePro")
    public String memberDelete(MemberDTO memberDTO, @AuthenticationPrincipal MemberUser memberUser) throws Exception {
        memberDTO.setId(memberUser.getUsername());
        int result = memberService.deleteMember(memberDTO);

        SecurityContextHolder.clearContext(); // 인증 객체 초기화

        return "redirect:/member/main";
    }


    /************************************************ 장바구니 ************************************************/

    /* 장바구니 담기 */
    @ResponseBody
    @PostMapping("insertCart")
    public String insertCart(@RequestParam("G_NO") Long G_NO) {
        memberService.insertCart(G_NO);

        return "success";
    }

    // 장바구니 목록 페이지
    @GetMapping("profileCart")
    public String listCart(Authentication auth, CartDTO cartDTO, Model model) {
        MemberUser user = (MemberUser) auth.getPrincipal();

        List<CartDTO> list = memberService.listCart(cartDTO);
        cartDTO.setU_id(user.getMember().getId());
        model.addAttribute("list", list);

        return "/member/mypage/profileCart";
    }

    /* 장바구니 삭제 */
    @RequestMapping(value = "deleteCart", method = RequestMethod.POST)
    public String deleteCart(HttpServletRequest request) {
        String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;

        for (int i = 0; i < size; i++) {
            memberService.deleteCart(ajaxMsg[i]);
        }

        return "redirect:/member/mypage/profileCart";
    }

    /************************************************ END. ************************************************/

    // 마이페이지 구매내역
    @GetMapping("profileBuy")
    public void buy(Authentication auth, Model model, MemberCriteria memberCriteria) {
        MemberUser user = (MemberUser) auth.getPrincipal();
        String id = user.getMember().getId();
        int total = memberService.getGalleryCount(memberCriteria);

        memberCriteria.setId(id);
        model.addAttribute("list", memberService.getListWithPaging(memberCriteria));
        model.addAttribute("pager", new MemberPageDTO(memberCriteria, total));
    }

    // 마이페이지 판매내역
    @GetMapping("profileSell")
    public void sell(Authentication auth, GalleryDTO galleryDTO, Model model, MemberCriteria memberCriteria) {
        MemberUser user = (MemberUser) auth.getPrincipal();
        String id = user.getMember().getId();
        int total = memberService.getGalleryCount(memberCriteria);

        memberCriteria.setId(id);
        model.addAttribute("list", memberService.getListWithPaging(memberCriteria));
        model.addAttribute("pager", new MemberPageDTO(memberCriteria, total));
    }

    // 갤러리 구매 (포인트 차감)
    @PostMapping("galleryBuyBtn")
    public String galleryBuyBtn(Authentication auth, GalleryDTO galleryDTO, BuyDTO buyDTO, RedirectAttributes rttr, HttpServletRequest request) {
        MemberUser user = (MemberUser) auth.getPrincipal();
        String id = user.getMember().getId();
        int m = user.getMember().getPoint();

        String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;

        if (m < galleryDTO.getG_HPRICE()) {
            rttr.addFlashAttribute("notPoint", "포인트가 부족합니다.");

            return "redirect:/member/mypage/profilePointAdd";
        } else {
            m = m - galleryDTO.getG_HPRICE();
            user.getMember().setPoint(m);

            buyDTO.setO_buyer(id);
            buyDTO.setG_no(galleryDTO.getG_NO());

            // 구매 내역 저장
            for (int i = 0; i < size; i++) {
                buyDTO.setG_no(Long.parseLong(ajaxMsg[i]));
                galleryService.buyGallery(galleryDTO.getG_NO());
                memberService.buyGallery(buyDTO, id);
            }

            // 구매 후, 장바구니 내역 삭제
            for (int i = 0; i < size; i++) {
                memberService.deleteCart(ajaxMsg[i]);
            }

            // 시큐리티 정보 갱신
            renewalAuth();

            return "redirect:/member/mypage/profile";
        }
    }

    /************************************************ 마이페이지 글 관리 ************************************************/
    /* 마이페이지 갤러리 관리 페이지 */
    @GetMapping("profileGallery")
    public void galleryListPage(Authentication auth, MemberDTO memberDTO, Model model) {
        MemberUser user = (MemberUser) auth.getPrincipal();
        memberDTO.setId(user.getMember().getId());
        String id = memberDTO.getId();

        List<GalleryDTO> list = memberService.galleryList(id);
        model.addAttribute("list", list);
    }

    /* 마이페이지 갤러리 관리 상태 변경 (숨김처리) */
    @RequestMapping(value = "profileGalleryStatus1", method = RequestMethod.POST)
    public String galleryStatus1(HttpServletRequest request) {
        String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;

        for (int i = 0; i < size; i++) {
            memberService.updateGalleryStatus1(ajaxMsg[i]);
        }

        return "redirect:/member/mypage/profileGallery";
    }

    /* 마이페이지 갤러리 관리 상태 변경 (판매중) */
    @RequestMapping(value = "profileGalleryStatus2", method = RequestMethod.POST)
    public String galleryStatus2(HttpServletRequest request) {
        String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;

        for (int i = 0; i < size; i++) {
            memberService.updateGalleryStatus2(ajaxMsg[i]);
        }

        return "redirect:/member/mypage/profileGallery";
    }

    /* 블로그 관리 */


    /************************************************ 시큐리티 정보 갱신 ************************************************/
    public boolean renewalAuth() {
        // 기존 정보 꺼내기
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        MemberUser userAccount = (MemberUser) authentication.getPrincipal(); // principal만 꺼내서 담기

        // 현재 Authentication로 사용자 인증 후, 새 Authentication 정보를 SecurityContextHolder에 세팅
        SecurityContextHolder.getContext().setAuthentication(createNewAuthentication(authentication, userAccount.getUsername()));

        return true;
    }

    /* 기존 권한과 사용자 id를 받아서,  new principal로 인증과 토큰 갱신해주는 메서드 */
    public Authentication createNewAuthentication(Authentication currentAuth, String username) {
        UserDetails newPrincipal = memberUserDetailsService.loadUserByUsername(username); // DB 가서 새로운 정보로 가져와 pricipal 새로 만들기
        // 새로운 principal로 시큐리티 인증 권한(토큰) 생성
        UsernamePasswordAuthenticationToken newAuth = new UsernamePasswordAuthenticationToken(newPrincipal, currentAuth.getCredentials(), newPrincipal.getAuthorities());
        newAuth.setDetails(currentAuth.getDetails()); // 현재 정보 추가

        return newAuth;
    }

}


