package com.blog.service;

import com.blog.domain.BlogDTO;
import com.blog.domain.Blog_Criteria;
import com.blog.domain.Blog_Img;
import com.blog.domain.Blog_Img_Temp;
import com.blog.mapper.BlogMapper;
import com.gallery.domain.MaintagDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
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
}

