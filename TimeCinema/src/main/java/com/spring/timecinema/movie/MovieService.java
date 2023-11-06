package com.spring.timecinema.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
@PropertySource("classpath:/properties/kmdb.properties")
public class MovieService {

	private final IMovieMapper mapper;
	
	@Value("${kmdb.serviceKey}")
	private String serviceKey;
	@Value("${kmdb.reqUrl}")
	private String reqUrl;

	public List<BoxOffice> getBoxOfficeList(String era) {
		int yearFrom = 0;
		
		if(era.equals("70")) yearFrom=1970;
		if(era.equals("80")) yearFrom=1980;
		if(era.equals("90")) yearFrom=1990;
		if(era.equals("00")) yearFrom=2000;
		if(era.equals("10")) yearFrom=2010;
		if(era.equals("20")) yearFrom=2020;
		
		return mapper.getBoxOfficeList(yearFrom);
		
			
	}

	public void getPoster(String openDt, String title) {

		UriComponents builder = UriComponentsBuilder.fromHttpUrl(reqUrl)
				.queryParam("ServiceKey", serviceKey)
				.queryParam("listCount", "3")
				.queryParam("releaseDts", openDt)
				.queryParam("releaseDte", openDt)
				.queryParam("title", title)
				.build();
		
		log.info(builder.toString());

		
	}
	
	
}
