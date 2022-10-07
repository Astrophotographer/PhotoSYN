package com.member.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CartDTO {
    private String u_id;
    private int g_no;
    private String m_imgHqly;
    private String m_imgLqly;
    private Timestamp w_reg;
    private String g_lName;
    private Double g_hPrice;
    private Double g_lPrice;
    private int totalPrice;

}
