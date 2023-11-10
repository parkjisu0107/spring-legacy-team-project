package com.spring.timecinema.movie;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.timecinema.movie.dto.BoxResponseDto;
import com.spring.timecinema.movie.entity.Movie;

public interface IMovieMapper {

	List<Movie> getBoxOfficeList(int yearFrom);

	void setPoster(@Param("rowNum")int rowNum, @Param("poster") String poster);

	Movie getBoxInfo(int rowNum);

	void setMovie(Movie movie);


}
