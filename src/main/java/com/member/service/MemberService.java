package com.member.service;

import com.member.domain.MemberDTO;

import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Member;

public interface MemberService {
    // 카카오 로그인 & 로그아웃
    public String getAccessToken(String code);
    //public HashMap<String, String> getUserInfo(String access_token);
    public MemberDTO getUserInfo(String access_token);
    public void kakaoInsert(MemberDTO userInfo);
    public void kakaoLogout(String access_token);

    /******************************************************************************************************************/

    // 일반 회원가입
    public int addMember(MemberDTO memberDTO);
    // 회원 접근 권한 추가
    public int addAuth(String auth, String id);
    // 회원정보 한명 가져오기
    public MemberDTO getMember(String id);
    // 회원 정보 수정
    public int modifyMember(MemberDTO memberDTO);
    // 회원 탈퇴
    public int deleteMember(MemberDTO memberDTO);
    // 아이디 중복 확인
    public int idCheck(String id);


    // 이메일 발송
    public void sendEmail(MemberDTO vo, String div) throws Exception;
    // 비밀번호 찾기
    public void findPw(HttpServletResponse httpServletResponse, MemberDTO memberDTO) throws Exception;
}
