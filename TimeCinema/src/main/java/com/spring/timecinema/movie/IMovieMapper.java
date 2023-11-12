package com.spring.timecinema.movie;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.timecinema.movie.dto.BoxResponseDto;
import com.spring.timecinema.movie.entity.Movie;
import com.spring.timecinema.movie.entity.Time;

public interface IMovieMapper {

	List<Time> getBoxOfficeList(int yearFrom);

	String checkMovie(@Param("title") String title, @Param("openDt") String openDt);

	Movie getMovie(String movieId);

	void setMovie(Movie movie);

	void setPoster(@Param("movieId") String movieId, @Param("poster") String poster);

//	void setPoster(@Param("rowNum")int rowNum, @Param("poster") String poster);
//
//	Time getBoxInfo(int rowNum);
//
//	void setMovie(Time movie);



}
