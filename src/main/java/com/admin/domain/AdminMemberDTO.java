package com.admin.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class AdminMemberDTO {
    private String u_id;
    private String u_phone;
    private String u_nick;
    private Timestamp u_reg;
    private int u_status;
    private String u_pic;
    private int u_point;
    private int ms_membership;
    private String u_sns;
    private String u_snstoken;
    //auth Table
    private String auth;
    //Account Table
    private String a_account;
    private int a_bank;
    private String a_holder;    //예금주
    //SNS Table
    private String s_instagram;
    private String s_twitter;
    private String s_facebook;
    private String s_youtube;
    //User_Intro Table
    private String u_intro;
 }
