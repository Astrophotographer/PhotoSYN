package com.member.domain;

import lombok.Data;

import java.sql.Timestamp;
import java.util.List;

@Data
public class MemberDTO {
    private String id;      // 이메일        (카카오 == 선택동의)
    private String name;    // 닉네임        (카카오 == 필수동의)
    private String pic;     // 프로필 사진    (카카오 == 선택동의)
    private String pw;      // 비밀번호
    private String phone;   // 전화번호
    private Timestamp reg;  // 가입일자
    private int status;     // 회원상태
    private int point;      // 포인트
    private int membership; // 회원등급
    private String sns;     // SNS 종류
    private String snsToken;// SNS 토큰
    private List<AuthDTO> authDTOList; // 여러 권한 저장 가능한 변수
}
