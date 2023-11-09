package com.spring.timecinema.movie.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
@Builder
public class BoxResponseDto {

	private int rowNum;
	private String title;
	private String openDt;
	private String poster;
	
}
