package com.blog.domain;

import lombok.Data;

@Data
public class Blog_Criteria {
//    private String option_reg;  // 등록일  latest/ oldest
//    private String option_like; // 좋아요  popular/ unpopular
//    private String option_view; // 조회수  highest_view/ lowest_view
    private String u_id;    //유저 아이디
    private String option;  //reg, like, readcount
    private String sort;    //high(latest/ popular/ highest_view), low(oldest/ unpopular/ lowest_view)

}
