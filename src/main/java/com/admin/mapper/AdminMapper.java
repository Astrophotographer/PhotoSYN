package com.admin.mapper;

import com.admin.domain.AdminMainDTO;
import com.admin.domain.AdminMemberDTO;
import com.admin.domain.Admin_Criteria;
import com.admin.domain.Admin_UpsertTagDTO;
import com.gallery.domain.GalleryDTO;
import com.member.domain.MemberDTO;

import java.util.List;

public interface AdminMapper {
    public AdminMainDTO getAdminMainDTO();

    public int getUserCount();
    public int getSalesCount();
    public int getRecentGalleryCount();
    public int getRecentBlogCount();

    public List<MemberDTO> getMemberDTOList();

    public List<MemberDTO> getMemberDTOList_WithPaging(Admin_Criteria cri);

    public int getUserTotalCount(Admin_Criteria cri);

    public AdminMemberDTO getMemeberINFO(String u_id);

    public int updateMemberShip(MemberDTO memberDTO);

    public int updatePoint(MemberDTO memberDTO);

    public int updateUserStatus(MemberDTO memberDTO);

    //하위 2개는 galleryMapper에서 가져옴.
    public List<GalleryDTO> getGalleryDTOList_WithPaging(Admin_Criteria cri);
    public int getGalleryTotalCount(Admin_Criteria cri);
    //

//    public int hideBlog(List<Integer> b_noList);
    public int hideBlog(int b_no);

    public int showBlog(int b_no);

    public int hideGallery(int g_no);

    public int showGallery(int g_no);

    public int updateTag(Admin_UpsertTagDTO admin_upsertTagDTO);

    public int insertTag(Admin_UpsertTagDTO admin_upsertTagDTO);
}
