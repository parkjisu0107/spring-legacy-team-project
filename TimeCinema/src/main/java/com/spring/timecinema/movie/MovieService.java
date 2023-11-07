package com.spring.timecinema.movie;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
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
		
		// 조회 시작 년도 설정
		int yearFrom = 0;
		
		if(era.equals("70")) yearFrom=1970;
		if(era.equals("80")) yearFrom=1980;
		if(era.equals("90")) yearFrom=1990;
		if(era.equals("00")) yearFrom=2000;
		if(era.equals("10")) yearFrom=2010;
		if(era.equals("20")) yearFrom=2020;
		
		List<BoxOffice> list = mapper.getBoxOfficeList(yearFrom);
		
		// 포스터 존재 여부 확인하고 불러오기
//		for(BoxOffice b : list) {
//			if(b.getPoster()==null) {
//				
//			}
//		}
		
		return list;
		
		
			
	}

	public void getPoster(String openDt, String title) {

		JSONObject data = getMovieInfo(openDt, title);
		
	    //response 안에서 body 키에 해당하는 JSON 데이터를 가져옵니다.
	    JSONArray resultArray = (JSONArray) data.get("Result");
	    JSONObject result = (JSONObject) resultArray.get(0);
	    String posters = (String) ((JSONObject) result).get("posters");
		
//	    for(Object result : resultArray) {
//	    	String posters = (String) ((JSONObject) result).get("posters");
//	    	if(posters != null) {
//	    		
//	    	}
//	    }
	    
	    

	   
	    
	    
	    log.info("poster uri {}: {}",title, posters);


		
	}
	
	// 영화 정보 JSON data 불러오기
	public JSONObject getMovieInfo(String openDt, String title) {
		
		UriComponents builder = UriComponentsBuilder.fromHttpUrl(reqUrl)
				.queryParam("ServiceKey", serviceKey)
				.queryParam("releaseDts", openDt)
				.queryParam("title", title)
				.build();
		
		HttpHeaders headers = new HttpHeaders();
		
		RestTemplate template = new RestTemplate();
		HttpEntity<Object> requEntity = new HttpEntity<>(headers);
		
		JSONObject data= null;
		
		try {
			ResponseEntity<String> responseEntity 
			= template.exchange(builder.toUriString(), HttpMethod.GET, requEntity, String.class);
		
			String responseData = responseEntity.getBody();
		    JSONParser parser = new JSONParser();
		    JSONObject jsonObject = (JSONObject) parser.parse(responseData);

		    //"data" 라는 이름의 키에 해당하는 JSON 데이터를 가져옵니다.
		    JSONArray dataArray = (JSONArray) jsonObject.get("Data");
		    data = (JSONObject) dataArray.get(0);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return data;
		
	}
	
	
}
