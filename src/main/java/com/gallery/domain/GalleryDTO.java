package com.gallery.domain;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Data
public class GalleryDTO {

    private long G_NO;   // 갤러리 고유번호
    private String MT_NAME;  // 메인태그
    private String U_ID;    // 작성자
    private String G_HNAME; // 고화질 파일명
    private String G_LNAME; // 저화질 파일명
    private int G_HPRICE;    // 고화질 가격
    private Double G_LPRICE;    // 저화질 가격
    private String G_CONTENT;   // 내용(설명)
    private Date G_REG;     // 작성일
    private Date G_EDIT;       // 수정일
    private int G_STATUS;       // 상태  0: 올려진상태 (보여짐) 1: 구매가된거(보여짐), 2: 판매중지(숨김)
    private long G_SALES;    // 판매량
    private int G_LIKE;     // 좋아요
    private long G_READCOUNT;   // 조회수
    private String G_TAG1; // 태그 목록
    private String G_TYPE; // 사진 포맷(jpg, raw)

    // 파일 한개 첨부 - 처리를 위한 변수
    private MultipartFile file;

}