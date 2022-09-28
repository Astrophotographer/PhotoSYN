package com.blog.service;

import com.blog.domain.BlogDTO;
import com.blog.domain.Blog_Img;

public interface BlogService {

    public int insertImg(Blog_Img blog_img);

    public int insertBlog(BlogDTO blogDTO);
}
