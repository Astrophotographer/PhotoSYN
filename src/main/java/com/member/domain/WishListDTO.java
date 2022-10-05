package com.member.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class WishListDTO {
    private String U_ID;
    private int G_NO;
    private Timestamp W_REG;
    private int M_IMGHQLY;
}
