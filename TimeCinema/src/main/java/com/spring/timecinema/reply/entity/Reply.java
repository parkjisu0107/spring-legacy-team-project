package com.spring.timecinema.reply.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Reply {
    
    //영화 번호
<<<<<<< HEAD
    private int rowNum;
=======
    private String movieId;
>>>>>>> 6c995e625d287d7f89b90edd1f4714102b39054f
    //아이디
    private String userId;
    //댓글 번호
    private int replyNo;
    //댓글 내용
    private String content;
    //댓글 단 시간
    private Date regDate;
    //작성자 이름
    private String userName;
    
}