package com.kakao.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import com.kakao.domain.KakaoDTO;
import com.kakao.mapper.KakapRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class KakaoServiceImpl implements KakaoService {

    @Configuration
    @ComponentScan({"com.kakao.mapper"})
    class ComponentScanConfiguration {
    }

    private KakapRepository kakapRepository;

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
            sb.append("&client_id=c67a03f0334b4eff20b7eb96995f64dd");   // 앱 KEY VALUE
            sb.append("&redirect_uri=http://localhost:8080/login");     // 앱 CALLBACK 경로
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
    public HashMap<String, Object> getUserInfo(String access_token) {
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_token);

            int responseCode = conn.getResponseCode();
            System.out.println(" getUserInfo responseCode :: " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String br_line = "";
            String result = "";

            while ((br_line = br.readLine()) != null) {
                result += br_line;
            }
            //System.out.println("response:" + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String id = element.getAsJsonObject().get("id").getAsString();
            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String thumbnail_image = properties.getAsJsonObject().get("thumbnail_image").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();

            userInfo.put("id", id);
            userInfo.put("nickname", nickname);
            userInfo.put("thumbnail_image", thumbnail_image);
            userInfo.put("email", email);

        } catch (IOException e) {
            e.printStackTrace();
        }
        /*
        // 먼저 정보가 저장되어 있는지 확인.
        KakaoDTO result = kakapRepository.findkakao(userInfo);
        System.out.println("S:" + result);

        if (result == null) {
            // result가 null이면 정보가 저장이 안 되어 있어서 정보를 저장.
            kakapRepository.kakaoinsert(userInfo);
            // 위 코드가 정보를 저장하기 위해 Repository로 보내는 코드임.
            return kakapRepository.findkakao(userInfo);
            // 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
            //  result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
        } else {

            // 정보가 이미 있기 때문에 result를 리턴함.
        }
        s
         */
            return userInfo;
    }

}
