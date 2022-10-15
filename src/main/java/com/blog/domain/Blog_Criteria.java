package com.blog.domain;

import lombok.Data;

@Data
public class Blog_Criteria {
//    private String option_reg;  // 등록일  latest/ oldest
//    private String option_like; // 좋아요  popular/ unpopular
//    private String option_view; // 조회수  highest_view/ lowest_view
    private String u_id;    //유저 아이디    usermain보기 위한 아이디 저장.

    //수정 전
    // 옵션 + 정렬
//    private String option;  //reg, like, readcount
//    private String sort;    //high(latest/ popular/ highest_view), low(oldest/ unpopular/ lowest_view)

    //수정후
    // 옵션만
    // 최신순, 오래된순, 좋아요순, 조회순
    private String option;  //latest, oldest, like, readcount

    //검색 옵션 및 검색어
    private String searchOpt;   //검색옵션 : ID, MainTag, Subject, SubTag
    private String searchStr;   //검색어

    //검색옵션들 배열로 저장
    public String[] getSearchOptArr(){
        return searchOpt == null ? new String[] {} : searchOpt.split("");
    }

    //한 페이지당 게시판글 10개 불러오기
    private int pageNum;
    private int listQty;

    public Blog_Criteria() {
        this(1, 20);
    }

    public Blog_Criteria(int pageNum, int listQty) {
        this.pageNum = pageNum;
        this.listQty = listQty;
    }

}
