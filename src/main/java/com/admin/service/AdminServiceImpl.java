package com.admin.service;

import com.admin.domain.AdminMainDTO;
import com.admin.mapper.AdminMapper;
import com.member.domain.MemberDTO;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

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
}
