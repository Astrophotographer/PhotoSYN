package com.member.service;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

import com.member.domain.AuthDTO;
import com.member.domain.MemberDTO;
import com.member.mapper.MemberMapper;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.extern.log4j.Log4j;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberMapper memberMapper;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public int addMember(MemberDTO memberDTO) {
        memberDTO.setPw(bCryptPasswordEncoder.encode(memberDTO.getPw())); // 비밀번호 암호화

        return memberMapper.addMember(memberDTO);
    }

    @Override
    public int addAuth(String auth, String id) {
        int result = -1;
        AuthDTO authDTO = new AuthDTO();
        authDTO.setId(id);

        // 일반회원 가입시 권한 추가
        if (auth.equals("member")) {
            authDTO.setAuth("ROLE_MEMBER");
            result = memberMapper.addAuth(authDTO);
            // 관리자로 가입시 권한 추가
        } else if (auth.equals("admin")) {
            authDTO.setAuth("ROLE_MEMBER");
            result = memberMapper.addAuth(authDTO);
            authDTO.setAuth("ROLE_ADMIN");
            result = memberMapper.addAuth(authDTO);
        }

        return result;
    }

    @Override
    public MemberDTO getMember(String id) {
        return memberMapper.getMember(id);
    }

    @Override
    public void updateMember(MemberDTO memberDTO) {
//        MemberDTO dataMember = getMember(memberDTO.getId());
//        if (bCryptPasswordEncoder.matches(memberDTO.getPw(), dataMember.getPw())) {
//        }
        memberMapper.updateMember(memberDTO);
    }

    @Override
    public int deleteMember(MemberDTO memberDTO) {
        int result = 0;
        MemberDTO dataMember = getMember(memberDTO.getId());
        if (bCryptPasswordEncoder.matches(memberDTO.getPw(), dataMember.getPw())) {
            result = 1;
            // FK 제약조건 때문에 Auth 먼저 삭제하고 member 삭제
            int deleteRes = memberMapper.deleteAuth(memberDTO.getId());
            log.info("********** delete member auth res : " + deleteRes);
            deleteRes = memberMapper.deleteMember(memberDTO.getId());
            log.info("********** delete member res : " + deleteRes);
        }
        return result;
    }

    @Override
    public int idCheck(String id) {
        return memberMapper.idCheck(id);
    }

    // 비밀번호 변경
    @Override
    public int updatePw(MemberDTO memberDTO) throws Exception {
        return memberMapper.updatePw(memberDTO);
    }

    @Override
    public int updateImg(MemberDTO memberDTO) throws Exception {
        return memberMapper.updateImg(memberDTO);
    }


}
