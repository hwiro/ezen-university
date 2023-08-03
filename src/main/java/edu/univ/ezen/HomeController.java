package edu.univ.ezen;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/testBoot.do")
	public String test() {
		return "test";
	}
	
	/*
	//이메일테스트
	@PostMapping("/emailSend")
	public String login_emailConfirm(HttpServletRequest req, @RequestParam String email) throws Exception {
		String confirm = emailService.sendSimpleMessage(email);
		//confirm은 보낸 인증코드
		
		//DB에 코드 저장할 것
		
		req.setAttribute("msg", "이메일이 전송되었습니다");
		req.setAttribute("url", "login_main.do");
		return "message";
	}
	*/
	
}
