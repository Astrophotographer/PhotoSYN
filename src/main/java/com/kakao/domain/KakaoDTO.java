package com.kakao.domain;

import lombok.Data;

import java.sql.Timestamp;
import java.util.List;

@Data
public class KakaoDTO {
    private String id;
    private String name;
    private String pic;
    /* 추가 */
    private String pw;
    private String phone;
    private Timestamp reg;
    private int status;
    private int point;
    private int membership;
    private String sns;
    private String snsToken;


}
