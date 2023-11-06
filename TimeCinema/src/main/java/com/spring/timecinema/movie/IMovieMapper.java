package com.spring.timecinema.movie;

import java.util.List;

public interface IMovieMapper {

	List<BoxOffice> getBoxOfficeList(int yearFrom);

}
