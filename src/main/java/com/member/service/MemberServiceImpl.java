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

import javax.servlet.http.HttpServletResponse;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberMapper memberMapper;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

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
        // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
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

    // 비밀번호 찾기 이메일 발송
    @Override
    public void sendEmail(MemberDTO memberDTO, String div) throws Exception {
        // Mail Server 설정
        String charSet = "utf-8";
        String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
        String hostSMTPid = "서버 이메일 주소(보내는 사람 이메일 주소)";
        String hostSMTPpwd = "서버 이메일 비번(보내는 사람 이메일 비번)";

        // 보내는 사람 EMail, 제목, 내용
        String fromEmail = "보내는 사람 이메일주소(받는 사람 이메일에 표시됨)";
        String fromName = "프로젝트이름 또는 보내는 사람 이름";
        String subject = "";
        String msg = "";

        if (div.equals("findpw")) {
            subject = "베프마켓 임시 비밀번호 입니다.";
            msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
            msg += "<h3 style='color: blue;'>";
            msg += memberDTO.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
            msg += "<p>임시 비밀번호 : ";
            msg += memberDTO.getPw() + "</p></div>";
        }

        // 받는 사람 E-Mail 주소
        String mail = memberDTO.getId();
        try {
            HtmlEmail email = new HtmlEmail();
            email.setDebug(true);
            email.setCharset(charSet);
            email.setSSL(true);
            email.setHostName(hostSMTP);
            email.setSmtpPort(465); // 네이버 이용시 587

            email.setAuthentication(hostSMTPid, hostSMTPpwd);
            email.setTLS(true);
            email.addTo(mail, charSet);
            email.setFrom(fromEmail, fromName, charSet);
            email.setSubject(subject);
            email.setHtmlMsg(msg);
            email.send();
        } catch (Exception e) {
            System.out.println("메일발송 실패 : " + e);
        }
    }

    /* 비밀번호 찾기 */
    @Override
    public void findPw(HttpServletResponse httpServletResponse, MemberDTO memberDTO) throws Exception {
        httpServletResponse.setContentType("text/html;charset=utf-8");
        MemberDTO dto = memberMapper.getMember(memberDTO.getId());
        PrintWriter out = httpServletResponse.getWriter();
        // 가입된 아이디가 없으면
        /*
        if (memberMapper.idCheck(memberDTO.getId()) == null) {
            out.print("등록되지 않은 아이디입니다.");
            out.close();
        }
        // 가입된 이메일이 아니면
        else if (!memberDTO.getId().equals(dto.getId())) {
            out.print("등록되지 않은 이메일입니다.");
            out.close();
        } else {
            // 임시 비밀번호 생성
            String pw = "";
            for (int i = 0; i < 12; i++) {
                pw += (char) ((Math.random() * 26) + 97);
            }
            memberDTO.setPw(pw);
            // 비밀번호 변경
            memberMapper.updatePw(memberDTO);
            // 비밀번호 변경 메일 발송
            sendEmail(memberDTO, "findpw");

            out.print("이메일로 임시 비밀번호를 발송하였습니다.");
            out.close();
        }*/
    }


}
