package com.admin.domain;

import lombok.Data;

import java.sql.Timestamp;

//admin main 단에서 뿌려줘야할 데이터
@Data
public class AdminMainDTO {
    private int userCount;
    private int salesCount;
    private int recentGalleryCount;
    private int recentBlogCount;
//    private String u_id;    //유저 아이디(이메일)
//    private String u_name;  //유저 닉네임
//    private int membership; //유저 등급
//    private int status;     //유저 상태
//    private Timestamp reg;
}
