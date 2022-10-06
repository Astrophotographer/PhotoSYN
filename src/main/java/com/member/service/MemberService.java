package com.member.service;

import com.member.domain.MemberDTO;

import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Member;

public interface MemberService {
    // 회원가입
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

    // 비밀번호 변경
    public int updatePw(MemberDTO memberDTO) throws Exception;

    // 프로필 사진 변경
    public int updateImg(String id, String pic) throws Exception;

}
