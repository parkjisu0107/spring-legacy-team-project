package com.spring.timecinema.movie;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IMovieMapper {

	List<BoxOffice> getBoxOfficeList(int yearFrom);

	void setPoster(@Param("rowNum")int rowNum, @Param("poster") String poster);

}
