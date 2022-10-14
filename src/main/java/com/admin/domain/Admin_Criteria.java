package com.admin.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.util.UriComponentsBuilder;

@Setter
@Getter
@ToString
public class Admin_Criteria {

    //정렬 옵션
    //오래된순, 최근순, 등급순, 회원상태(0: 활동중, 1: 휴면상태, 2: 정상탈퇴, 3: 강제탈퇴)
    //oldest, latest, memberShip, status
    private String sortOption;


    //페이징 처리...
    private int pageNum;    //페이지 번호
    private int listQty;    //페이지 하나에 보여줄 게시물 개수

    //검색
    private String searchOpt;   //I: id로 검색, N: 닉네임으로 검색
    private String searchStr;   //검색어

    public Admin_Criteria() {
        this(1,10);
    }
    public Admin_Criteria(int pageNum, int listQty) {
        this.pageNum = pageNum;
        this.listQty = listQty;
    }

    //URL 링크에붙혀주는 메서드
    public String makeCriLink(){
        UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
                .queryParam("pageNum", this.pageNum)
                .queryParam("listQty", this.listQty)
                .queryParam("sortOption", this.sortOption)
                .queryParam("searchStr", this.searchStr)
                ;

        return builder.toUriString();
    }
}
