package com.gallery.domain;

import lombok.Data;

@Data
public class GalleryDTO {

    private long G_NO;
    private String MT_NAME;
    private String U_ID;
    private String G_HNAME;
    private String G_LNAME;
    private Double G_HPRICE;
    private Double G_LPRICE;
    private String G_CONTENT;
    private String G_REG;
    private String G_EDIT;
    private int G_STATUS;
    private Double G_SALES;
    private long G_READCOUNT;
    private String[] G_TAG; // 태그 목록
    private String G_TYPE; // 사진 포맷(jpg, raw)

}