package com.spring.timecinema.reply.mapper;

import java.util.List;

import com.spring.timecinema.reply.entity.Reply;

public interface IReplyMapper {
    
    //댓글 등록
    void registReply(Reply reply);

    //댓글 목록
    List<Reply> getList(int rowNum);


}