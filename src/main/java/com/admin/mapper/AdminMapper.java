package com.admin.mapper;

import com.admin.domain.AdminMainDTO;
import com.admin.domain.AdminMemberDTO;
import com.member.domain.MemberDTO;

import java.util.List;

public interface AdminMapper {
    public AdminMainDTO getAdminMainDTO();

    public int getUserCount();
    public int getSalesCount();
    public int getRecentGalleryCount();
    public int getRecentBlogCount();

    public List<MemberDTO> getMemberDTOList();

    public AdminMemberDTO getMemeberINFO(String u_id);

    public int updateMemberShip(MemberDTO memberDTO);

    public int updatePoint(MemberDTO memberDTO);

    public int updateUserStatus(MemberDTO memberDTO);
}
