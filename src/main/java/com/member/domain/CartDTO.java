package com.member.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CartDTO {
    private String u_id;
    private int g_no;
    private Timestamp w_reg;
    private String m_imgQly;

}
