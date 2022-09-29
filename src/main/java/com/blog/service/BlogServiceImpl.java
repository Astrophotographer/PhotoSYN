package com.blog.service;

import com.blog.domain.BlogDTO;
import com.blog.domain.Blog_Img;
import com.blog.mapper.BlogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {

    @Autowired
    private BlogMapper blogMapper;

    @Override
    public int insertImg(Blog_Img blog_img) {
        return blogMapper.insertImg(blog_img);
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
    public List<BlogDTO> getBlogList() {
        return blogMapper.getBlogList();
    }

    @Override
    public BlogDTO getBlogSingle(Long B_NO) {
        return blogMapper.getBlogSingle(B_NO);
    }

    @Override
    public List checkMainImg() {
        return blogMapper.checkMainImg();
    }
}

