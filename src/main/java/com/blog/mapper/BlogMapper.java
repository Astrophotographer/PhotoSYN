package com.blog.mapper;

import com.blog.domain.BlogDTO;
import com.blog.domain.Blog_Img;

import java.util.List;

public interface BlogMapper {

    public int insertImg(Blog_Img blog_img);

    public int insertBlog(BlogDTO blogDTO);

    public List<BlogDTO> getBlogList();

    public BlogDTO getBlogSingle(Long B_NO);
}
