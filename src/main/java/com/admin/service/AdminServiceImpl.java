package com.admin.service;

import com.admin.domain.AdminMainDTO;
import com.admin.domain.AdminMemberDTO;
import com.admin.domain.Admin_Criteria;
import com.admin.mapper.AdminMapper;
import com.blog.domain.BlogDTO;
import com.blog.domain.Blog_Criteria;
import com.blog.mapper.BlogMapper;
import com.gallery.domain.GalleryDTO;
import com.gallery.domain.Gallery_Criteria;
import com.gallery.mapper.GalleryMapper;
import com.member.domain.MemberDTO;
import com.member.mapper.MemberMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private MemberMapper memberMapper;

    @Autowired
    private GalleryMapper galleryMapper;

    @Autowired
    private BlogMapper blogMapper;

    @Override
    public void testPrint(String str) {
        log.info("str : "+str);
    }

    @Override
    public AdminMainDTO getAdminMainDTO() {
        AdminMainDTO adminMainDTO = new AdminMainDTO();

        try{
            adminMainDTO.setUserCount(adminMapper.getUserCount());
            adminMainDTO.setSalesCount(adminMapper.getSalesCount());
            adminMainDTO.setRecentGalleryCount(adminMapper.getRecentGalleryCount());
            adminMainDTO.setRecentBlogCount(adminMapper.getRecentBlogCount());
        }catch (NullPointerException nullPointerException){
            log.info("nullPointerException : "+nullPointerException);
            adminMainDTO.setUserCount(0);
            adminMainDTO.setSalesCount(0);
            adminMainDTO.setRecentGalleryCount(0);
            adminMainDTO.setRecentBlogCount(0);
        }catch (Exception e){
            e.printStackTrace();
        }

        //adminMapper.getUserDTO();

        return adminMainDTO;
    }

    @Override
    public List<MemberDTO> getMemberDTOList() {
        return adminMapper.getMemberDTOList();
    }

    @Override
    public List<MemberDTO> getMemberDTOList_WithPaging(Admin_Criteria cri) {
        return adminMapper.getMemberDTOList_WithPaging(cri);
    }

    @Override
    public int getUserTotalCount(Admin_Criteria cri) {
        return adminMapper.getUserTotalCount(cri);
    }


    @Override
    public MemberDTO getMemberDTO(String u_id) {
        return memberMapper.getMember(u_id);
    }

    @Override
    public AdminMemberDTO getMemeberINFO(String u_id) {
        return adminMapper.getMemeberINFO(u_id);
    }

    @Override
    public int updateMemberShip(MemberDTO memberDTO){
        return adminMapper.updateMemberShip(memberDTO);
    }

    @Override
    public int updatePoint(MemberDTO memberDTO) {
        return adminMapper.updatePoint(memberDTO);
    }

    @Override
    public int updateUserStatus(MemberDTO memberDTO) {
        return adminMapper.updateUserStatus(memberDTO);
    }

    @Override
    public List<GalleryDTO> getGalleryDTOList_WithPaging(Gallery_Criteria cri) {
//        return adminMapper.getGalleryDTOList_WithPaging(cri);
        return galleryMapper.getGalleryList(cri);
    }

    @Override
    public int getGalleryTotalCount(Gallery_Criteria cri) {
        return galleryMapper.getTotal(cri);
    }

    @Override
    public List<BlogDTO> getBlogDTOList_WithPaging(Blog_Criteria cri) {
        return blogMapper.getBlogList(cri);
    }

    @Override
    public int getBlogTotalCount(Blog_Criteria cri) {
        return blogMapper.getBlogTotal(cri);
    }

    @Override
    public int hideBlog(List<Integer> b_noList) {
        // admin mapper에서 구현?
        int result = 0;

        for(int i=0; i< b_noList.size();i++){
            log.info("b_noList.get(i) : "+b_noList.get(i));
            result += adminMapper.hideBlog(b_noList.get(i));
        }

        return result;
    }

    @Override
    public int showBlog(List<Integer> b_noList) {

        int result = 0;

        for(int i=0; i< b_noList.size();i++){
            log.info("b_noList.get(i) : "+b_noList.get(i));
            result += adminMapper.showBlog(b_noList.get(i));
        }
        return result;
    }
}
