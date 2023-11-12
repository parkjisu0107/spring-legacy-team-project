package com.spring.timecinema.reply.mapper;

import java.util.List;

<<<<<<< HEAD
=======
import org.apache.ibatis.annotations.Param;

>>>>>>> 6c995e625d287d7f89b90edd1f4714102b39054f
import com.spring.timecinema.reply.entity.Reply;

public interface IReplyMapper {
    
    //댓글 등록
    void registReply(Reply reply);

    //댓글 목록
<<<<<<< HEAD
    List<Reply> getList(int rowNum);

=======
    List<Reply> getList(String movieId);
    
    void delete(@Param("movieId") String movieId, @Param("replyNo") int replyNo);

    int isExist(@Param("movieId") String movieId, @Param("replyNo") int replyNo);
>>>>>>> 6c995e625d287d7f89b90edd1f4714102b39054f

}