package com.blog.domain;

import lombok.Data;

@Data
public class Blog_Img {
    private long BI_NO;
    private long B_NO;
    private String BI_NAME;
    private int BI_MAIN;    //메인 사진인지 확인.
    private String BI_UUID; // 사진 고유번호
    private String BI_ORIGINNAME;   //사진 원본 이름
}
