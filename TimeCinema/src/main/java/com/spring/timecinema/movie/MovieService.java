package com.spring.timecinema.movie;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.annotations.Param;
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

import com.spring.timecinema.movie.dto.BoxResponseDto;
import com.spring.timecinema.movie.dto.DetailResponseDto;
import com.spring.timecinema.movie.entity.BoxOffice;
import com.spring.timecinema.movie.entity.Era;

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

	// BoxOffice 리스트 불러오기
	public List<BoxOffice> getBoxOfficeList(int yearFrom) {
		
		List<BoxOffice> list = mapper.getBoxOfficeList(yearFrom);
		
		// 포스터 존재 여부 확인하고 불러오기
		for(BoxOffice b : list) {
			if(b.getPoster()==null) {
				String poster = getPoster(b.getOpenDt(), b.getTitle());
				int rowNum = b.getRowNum();
				mapper.setPoster(rowNum, poster);
				b.setPoster(poster);
			}
		}
		
		return list;
		
		
			
	}

	// BoxOffice 포스터 불러오기
	public String getPoster(String openDt, String title) {
		
		JSONObject data = getMovieData(openDt, title);
		
	    // data에서 posters 꺼내기
	    JSONArray resultArray = (JSONArray) data.get("Result");
	    JSONObject result = (JSONObject) resultArray.get(0);
	    String posters = (String) result.get("posters");
	    
	    // posters의 url 중 첫번째 url을 자르기
	    String poster = posters.split("\\|")[0];
	    
	    return poster;

	}
	
	// 영화 정보 JSON data 불러오기
	public JSONObject getMovieData(String openDt, String title) {
		
		UriComponents builder = UriComponentsBuilder.fromHttpUrl(reqUrl)
				.queryParam("ServiceKey", serviceKey)
				.queryParam("releaseDts", openDt)
				.queryParam("releaseDte", openDt)
				.queryParam("title", title)
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
		    	builder = UriComponentsBuilder.fromHttpUrl(reqUrl)
						.queryParam("ServiceKey", serviceKey)
						.queryParam("title", title)
						.build();
		    	
		    	log.info(builder.toString());
		    	
		    	responseEntity 
				= template.exchange(builder.toUriString(), HttpMethod.GET, requEntity, String.class);
		    	responseData = responseEntity.getBody();
		    	parser = new JSONParser();
		    	jsonObject = (JSONObject) parser.parse(responseData);
		    }
		    
		    //"data" 라는 이름의 키에 해당하는 JSON 데이터를 가져옵니다.
		    JSONArray dataArray = (JSONArray) jsonObject.get("Data");
		    data = (JSONObject) dataArray.get(0);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return data;
		
	}

	public DetailResponseDto getMovieDetail(int rowNum) {
		
		BoxResponseDto box = getBoxInfo(rowNum);
		
		// result 불러오기
		JSONObject data = getMovieData(box.getOpenDt(), box.getTitle());
	    JSONArray resultArray = (JSONArray) data.get("Result");
	    JSONObject result = (JSONObject) resultArray.get(0);
		
	    // titleEng
	    String titleEng = (String) result.get("titleEng");
	    
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
	    
	    return DetailResponseDto.builder()
					    		.rowNum(box.getRowNum())
					    		.title(box.getTitle())
					    		.openDt(box.getOpenDt())
					    		.poster(box.getPoster())
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
		
		
	}

	public BoxResponseDto getBoxInfo(int rowNum) {
		BoxOffice box = mapper.getBoxInfo(rowNum);
		
		return BoxResponseDto.builder()
							.rowNum(box.getRowNum())
							.title(box.getTitle())
							.openDt(box.getOpenDt())
							.poster(box.getPoster())
							.build();
	}
	
	
}
