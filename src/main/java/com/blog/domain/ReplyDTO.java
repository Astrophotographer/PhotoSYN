package com.blog.domain;

import lombok.*;

import java.sql.Timestamp;

@Data
public class ReplyDTO {
    public Long R_NO;
    public String U_ID;
    public Long B_NO;
    public String R_REPLY;
    public Timestamp R_REG;
    public int R_GRP;
    public int R_LEVEL;
    public int R_STEP;

}
