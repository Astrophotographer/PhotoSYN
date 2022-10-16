package com.admin.service;

import com.admin.domain.AdminMainDTO;
import com.admin.domain.AdminMemberDTO;
import com.admin.domain.Admin_Criteria;
import com.blog.domain.BlogDTO;
import com.blog.domain.Blog_Criteria;
import com.gallery.domain.GalleryDTO;
import com.gallery.domain.Gallery_Criteria;
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

    public List<GalleryDTO> getGalleryDTOList_WithPaging(Gallery_Criteria cri);
    public int getGalleryTotalCount(Gallery_Criteria cri);

    //blog
    public List<BlogDTO> getBlogDTOList_WithPaging(Blog_Criteria cri);

    public int getBlogTotalCount(Blog_Criteria cri);

    //blog 삭제(숨김)및 복원(노출)
    public int hideBlog(List<Integer> b_noList);

    public int showBlog(List<Integer> b_noList);

    //gallery 삭제(숨김) 및 복원(노출)
    public int hideGallery(List<Integer> g_noList);

    public int showGallery(List<Integer> g_noList);


}
