package com.spring.timecinema.movie;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.timecinema.movie.dto.BoxResponseDto;
import com.spring.timecinema.movie.dto.DetailResponseDto;
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
//		model.addAttribute("box", service.getBoxOfficeList(targetEra.getYearFrom()));
		model.addAttribute("pop", service.getPopularityList(targetEra.getYearFrom(), targetEra.getYearTo()));
		model.addAttribute("era", targetEra);
		return "movie/time";
	}

	// movie detail 페이지 요청 (boxOffice)
	@GetMapping("/detail/{rowNum}")
	public String boxOfficeDetail(@PathVariable int rowNum, Model model) {
		
		BoxResponseDto box = service.getBoxInfo(rowNum);
		DetailResponseDto dto = service.getMovieDetail(box.getOpenDt(), box.getTitle());
		
		dto.setRowNum(box.getRowNum());
		dto.setTitle(box.getTitle());
		dto.setOpenDt(box.getOpenDt());
		dto.setPoster(box.getPoster());
		
		model.addAttribute("detail", dto);
		
		return "movie/detail";
	}
	
	
	@GetMapping("/detail/{openDt}/{title}")
	public String popularityDetail(@PathVariable String openDt, @PathVariable String title) {
		
//		DetailResponseDto dto = service.getMovieDetail(openDt, title);
		
		return "movie/detail";
	}
	
}
