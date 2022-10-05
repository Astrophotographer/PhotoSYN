package com.gallery.domain;

import lombok.Data;

import java.util.Date;

@Data
public class MetadataDTO {

    private long G_NO;
    private String Gallery_img_Temp;  // 메타데이터 확인용 임시 변수
    private String M_LONGITUDE; //경도
    private String M_LATITUDE;  // 위도
    private String M_IMGLENS;   // 렌즈모델
    private String M_IMGCAMERA;  //카메라 모델 MODEL
    private String M_IMGHQLY;   // 고화질 픽셀사이즈
    private String M_IMGLQLY;   // 저화질 픽셀사이즈
    private String M_APERTURE;   // 조리개
    private String M_ISO;   // 감도
    private Double M_FLENGTH; // 초점거리  FocalLength
    private Double M_SHUTTERSPEED; //셔터스피드   ExposureTime



    private Date M_REG; // 사진 촬영일 DateTimeOriginal

}