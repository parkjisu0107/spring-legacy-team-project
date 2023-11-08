package com.spring.timecinema.movie;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/movie")
@Slf4j
@RequiredArgsConstructor
public class MovieController {

	private final MovieService service;
	
	// time 페이지 열기
	@GetMapping("/{era}")
	public String time(@PathVariable String era,Model model) {
		model.addAttribute("box", service.getBoxOfficeList(era));
		return "movie/time";
	}

	
	
}
