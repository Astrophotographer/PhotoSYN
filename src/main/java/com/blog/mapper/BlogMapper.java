package com.blog.mapper;

import com.blog.domain.BlogDTO;
import com.blog.domain.Blog_Criteria;
import com.blog.domain.Blog_Img;
import com.blog.domain.Blog_Img_Temp;
import com.gallery.domain.MaintagDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BlogMapper {

    public int insertTempImg(Blog_Img_Temp blog_img_temp);

    public List getTempImg(String user_id);

    public int insertImg(Blog_Img blog_img);

    public int updateImg(String uuid);
    public int deleteTempImg(String u_id);

    public int insertBlog(BlogDTO blogDTO);

    public int checkBlogSeq();

    public List<BlogDTO> getBlogList(Blog_Criteria blog_criteria);

    public BlogDTO getBlogSingle(Long B_NO);

    public List checkMainImg();

    public Blog_Img getMainImg(int b_no);

    public List<MaintagDTO> getMainTag();

    public List<Blog_Img> getImg(Long b_no);
}
