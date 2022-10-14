package com.admin.service;

import com.admin.domain.AdminMainDTO;
import com.admin.domain.AdminMemberDTO;
import com.admin.domain.Admin_Criteria;
import com.member.domain.MemberDTO;

import java.util.List;

public interface AdminService {

    public void testPrint(String str);

    public AdminMainDTO getAdminMainDTO();

    public List<MemberDTO> getMemberDTOList();

    //페이징 처리
    public List<MemberDTO> getMemberDTOList_WithPaging(Admin_Criteria cri);

    public int getUserTotalCount(Admin_Criteria cri);

    public MemberDTO getMemberDTO(String u_id);
    public AdminMemberDTO getMemeberINFO(String u_id);

    public int updateMemberShip(MemberDTO memberDTO);

    public int updatePoint(MemberDTO memberDTO);

    public int updateUserStatus(MemberDTO memberDTO);


}
