package com.spring.timecinema.reply.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.timecinema.reply.entity.Reply;
import com.spring.timecinema.reply.mapper.IReplyMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReplyService implements IReplyService {
    
    private final IReplyMapper mapper;
    
    @Override
    public void registReply(Reply reply) {
        mapper.registReply(reply);
    }
    
    @Override
    public List<Reply> getList(int rowNum) {
        return mapper.getList(rowNum);
    }

}