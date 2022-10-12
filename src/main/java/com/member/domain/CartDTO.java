package com.member.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CartDTO {
    private String u_id;        // 아이디
    private int g_no;           // 상품번호
    private String g_img;       // 사진
    private String m_imgHqly;   // 고화질
    private String m_imgLqly;   // 저화질
    private Timestamp w_reg;    // 담은 일자
    private String g_lName;     // 
    private Double g_hPrice;    // 고화질 금액
    private Double g_lPrice;    // 저화질 금액 
    private int totalPrice;     // 합계 금액

}
