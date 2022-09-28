package com.kakao.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import com.kakao.domain.KakaoDTO;
import com.kakao.mapper.KakaoRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class KakaoServiceImpl implements KakaoService {

    @Autowired
    private KakaoRepo kakaoRepo;


    @Override
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
            sb.append("&client_id=c67a03f0334b4eff20b7eb96995f64dd");               // 앱 KEY VALUE
            sb.append("&redirect_uri=http://localhost:8080/member/loginPro");       // 앱 CALLBACK 경로
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

    @Override
    public KakaoDTO getUserInfo(String access_token) {
        // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        KakaoDTO kakaoDTO = new KakaoDTO();
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
            kakaoDTO.setEmail(kakao_account.getAsJsonObject().get("email").getAsString());
            kakaoDTO.setName(properties.getAsJsonObject().get("nickname").getAsString());
            kakaoDTO.setImage(properties.getAsJsonObject().get("thumbnail_image").getAsString());

        } catch (IOException e) {
            e.printStackTrace();
        }

        return kakaoDTO;
    }

    @Override
    public void kakaoInsert(KakaoDTO userInfo) {
        kakaoRepo.kakaoInsert(userInfo);
    }

    @Override
    public void kakaoLogout(String access_token) {
        String reqURL = "https://kapi.kakao.com/v1/user/logout";

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


}
