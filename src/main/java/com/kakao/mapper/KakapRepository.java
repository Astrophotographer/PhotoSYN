package com.kakao.mapper;

import com.kakao.domain.KakaoDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository
public class KakapRepository {

    @Autowired
    private SqlSessionTemplate sql;

    // 정보 저장
    public void kakaoinsert(HashMap<String, Object> userInfo) {
        sql.insert("com.kakao.mapper.kakaoInsert", userInfo);
    }

    // 정보 확인
    public KakaoDTO findkakao(HashMap<String, Object> userInfo) {

        return sql.selectOne("com.kakao.mapper.findKakao", userInfo);
    }

}
