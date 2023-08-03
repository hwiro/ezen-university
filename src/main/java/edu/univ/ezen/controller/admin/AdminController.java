package edu.univ.ezen.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.univ.ezen.dto.*;
import edu.univ.ezen.service.*;

@Controller
public class AdminController {
	
	@Autowired
	private AccAdminMapper accAdminMapper;
	
	@Autowired
	private LogMapper logMapper;
	
	//세션에 id라는 값이 있는지 체크하는 메소드. 있으면 true, 없으면 false를 리턴한다.
	protected boolean id_check(HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(session.getAttribute("id") == null) {
			return false;
		}
		else {
			return true;
		}
	}
	
	//로그인 창 이동 매핑. 로그인 만료, 혹은 주소창으로 이동 시 이게 기본 페이지가 된다.
	@RequestMapping("/admin_login.do")
	public String admin_login() {
		return "admin/admin_login";
	}
	
	//로그인 처리 매핑. 로그인 실패시 로그인 창으로 이동
	@RequestMapping("/admin_login_pro.do")
	public String admin_login_pro(HttpServletRequest req) {
		String admin_id = req.getParameter("admin_id");
		String admin_pw = req.getParameter("admin_pw");
		
		AccountAdminDTO idch = accAdminMapper.getAdmin(admin_id);
		
		if(idch == null) {
			req.setAttribute("msg", "아이디가 존재하지 않습니다");
			req.setAttribute("url", "admin_login.do");
			return "message";
		}
		
		else if(!idch.getAdmin_pw().equals(admin_pw)) {
			req.setAttribute("msg", "비밀번호가 틀립니다");
			req.setAttribute("url", "admin_login.do");
			return "message";
		}
		
		else if(idch.getAdmin_pw().equals(admin_pw)) {
			req.setAttribute("msg", "환영합니다, 관리자 "+idch.getName()+"님");
			req.setAttribute("url", "admin_index.do");
			HttpSession session = req.getSession();
			session.setAttribute("id", admin_id);
			session.setAttribute("authority_level", idch.getAuthority_level());
			
			InLogDTO ldto = new InLogDTO();//접속 로그 남기기
			ldto.setId(admin_id);
			ldto.setIp(req.getRemoteAddr());
			int res = logMapper.insertLog(ldto);
			
			return "message";
		}
		
		else {
			req.setAttribute("msg", "알수없는 오류");
			req.setAttribute("url", "admin_login.do");
			return "message";
		}
	}

	//로그인 성공 시 관리자 페이지 메인으로 이동. id체크를 해준다.
	@RequestMapping("/admin_index.do")
	public String admin_index(HttpServletRequest req) {
		boolean ch = id_check(req);
		
		if(!ch) {
			return "admin/admin_login";
		}
		
		else {
			return "admin/admin_index";
		}
	}
	
	//로그아웃 매핑
	@RequestMapping("/admin_logout.do")
	public String admin_logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		boolean ch = id_check(req);
		
		if(ch) {
			session.invalidate();
			return "admin/admin_login";
		}
		else {
			return "admin/admin_login";
		}
	}
}
