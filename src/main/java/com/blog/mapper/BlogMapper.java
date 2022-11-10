package com.blog.mapper;

import com.blog.domain.*;
import com.gallery.domain.MaintagDTO;
import com.member.domain.MemberDTO;
import com.member.domain.User_Intro;
import com.member.domain.User_SNS;

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

    public int getBlogTotal(Blog_Criteria blog_criteria);

    public BlogDTO getBlogSingle(Long B_NO);

    public List checkMainImg();

    public Blog_Img getMainImg(int b_no);

    public List<MaintagDTO> getMainTag();

    public List<Blog_Img> getImg(Long b_no);

    public int updateBlog(BlogDTO blogDTO);

    public int deleteImg(String uuid);

    public int updateBlogMainImg(Long b_no);

    public int hideBlog(Long b_no);

    public int deleteImgs(Long b_no);

    public int updateBlogReadCount(Long b_no);

    public User_Intro getUserIntro(String u_id);

    public User_SNS getUserSNS(String u_id);

    public MemberDTO getUserInfo(String u_id);

    public int upsertTag(List<String> tags);

    public int getBlogLike(Blog_Like blog_like);

    public List<DailyTag> getDailyTag();
}
