package com.blog.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ReplyDTO {
    private Long R_NO;
    private String U_ID;
    private Long B_NO;
    private String R_REPLY;
    private Timestamp R_REG;
    private int R_GRP;
    private int R_LEVEL;
    private int R_STEP;

}
