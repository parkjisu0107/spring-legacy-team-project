package com.spring.timecinema.movie.entity;

import java.util.List;

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
public class Search {

	private String movieId;
	private String title;
	private String poster;
	private String titleEng;
	private String runtime;
	private String rating;
	private String genre;
	private String type;
	private String prodYear;
	private String openDt;
	
}
