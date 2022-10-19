package com.admin.domain;

import lombok.Data;

//멤버쉽 정보 담는 클래스
@Data
public class Admin_MemberShipInfo {
    private int ms_membership;
    private int ms_att;
    private int ms_sell;
    private int ms_regist;
}
