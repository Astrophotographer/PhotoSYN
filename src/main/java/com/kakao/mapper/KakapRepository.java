package com.kakao.mapper;

import com.kakao.domain.KakaoDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

/*
@Repository
public class KakapRepository {

    @Autowired
    private SqlSessionTemplate sql;

    // 카카오 로그인
    public void kakaoInsert(HashMap<String, Object> userInfo) {
        sql.insert("Kakao.kakaoInsert", userInfo);
    }

    // 카카오 확인
    public KakaoDTO findKakao(HashMap<String, Object> userInfo) {
        return sql.selectOne("Kakao.findKakao", userInfo);
    }

    public KakaoDTO kakaoNumber(KakaoDTO userInfo) {
        return sql.selectOne("Kakao.kakaoNumber", userInfo);
    }

}
*/