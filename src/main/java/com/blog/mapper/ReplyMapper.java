package com.blog.mapper;

import com.blog.domain.ReplyDTO;

import java.util.List;

public interface ReplyMapper {

    public List<ReplyDTO> getList(Long bno);

    public int add(ReplyDTO replyDTO);
}
