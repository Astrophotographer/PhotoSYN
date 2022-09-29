package com.blog.service;

import com.blog.domain.BlogDTO;
import com.blog.domain.Blog_Img;

import java.util.List;

public interface BlogService {

    public int insertImg(Blog_Img blog_img);

    public int insertBlog(BlogDTO blogDTO);

    //블로그글 시퀀스 확인용. 메인 이미지등록, 이미지들에 글 번호 등록하기 위해
    public int checkBlogSeq();

    public List<BlogDTO> getBlogList();

    public BlogDTO getBlogSingle(Long B_NO);

    public List checkMainImg();
}
