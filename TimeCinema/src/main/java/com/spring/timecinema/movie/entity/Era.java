package com.spring.timecinema.movie.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Era {
	
	private String era;
	private int yearFrom;
	private int yearTo;
	
	public Era(String era) {
		this.era = era;
		
		if(era.equals("70")) this.yearFrom = 1970;
		if(era.equals("80")) this.yearFrom = 1980;
		if(era.equals("90")) this.yearFrom = 1990;
		if(era.equals("00")) this.yearFrom = 2000;
		if(era.equals("10")) this.yearFrom = 2010;
		if(era.equals("20")) {
			this.yearFrom = 2020;
			this.yearTo = 2023;
		} else {
			this.yearTo = yearFrom + 10;
		}

	}
	
	
}
