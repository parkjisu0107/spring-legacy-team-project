package com.spring.timecinema.movie;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MovieService {

	private final IMovieMapper mapper;
	
	
}
