package com.spring.timecinema.user.entity;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 CREATE TABLE users(
    user_id VARCHAR2(50) PRIMARY KEY,
    user_pw VARCHAR2(50) NOT NULL,
    user_name VARCHAR2(50) NOT NULL,
    user_email VARCHAR2(100),
    reg_date DATE DEFAULT sysdate
  );
 */

@Getter @Setter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {
	
	private String userId;
    private String userPw;
    private String userName;
    private String userEmail;
    private LocalDateTime regDate;

}
