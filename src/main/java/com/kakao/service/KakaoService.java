package com.kakao.service;

import com.kakao.domain.KakaoDTO;

import java.util.HashMap;

public interface KakaoService {
    public String getAccessToken(String code);
    public HashMap<String, Object> getUserInfo(String access_token);
}
