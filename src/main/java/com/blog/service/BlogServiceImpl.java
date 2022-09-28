package com.blog.service;

import com.blog.domain.BlogDTO;
import com.blog.domain.Blog_Img;
import com.blog.mapper.BlogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}

