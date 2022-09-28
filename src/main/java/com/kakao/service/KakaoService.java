package com.kakao.service;

import com.kakao.domain.KakaoDTO;

import java.util.HashMap;

public interface KakaoService {
    public String getAccessToken(String code);
    //public HashMap<String, String> getUserInfo(String access_token);
    public KakaoDTO getUserInfo(String access_token);
    public void kakaoInsert(KakaoDTO userInfo);
    public void kakaoLogout(String access_token);
}
