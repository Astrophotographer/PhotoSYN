package com.blog.service;

import com.blog.domain.ReplyDTO;

import java.util.List;

public interface ReplyService {

    //댓글 목록 조회
    public List<ReplyDTO> getList(Long bno);

    public int add(ReplyDTO replyDTO);
}
