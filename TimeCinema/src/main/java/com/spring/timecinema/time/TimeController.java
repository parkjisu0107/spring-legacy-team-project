package com.spring.timecinema.time;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/time")
@Slf4j
public class TimeController {

	@GetMapping("/{era}")
	public void home(@PathVariable String era) {
		log.info("era: {}", era);
	}
}
