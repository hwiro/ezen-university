package edu.univ.ezen.controller.pwFind;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.univ.ezen.dto.AccountStudentDTO;
import edu.univ.ezen.dto.EmailConfirmDTO;
import edu.univ.ezen.mailSender.EmailServiceImpl;
import edu.univ.ezen.service.AccMapper;
import edu.univ.ezen.service.EmailCheckMapper;

@Controller
public class PwFindController {
	
	@Autowired
	EmailCheckMapper emailCheckMapper;
	
	@Autowired
	EmailServiceImpl emailService;
	
	@Autowired
	AccMapper accMapper;
	
	//비밀번호 찾기를 위한 이메일 입력 폼 이동
	@RequestMapping("/ezenUnivPwFind.do")
	public String ezenUnivPwFind(HttpServletRequest req) {
		return "loginPortal/login_pwFind";
	}
	
	//이메일 전송 및 인증링크의 활성화 확인
	@RequestMapping("/ezenUnivLinkConfirmCheck.do")
	public String ezenUnivLinkConfirmCheck(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		String email = (String)session.getAttribute("email");

		if(email == null) {
			req.setAttribute("msg", "세션이 만료되었습니다. 다시 입력 해 주세요");
			req.setAttribute("url", "loginPortal/login_pwFind");
			return "message";
		}
		
		List<EmailConfirmDTO> ecdto = emailCheckMapper.getEmailConfirm(email);
		
		if(ecdto != null && ecdto.size() != 0 && ecdto.get(0).getMail_check().equals("yes")) {
			List<AccountStudentDTO> list = accMapper.studentFindByEmail(email);
			if(list != null || list.size() != 0) {
				for(AccountStudentDTO sdto : list) {
					int length = sdto.getStudent_pw().length() - 4;
					String pw = sdto.getStudent_pw().substring(0, 4);
					for(int i = 0; i < length; i++) {
						pw += "*";
					}
					sdto.setStudent_pw(pw);
				}
				req.setAttribute("list", list);
				int del = emailCheckMapper.delCheckedEmail(ecdto.get(0).getFcode(), ecdto.get(0).getBcode());
				session.removeAttribute("email");
				return "loginPortal/login_pwFind_result";
			}
			req.setAttribute("msg", "해당 학생 ID가 존재하지 않습니다");
			req.setAttribute("url", "loginPortal/login_pwFind");
			
			return "message";
		}
		
		else {
			return "loginPortal/login_pwFind_emailSent";
		}
	}
	
	//이메일 전송 완료
	@RequestMapping("/ezenUnivLinkConfirm.do")
	public String ezenUnivLinkConfirm(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		String email = (String)session.getAttribute("email");
		
		if(email == null || email.equals("")) {
			String student_id = req.getParameter("id");
			email = accMapper.getStudent(student_id).getEmail();
			session.setAttribute("email", email);
			String confirm = emailService.sendSimpleMessage(email);
			
			confirm = confirm.substring(53);
			
			String[] delim = confirm.split("&");
			
			EmailConfirmDTO ecdto2 = new EmailConfirmDTO(0, delim[0].substring(6), delim[1].substring(6), "no", "", email);
			
			int res = emailCheckMapper.insertEmailConfirm(ecdto2);
			
			return "loginPortal/login_pwFind_emailSent";
		}
		
		else {
			return "loginPortal/login_pwFind_emailSent";
		}
	}
	
	//인증링크 활성화 메소드
	@RequestMapping("/ezenUnivEncryptLink.do")
	public String ezenUnivEncryptLink(HttpServletRequest req) {
		String fcode = req.getParameter("fcode");
		String bcode = req.getParameter("bcode");
		
		if(fcode == null && bcode == null) {
			req.setAttribute("msg", "비정상적인 접근입니다");
			return "closeWindow";
		}
		
		boolean confirmCheck = emailCheckMapper.getEmailConfirmCheck(fcode, bcode);
		
		if(confirmCheck) {
			req.setAttribute("msg", "이미 인증을 진행했거나, 만료된 링크입니다.");
			return "closeWindow";
		}
		else {
			int res = emailCheckMapper.okEmailConfirm(fcode, bcode);
			
			req.setAttribute("msg", "인증이 완료되었습니다");
			return "closeWindow";
		}
	}
	
}
