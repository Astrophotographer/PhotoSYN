package com.blog.domain;

import lombok.Data;

import java.sql.Date;

@Data
public class BlogDTO {
    private long B_NO;
    private String U_ID;
    private String MT_NAME;
    private String B_SUBJECT;
    private String B_CONTENT;
    private int B_LIKE;
    private int B_READCOUNT;
    private Date B_REG;
    private Date B_EDIT;
    private String B_STATUS;
    private String B_TAG1;
    private String B_REPORTCOUNT;
}
