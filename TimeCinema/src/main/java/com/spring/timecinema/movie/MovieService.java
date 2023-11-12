package com.spring.timecinema.movie;

import java.text.ParseException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
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

import com.spring.timecinema.movie.dto.TimeResponseDTO;
import com.spring.timecinema.movie.entity.ApiResultTotal;
import com.spring.timecinema.movie.entity.Movie;
import com.spring.timecinema.movie.entity.Time;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
@PropertySource("classpath:/properties/kmdb.properties")
public class MovieService {

	private final IMovieMapper mapper;
	
	// KMDB
	@Value("${kmdb.serviceKey}")
	private String serviceKey;
	@Value("${kmdb.reqUrl}")
	private String kmdbUrl;
	
	// TMDB
	@Value("${tmdb.auth}")
	private String authKey;
	@Value("${tmdb.reqUrl}")
	private String tmdbUrl;

	// BoxOffice 리스트 불러오기
	public List<TimeResponseDTO> getBoxOfficeList(int yearFrom) {
		
		// boxOffice 순위 리스트 title(공백o) openDt(1111.11.11)
		List<Time> list = mapper.getBoxOfficeList(yearFrom);
		
		List<TimeResponseDTO> dtoList = new ArrayList<>();
		
		// 각 영화가 Movie table에 존재하는지 검색
		for(Time t : list) {
			String movieId = getMovieId(t.getTitle(), t.getOpenDt());
			
			// 없으면 KMDB에서 검색 후 Movie DB에 저장
			if(movieId == null) {
				setMovie(t.getTitle(), t.getOpenDt());
			}
						
			movieId = getMovieId(t.getTitle(), t.getOpenDt());
			
			// Movie DB에서 영화 정보 가져오기
			Movie movie = getMovie(movieId);
						
			dtoList.add(TimeResponseDTO.builder()
										.rank(t.getRank())
										.title(movie.getTitle())
										.openDt(movie.getOpenDt())
										.poster(movie.getPoster())
										.movieId(movie.getMovieId())
										.build());

		}// end for
		
		return dtoList;		
	}

	private Movie getMovie(String movieId) {
		return mapper.getMovie(movieId);
	}


	private String getMovieId(String title, String openDt) {
		return mapper.checkMovie(title, openDt);
	}

	// title 공백 있음, 2023.01.01
	private void setMovie(String title, String openDt) {
		
		String reqTitle = title.replaceAll(" ", "");
		String reqOpenDt = openDt.replaceAll("\\.", "-");
		
		ApiResultTotal info = getApiInfo(reqTitle, reqOpenDt);
		
		mapper.setMovie(Movie.builder()
							.title(title)
							.movieId(info.getMovieId())
							.poster(info.getPoster())
							.openDt(openDt)
							.build());

		
	}
	
	// KMDB) 영화 정보 JSON data 불러오기
	public JSONObject getApiData(String title, String openDt) {
		
		String createYearEnd = openDt.substring(0, 4);
		String createYearStart = Integer.parseInt(createYearEnd) - 1 + "";
		
		UriComponents builder = UriComponentsBuilder.fromHttpUrl(kmdbUrl)
				.queryParam("ServiceKey", serviceKey)
				.queryParam("title", title)
				.queryParam("releaseDts", openDt)
				.queryParam("createDts", createYearStart)
				.queryParam("createDte", createYearEnd)
				.build();
		
		log.info(builder.toString());

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
		    
		    // 검색 결과 존재 확인 및 재검색
		    if(jsonObject.get("TotalCount").toString().equals("0")) {
		    	builder = UriComponentsBuilder.fromHttpUrl(kmdbUrl)
						.queryParam("ServiceKey", serviceKey)
						.queryParam("title", title)
						.queryParam("type", "극영화")
						.queryParam("createDte", createYearEnd)
						.build();
		    	
		    	responseEntity 
				= template.exchange(builder.toUriString(), HttpMethod.GET, requEntity, String.class);
		    	responseData = responseEntity.getBody();
		    	parser = new JSONParser();
		    	jsonObject = (JSONObject) parser.parse(responseData);
		    }
		    
		    JSONArray dataArray = (JSONArray) jsonObject.get("Data");
		    data = (JSONObject) dataArray.get(0);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return data;
		
	}

	// KMDB) Api data parsing
	public ApiResultTotal getApiInfo(String reqTitle, String reqOpenDt) {
		
		// result 불러오기
		log.info("요청 제목: {}, 개봉일: {}", reqTitle, reqOpenDt);
		JSONObject data = getApiData(reqTitle, reqOpenDt);
		
	    JSONArray resultArray = (JSONArray) data.get("Result");
	    try {
	    	JSONObject result = (JSONObject) resultArray.get(0);
	    
		    // posters > poster
		    String posters = (String) result.get("posters");
		    String poster = posters.split("\\|")[0];
		    log.info("poster: {}", poster);
		    
		    // movieId
		    String movieId = (String) result.get("DOCID");
			log.info("movieId: {}", movieId);
		    
		    // titleEng
		    String titleEng = (String) result.get("titleEng");
		    log.info("titleEng: {}", titleEng);
		    
		    // directors > director > directorNm
		    JSONObject directors = (JSONObject) result.get("directors");
		    JSONArray directorArray = (JSONArray) directors.get("director");
		    JSONObject director = (JSONObject) directorArray.get(0);
		    String directorNm = (String) director.get("directorNm");
		    
		    // actors > actor > actorNm
		    JSONObject actors = (JSONObject) result.get("actors");
		    JSONArray actorArray = (JSONArray) actors.get("actor");
		    // 5명 리스트로
		    List<String> actorList = new ArrayList<>();
		    for(int i=0; i<5; i++) {
		    	if(i > actorList.size()-1) break;
		    	JSONObject actor = (JSONObject) actorArray.get(i);
		    	String actorNm = (String) actor.get("actorNm");
		    	actorList.add(actorNm);
		    }
		    
		    // nation
		    String nation = (String) ((JSONObject) result).get("nation");
		    
		    // company
		    String company = (String) ((JSONObject) result).get("company");
		    
		    // plots > plot > plotText
		    JSONObject plots = (JSONObject) result.get("plots");
		    JSONArray plotArray = (JSONArray) plots.get("plot");
		    JSONObject plot = (JSONObject) plotArray.get(0);
		    String plotText = (String) plot.get("plotText");
		    
		    // runtime
		    String runtime = (String) ((JSONObject) result).get("runtime");
		    
		    // rating
		    String rating = (String) ((JSONObject) result).get("rating");
		    
		    // genre
		    String genre = (String) ((JSONObject) result).get("genre");
		    
		    // type
		    String type = (String) ((JSONObject) result).get("type");
		    
		    // keywords
		    String keywords = (String) ((JSONObject) result).get("keywords");
		    
		    // stlls
		    String stlls = (String) ((JSONObject) result).get("stlls");
		    String[] arr = stlls.split("\\|");
		    List<String> stllList = Arrays.asList(arr);
		    
		    // vods > vod > vodClass, vodUrl
		    JSONObject vods = (JSONObject) result.get("vods");
		    JSONArray vodArray = (JSONArray) vods.get("vod");
		    JSONObject vod = (JSONObject) vodArray.get(0);
		    String vodClass = (String) vod.get("vodClass");
		    String vodUrl = (String) vod.get("vodUrl");
		    
		    return ApiResultTotal.builder()
		    					.movieId(movieId)
		    					.poster(poster)
							    .titleEng(titleEng)
							    .directorNm(directorNm)
							    .actorList(actorList)
							    .nation(nation)
							    .company(company)
							    .plotText(plotText)
							    .runtime(runtime)
							    .rating(rating)
							    .genre(genre)
							    .type(type)
							    .keywords(keywords)
							    .stllList(stllList)
							    .vodClass(vodClass)
							    .vodUrl(vodUrl)
							    .build();
		} catch (Exception e) {
			log.info("정보를 찾을 수 없음: {}", reqTitle);
			return ApiResultTotal.builder()
					.movieId("ERROR")
					.build();
		}
	
		
	}

	// TMDB
	public List<Time> getPopularityList(int yearFrom, int yearTo) {
		
		String dateFrom = yearFrom + "-01-01";
		String dateTo = yearTo + "-12-31";
		if(yearTo == LocalDate.now().getYear()) {
			dateTo = yearTo + "-" + 
					LocalDate.now().getMonthValue() + "-" +
					LocalDate.now().getDayOfMonth();
		}
		

		UriComponents builder = UriComponentsBuilder.fromHttpUrl(tmdbUrl)
				.queryParam("include_adult", "true")
				.queryParam("language", "ko")
				.queryParam("page", "1")
				.queryParam("primary_release_date.gte", dateFrom)
				.queryParam("release_date.lte", dateTo)
				.queryParam("region", "KR")
				.queryParam("sort_by", "popularity.desc")
				.build();
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", authKey);
		headers.add("accept", "application/json");
		
		RestTemplate template = new RestTemplate();
		HttpEntity<Object> requEntity = new HttpEntity<>(headers);
		
		ResponseEntity<String> responseEntity 
		= template.exchange(builder.toUriString(), HttpMethod.GET, requEntity, String.class);
		
		List<Time> dtoList = new ArrayList<>();
		
		String responseData = responseEntity.getBody();
	    JSONParser parser = new JSONParser();
	    try {
			JSONObject jsonObject = (JSONObject) parser.parse(responseData);
		    JSONArray resultsArray = (JSONArray) jsonObject.get("results");
		    
		    int rank = 1;
		    for(Object result : resultsArray) {
		    	String title = (String) ((JSONObject) result).get("title");
//		    	String originalTitle = (String) ((JSONObject) result).get("original_title");
		    	String poster = "https://image.tmdb.org/t/p/w300" + (String) ((JSONObject) result).get("poster_path");
		    	String openDt = (String) ((JSONObject) result).get("release_date");
		    	openDt = openDt.replaceAll("-", ".");
				
				dtoList.add(Time.builder()
								.rank(rank)
								.title(title)
								.openDt(openDt)
								.poster(poster)
								.build());

		    	rank++;
		    }
		    
		    
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	    return dtoList;
	}

	public void getResultList(String query) {

		UriComponents builder = UriComponentsBuilder.fromHttpUrl(kmdbUrl)
													.queryParam("ServiceKey", serviceKey)
													.queryParam("query", query)
													.build();

		
		
	}
	
	
}
