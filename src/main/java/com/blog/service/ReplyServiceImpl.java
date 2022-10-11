package com.blog.service;

import com.blog.domain.ReplyDTO;
import com.blog.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService {

    @Autowired
    private ReplyMapper replyMapper;

    @Override
    public List<ReplyDTO> getList(Long bno) {
        return replyMapper.getList(bno);
    }

    @Override
    public int add(ReplyDTO replyDTO) {
        return replyMapper.add(replyDTO);
    }
}
