package com.spring.timecinema.movie.dto;

import java.util.List;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter 
@ToString @Builder
public class DetailResponseDto {

	private int rowNum;
	private String title;
	private String openDt;
	private String poster;
	private String titleEng;
	private String directorNm;
	private List<String> actorList;
	private String nation;
	private String company;
	private String plotText;
	private String runtime;
	private String rating;
	private String genre;
	private String type;
	private String keywords;
	private List<String> stllList;
	private String vodClass;
	private String vodUrl;
	
}
