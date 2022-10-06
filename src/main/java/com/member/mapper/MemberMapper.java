package com.member.mapper;

import com.member.domain.AuthDTO;
import com.member.domain.MemberDTO;

public interface MemberMapper {
    // 회원가입
    public int addMember(MemberDTO memberDTO);

    // 회원 정보 한명 가져오기 (접근 권한까지)
    public MemberDTO getMember(String id);

    // 회원 접근 권한 추가
    public int addAuth(AuthDTO auth);

    // 회원 정보 수정
    public int updateMember(MemberDTO memberDTO);

    // 회원 정보 삭제
    public int deleteMember(String id);

    // 회원 권한 삭제
    public int deleteAuth(String id);

    // 아이디 & 비밀번호 확인
    public int idCheck(String id);

    // 비밀번호 변경
    public int updatePw(MemberDTO memberDTO) throws Exception;


    // 프로필 사진 변경
    public int updateImg(String id, String pic) throws Exception;

}
