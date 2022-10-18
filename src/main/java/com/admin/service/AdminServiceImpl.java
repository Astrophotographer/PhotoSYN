package com.admin.service;

import com.admin.domain.AdminMainDTO;
import com.admin.domain.AdminMemberDTO;
import com.admin.domain.Admin_Criteria;
import com.admin.domain.Admin_UpsertTagDTO;
import com.admin.mapper.AdminMapper;
import com.blog.domain.BlogDTO;
import com.blog.domain.Blog_Criteria;
import com.blog.mapper.BlogMapper;
import com.gallery.domain.GalleryDTO;
import com.gallery.domain.Gallery_Criteria;
import com.gallery.domain.MaintagDTO;
import com.gallery.mapper.GalleryMapper;
import com.member.domain.MemberDTO;
import com.member.mapper.MemberMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.util.List;
import java.util.UUID;

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

    @Override
    public int hideGallery(List<Integer> g_noList) {

        int result = 0;

        for(int i=0; i< g_noList.size();i++){
            log.info("g_noList.get(i) : "+g_noList.get(i));
            result += adminMapper.hideGallery(g_noList.get(i));
        }

        return result;
    }

    @Override
    public int showGallery(List<Integer> g_noList) {

        int result = 0;

        for(int i=0; i< g_noList.size();i++){
            log.info("g_noList.get(i) : "+g_noList.get(i));
            result += adminMapper.showGallery(g_noList.get(i));
        }
        return result;
    }

    @Override
    public List<MaintagDTO> getMainTagDTOList() {
        return galleryMapper.getMainTag();
    }

    @Override
    public int tagUpsert(Admin_UpsertTagDTO admin_upsertTagDTO, MultipartHttpServletRequest request) {

        int result = 0;

        try{
            MultipartFile file = request.getFile("tagImg");
            if(file.getSize()>0) {
                log.info(file);
                log.info("file.getname : " + file.getName());
                log.info("file.getOriginalFilename : " + file.getOriginalFilename());
                log.info("file.getSize : " + file.getSize());
                log.info("file.getContentType : " + file.getContentType());
                log.info("file.getBytes : " + file.getBytes());

                //파일 저장 경로
                String uploadImgPath = request.getRealPath("/resources/mainTagImgSaveFolder");

                String uuid = UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
                String saveImgName = uuid + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

                log.info("saveImgName : "+saveImgName);

                //이미지 저장할 전체 경로
                String saveImgPath = uploadImgPath + "\\" + saveImgName;

                File copyFile = new File(saveImgPath);

                file.transferTo(copyFile);
                //저장 완료


                //새로운 태그 추가+파일저장
                if(admin_upsertTagDTO.getNewTag() != null && !(admin_upsertTagDTO.getNewTag().isEmpty())){
                    //new Tag
                    log.info("newTag (if) : "+admin_upsertTagDTO.getNewTag());
                    admin_upsertTagDTO.setTagImgName(saveImgName);

                    //여기에는 newTag랑 이미지 경로 담겨있음
                    result = adminMapper.insertTag(admin_upsertTagDTO);


                }else if((admin_upsertTagDTO.getOriginTag() != null && !(admin_upsertTagDTO.getOriginTag().isEmpty())) && (admin_upsertTagDTO.getUpdateTag() != null && !(admin_upsertTagDTO.getUpdateTag().isEmpty()))){
                    //기존 태그 수정 + 파일 저장
                    log.info("orignTag (if) : "+admin_upsertTagDTO.getOriginTag());
                    log.info("updateTag (if) : "+admin_upsertTagDTO.getUpdateTag());

                    admin_upsertTagDTO.setTagImgName(saveImgName);

                    //여기에는 newTag없고, 기존태그, 수정할태그, 파일 경로 담겨있음
                    result = adminMapper.updateTag(admin_upsertTagDTO);
                }

            }else{
                //파일 업로드 없음. 태그명만 수정하기
                log.info("file is null");

                //여기에는 기존태그, 수정할 태그만 들어있음
                result = adminMapper.updateTag(admin_upsertTagDTO);
            }

        }catch (NullPointerException nullPointerException){
            log.info("nullPointerException : "+nullPointerException);
        }catch (Exception e){
            log.info("file : "+e.getMessage());
        }

        log.info("=======================================================");
        log.info(admin_upsertTagDTO.toString());
        return result;
    }
}
