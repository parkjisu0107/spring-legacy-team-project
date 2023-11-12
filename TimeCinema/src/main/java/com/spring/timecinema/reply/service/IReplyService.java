package com.spring.timecinema.reply.service;

import java.util.List;

import com.spring.timecinema.reply.entity.Reply;

public interface IReplyService {

    //댓글 등록
    void registReply(Reply reply);
    
    //목록 요청
    List<Reply> getList(int rowNum);
    
}