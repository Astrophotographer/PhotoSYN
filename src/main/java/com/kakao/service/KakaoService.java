package com.kakao.service;

import com.kakao.domain.KakaoDTO;

import java.util.HashMap;

public interface KakaoService {
    public String getAccessToken(String code);
    public HashMap<String, String> getUserInfo(String access_token);

    //public KakaoDTO kakaoNumber(KakaoDTO userInfo);
    public void kakaoInsert(HashMap<String, String> userInfo);
    //public KakaoDTO findKakao(HashMap<String, Object> userInfo);
}
