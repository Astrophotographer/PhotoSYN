package com.blog.service;

import com.blog.domain.BlogDTO;
import com.blog.domain.Blog_Criteria;
import com.blog.domain.Blog_Img;
import com.blog.domain.Blog_Img_Temp;
import com.blog.mapper.BlogMapper;
import com.gallery.domain.MaintagDTO;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Log4j
public class BlogServiceImpl implements BlogService {

    @Autowired
    private BlogMapper blogMapper;


    @Override
    public int insertTempImg(Blog_Img_Temp blog_img_temp) {
        return blogMapper.insertTempImg(blog_img_temp);
    }

    @Override
    public List getTempImg(String user_id) {
        return blogMapper.getTempImg(user_id);
    }

    @Override
    public int insertImg(Blog_Img blog_img) {
        return blogMapper.insertImg(blog_img);
    }

    @Override
    public int updateImg(String u_id, String uuid) {
        blogMapper.updateImg(uuid);
        //메인상태 1 로 변경후 테이블에 남아있는 값들 삭제해주기
        blogMapper.deleteTempImg(u_id);

        return 0;
    }


    @Override
    public int insertBlog(BlogDTO blogDTO) {
        return blogMapper.insertBlog(blogDTO);
    }

    @Override
    public int checkBlogSeq() {
        return blogMapper.checkBlogSeq();
    }

    @Override
    public List<BlogDTO> getBlogList(Blog_Criteria blog_criteria) {

        //blog_criteria = Blog_Criteria(u_id=test, option=null, sort=null)
        System.out.println("blog_criteria = " + blog_criteria.toString());
        return blogMapper.getBlogList(blog_criteria);
    }

    @Override
    public BlogDTO getBlogSingle(Long B_NO) {
        return blogMapper.getBlogSingle(B_NO);
    }

    @Override
    public List checkMainImg() {
        return blogMapper.checkMainImg();
    }

    @Override
    public Blog_Img getMainImg(int b_no) {
        return blogMapper.getMainImg(b_no);
    }

    @Override
    public List<MaintagDTO> getMainTag() {
        return blogMapper.getMainTag();
    }

    @Override
    public List<Blog_Img> getImg(Long b_no) {
        return blogMapper.getImg(b_no);
    }

    @Override
    public int updateBlog(BlogDTO blogDTO) {
        return blogMapper.updateBlog(blogDTO);
    }

    @Override
    public int deleteImg(String bi_name, String uuid, String originName) {

        int result = blogMapper.deleteImg(uuid);

        File file = new File("C:\\Users\\pmwkd\\Desktop\\git\\PhotoSYN\\src\\main\\webapp\\resources\\saveImg" + "ckImage/" + bi_name);
        if (file.exists()) {
            if (file.delete()) {
                if (result > 0) {
                    log.info("이미지 삭제 성공+DB삭제 성공");
                } else {
                    log.info("이미지 삭제 성공+DB삭제 실패");
                }
            } else {
                log.info("파일삭제 실패");
            }
        } else {
            log.info("파일이 존재하지 않습니다.");
        }

        return result;
    }

    @Override
    public int updateBlogMainImg(Long b_no) {
        return blogMapper.updateBlogMainImg(b_no);
    }

    @Override
    public int hideBlog(Long b_no) {

        List<Blog_Img> blog_img_list = blogMapper.getImg(b_no);

        //글 숨김처리(삭제처리용)
        blogMapper.hideBlog(b_no);
        //사진 테이블 삭제(숨김x)
        int result = blogMapper.deleteImgs(b_no);

        for (int i = 0; i < blog_img_list.size(); i++) {
            File file = new File("C:\\Users\\pmwkd\\Desktop\\git\\PhotoSYN\\src\\main\\webapp\\resources\\saveImg" + "ckImage/" + blog_img_list.get(i).getBI_NAME());
            if (file.exists()) {
                if (file.delete()) {
                    if (result > 0) {
                        log.info("이미지 삭제 성공+DB삭제 성공. 이미지명 : " + blog_img_list.get(i).getBI_NAME());
                    } else {
                        log.info("이미지 삭제 성공+DB삭제 실패. 이미지명 : " + blog_img_list.get(i).getBI_NAME());
                    }
                } else {
                    log.info("파일삭제 실패");
                }
            } else {
                log.info("파일이 존재하지 않습니다.");
            }
        }


        return 0;
    }
}
//
