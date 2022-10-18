package com.member.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BuyDTO {
    private Long o_no;
    private String o_buyer;
    private String o_seller;
    private Long g_no;
    private int o_price;
    private Timestamp o_reg;
    private String g_hName;
}
