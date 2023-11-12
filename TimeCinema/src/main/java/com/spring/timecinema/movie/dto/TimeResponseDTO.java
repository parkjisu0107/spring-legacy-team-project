package com.spring.timecinema.movie.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter 
@ToString @Builder
public class TimeResponseDTO {
	
	private int rank;
	private String title;
	private String openDt;
	private String poster;
	private String movieId;
	
}
