package com.spring.timecinema.user.controller;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.timecinema.user.dto.UserJoinRequestDTO;
import com.spring.timecinema.user.service.UserService;
import com.spring.timecinema.util.MailSenderService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {

	private final UserService service;
	private final MailSenderService mailService;
	private final HttpSession session;
	
	//회원가입 페이지로 이동
	@GetMapping("/userUp")
	public void userUp() {}
	
	//아이디 중복 확인
	@GetMapping("/id/{account}")
	@ResponseBody
	//@PathVariable은 URL 경로에 변수를 포함시켜 주는 방식 null이나 공백이 들어갈 수 있는 파라미터라면 적용하지 않는 것을 추천
	//파라미터 값에 .이 포함되어 있다면 .뒤에 값은 잘림
	//{} 안에 변수명을 지어주시고, @PathVariable 괄호 안에 영역을 지목해서 값을 받아옴
	public String idCheck(@PathVariable String account) {
		System.out.println("클라이언트로부터 전달된 아이디: " + account);
		int result = service.idCheck(account);
		if(result == 1) return "duplicated";
		else return "ok";
	}
	
	//이메일 인증
	@PostMapping("/email")
	@ResponseBody
	public String mailCheck(@RequestBody String email) {
		System.out.println("이메일 인증 요청: " + email);
		//화면단으로 인증번호를 전달
		return mailService.joinEmail(email);
	}
	
	//회원 가입 처리
	@PostMapping("/join")
	public String join(UserJoinRequestDTO dto, RedirectAttributes ra) {
		service.join(dto);
		ra.addFlashAttribute("msg", "joinSuccess");
		return "redirect:/user/userIn";
	}
	
	//로그인 페이지로 이동 요청
	@GetMapping("/userIn")
	public void In() {}
	
	//로그인 요청
	@PostMapping("/userIn")
	public void login(String userId, String userPw, Model model) {
		System.out.println("나는 UserController의 login이다!!!!!");
		model.addAttribute("result", service.login(userId, userPw));
	}
	
	//로그아웃 요청
	@GetMapping("userOut")
	public String userOut() {
		session.invalidate();
		System.out.println("로그아웃");
		return "redirect:/";
	}
}
