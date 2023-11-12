package com.spring.timecinema.movie;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.timecinema.movie.entity.Era;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/movie")
@Slf4j
@RequiredArgsConstructor
public class MovieController {

	private final MovieService service;
	
	// movie time 페이지 요청
	@GetMapping("/{era}")
	public String time(@PathVariable String era,Model model) {
		Era targetEra = new Era(era);
		model.addAttribute("box", service.getBoxOfficeList(targetEra.getYearFrom()));
		model.addAttribute("pop", service.getPopularityList(targetEra.getYearFrom(), targetEra.getYearTo()));
		model.addAttribute("era", targetEra);
		return "movie/time";
	}

	// movie detail 페이지 요청 (boxOffice)
	@GetMapping("/detail/{movieId}")
	public String boxOfficeDetail(@PathVariable String movieId, Model model) {

		model.addAttribute("detail", service.getDetail(movieId));
		
		return "movie/detail";
	}
	
	// movie detail 페이지 요청 (popularList)
	@GetMapping("/detail/{title}/{openDt}")
	public String popularDetail(@PathVariable String title, @PathVariable String openDt, Model model) {
		
		log.info(service.getPopularDetail(title, openDt).toString());
		
		model.addAttribute("detail", service.getPopularDetail(title, openDt));
		
		return "movie/detail";
	}
	
	@GetMapping("/search/{query}")
	public String search(@PathVariable String query, Model model) {

		model.addAttribute("query", query);
		model.addAttribute("result", service.getResultList(query));
		
		return "movie/search";
		
	}
	
}
