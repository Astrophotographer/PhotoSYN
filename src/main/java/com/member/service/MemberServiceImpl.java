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
    /*
    public String getAccessToken(String code) {
        String access_token = "";
        String refresh_token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //HttpURLConnection 설정 값 셋팅
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            // buffer 스트림 객체 값 셋팅 후 요청
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=c67a03f0334b4eff20b7eb96995f64dd");                       // 앱 KEY VALUE
            sb.append("&redirect_uri=http://localhost:8080/member/kakao_callback");       // 앱 CALLBACK 경로
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            // 결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println(" getAccessToken responseCode :: " + responseCode);

            //  RETURN 값 result 변수에 저장
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String br_line = "";
            String result = "";

            while ((br_line = br.readLine()) != null) {
                result += br_line;
            }

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            // 토큰 값 저장 및 리턴
            access_token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();

            br.close();
            bw.close();

        } catch (IOException e) {
            e.printStackTrace();
        }

        return access_token;
    }

    public MemberDTO getUserInfo(String access_token) {
        MemberDTO memberDTO = new MemberDTO();
        String reqURL = "https://kapi.kakao.com/v2/user/me";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            // 요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_token);

            int responseCode = conn.getResponseCode();
            System.out.println(" getUserInfo responseCode :: " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String br_line = "";
            String result = "";

            while ((br_line = br.readLine()) != null) {
                result += br_line;
            }

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            //kakaoDTO.setId(element.getAsJsonObject().get("id").getAsLong());
            memberDTO.setId(kakao_account.getAsJsonObject().get("email").getAsString());
            memberDTO.setName(properties.getAsJsonObject().get("nickname").getAsString());
            memberDTO.setPic(properties.getAsJsonObject().get("thumbnail_image").getAsString());

        } catch (IOException e) {
            e.printStackTrace();
        }

        return memberDTO;
    }

    public void kakaoInsert(MemberDTO userInfo) {
        memberMapper.kakaoInsert(userInfo);
    }

    public void kakaoLogout(String access_token) {
        String reqURL = "https://kapi.kakao.com/v1/user/member/logout";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + access_token);

            int responseCode = conn.getResponseCode();
            System.out.println("kakaoLogout responseCode :: " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String result = "";
            String line = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println(result);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    */ // 카카오 로그인
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
    public int modifyMember(MemberDTO memberDTO) {
        // id pw 체크 추가
        int result = 0;

        MemberDTO dataMember = getMember(memberDTO.getId());
        if (bCryptPasswordEncoder.matches(memberDTO.getPw(), dataMember.getPw())) {
            result = memberMapper.updateMember(memberDTO);
        }
        return result;
    }

    @Override
    public int deleteMember(MemberDTO memberDTO) {
        int result = 0;
        MemberDTO dataMember = getMember(memberDTO.getId());
        if (bCryptPasswordEncoder.matches(memberDTO.getPw(), dataMember.getPw())) {
            result = 1;
            // FK 제약조건 때문에 Auth먼저 삭제하고 member 삭제
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
    public int updateImg(String id, String pic) throws Exception {
        return memberMapper.updateImg(id, pic);
    }


}
