package com.blog.service;

import com.blog.domain.BlogDTO;
import com.blog.domain.Blog_Criteria;
import com.blog.domain.Blog_Img;
import com.blog.domain.Blog_Img_Temp;
import com.gallery.domain.MaintagDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BlogService {

    //사진 저장시 임시 저장되는 테이블
    public int insertTempImg(Blog_Img_Temp blog_img_temp);

    public List getTempImg(String user_id);

    public int insertImg(Blog_Img blog_img);

    public int updateImg(String u_id, String uuid);

    public int insertBlog(BlogDTO blogDTO);

    //블로그글 시퀀스 확인용. 메인 이미지등록, 이미지들에 글 번호 등록하기 위해
    public int checkBlogSeq();

    public List<BlogDTO> getBlogList(Blog_Criteria blog_criteria);

    public BlogDTO getBlogSingle(Long B_NO);

    public List checkMainImg();

    public Blog_Img getMainImg(int b_no);

    public List<MaintagDTO> getMainTag();
}
