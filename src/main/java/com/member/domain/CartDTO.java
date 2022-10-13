package com.member.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CartDTO {
    private String c_id;
    private String u_id;        // 아이디
    private Long g_no;
    private String c_hName;     // 고화질 파일명
    private String c_lName;     // 저화질 파일명
    private int c_hPrice;       // 고화질 금액
    private int c_lPrice;       // 저화질 금액
    private Timestamp c_reg;    // 담은 일자
    private int totalPrice;     // 합계 금액

}
