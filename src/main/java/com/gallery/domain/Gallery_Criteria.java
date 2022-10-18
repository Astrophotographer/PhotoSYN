package com.gallery.domain;

import lombok.Data;
import org.springframework.web.util.UriComponentsBuilder;


@Data
public class Gallery_Criteria {

//    private String option_reg;  // 등록일  latest/ oldest
//    private String option_like; // 좋아요  popular/ unpopular
//    private String option_view; // 조회수  highest_view/ lowest_view
    private String u_id;    //유저 아이디
    private String option;  //reg, like, readcount
    private String sort;    //high(latest/ popular/ highest_view), low(oldest/ unpopular/ lowest_view)

    //한 페이지당 게시판글 10개 불러오기
    private int pageNum; 	// 페이지 번호
    private int listQty;	// 한페이지에 보여줄 게시물 개수

    private String sel; 	//
    private String keyword; // 검색 키워드

    public Gallery_Criteria() {
        this(1, 9);
    }

    public Gallery_Criteria(int pageNum, int listQty) {
        this.pageNum = pageNum;
        this.listQty = listQty;
    }
    // 검색 조건을 배열로 만들어 한번에 처리하기 위한 메서드 추가
    //public String[] getSelArr() {
        //return sel == null ? new String[] {} : sel.split("");
    //}

    // URL 링크에 붙히는 쿼리 스트링 자동 생성해주는 메서드
    public String getListLink() {
        UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
                .queryParam("pageNum", this.pageNum)
                .queryParam("listQty", this.listQty)
                .queryParam("keyword", this.keyword);

        return builder.toUriString(); // ?pageNum=1&listQty=10
    }


}

