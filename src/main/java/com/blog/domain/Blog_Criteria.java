package com.blog.domain;

import lombok.Data;

@Data
public class Blog_Criteria {
//    private String option_reg;  // 등록일  latest/ oldest
//    private String option_like; // 좋아요  popular/ unpopular
//    private String option_view; // 조회수  highest_view/ lowest_view
    private String u_id;    //유저 아이디    usermain보기 위한 아이디 저장.
    private String option;  //reg, like, readcount
    private String sort;    //high(latest/ popular/ highest_view), low(oldest/ unpopular/ lowest_view)

    //한 페이지당 게시판글 10개 불러오기
    private int pageNum;
    private int listQty;

    public Blog_Criteria() {
        this(1, 10);
    }

    public Blog_Criteria(int pageNum, int listQty) {
        this.pageNum = pageNum;
        this.listQty = listQty;
    }

}
