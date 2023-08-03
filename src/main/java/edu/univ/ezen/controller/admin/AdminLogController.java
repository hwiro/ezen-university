package edu.univ.ezen.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.univ.ezen.dto.EditLogDTO;
import edu.univ.ezen.dto.InLogDTO;
import edu.univ.ezen.service.EmailCheckMapper;
import edu.univ.ezen.service.LogMapper;

@Controller
public class AdminLogController {

	@Autowired
	private LogMapper logMapper;
	
	@Autowired
	private EmailCheckMapper emailCheckMapper;
	
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
	
	//접속로그 목록
	@RequestMapping("/admin_inlog_list.do")
	public String admin_inlog_list(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		int page = 1;
		if(req.getParameter("page") != null) page = Integer.parseInt(req.getParameter("page"));
		
		List<InLogDTO> inlog = logMapper.listLog(page);
		int expiredMailCount = emailCheckMapper.expiredConfirm();
		
		int pageCount = logMapper.countLog();
		
		if(pageCount < 11) pageCount = 1;
		else {
			if(pageCount%10 == 0) pageCount = (pageCount/10);
			else pageCount = (pageCount/10)+1;
		}
		
		req.setAttribute("inlog", inlog);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("expiredMail", expiredMailCount);
		
		return "admin/admin_log/admin_inlog";
	}
	
	//접속로그 비우기
	@RequestMapping("/admin_inlog_del.do")
	public String admin_inlog_del(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		HttpSession session = req.getSession();
		int res = logMapper.deleteLog();
		
		if(res != 0) {
			req.setAttribute("msg", "접속로그가 비워졌습니다");
			req.setAttribute("url", "admin_inlog_list.do");
			EditLogDTO eldto = new EditLogDTO();
			eldto.setId((String)session.getAttribute("id"));
			eldto.setContent("접속기록 초기화");
			eldto.setMemo("접속기록 정리");
			int elog = logMapper.insertEdit(eldto);
			req.setAttribute("page", 1);
		}
		else {
			req.setAttribute("msg", "접속로그를 비우는데 실패했습니다");
			req.setAttribute("url", "admin_inlog_list.do");
			req.setAttribute("page", 1);
		}
		return "message";
	}
	
	//수정로그 목록
	@RequestMapping("/admin_editlog_list.do")
	public String admin_editlog_list(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		int page = 1;
		if(req.getParameter("page") != null) page = Integer.parseInt(req.getParameter("page"));
		
		List<EditLogDTO> editlog = logMapper.listEdit(page);
		
		int pageCount = logMapper.countELog();
		
		if(pageCount < 11) pageCount = 1;
		else {
			if(pageCount%10 == 0) pageCount = (pageCount/10);
			else pageCount = (pageCount/10)+1;
		}
		
		req.setAttribute("editlog", editlog);
		req.setAttribute("pageCount", pageCount);
		
		return "admin/admin_log/admin_editlog";
	}
	
	//수정로그 비우기
	@RequestMapping("/admin_editlog_del.do")
	public String admin_editlog_del(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		HttpSession session = req.getSession();
		int res = logMapper.deleteEdit();
		
		if(res != 0) {
			req.setAttribute("msg", "수정로그가 비워졌습니다");
			req.setAttribute("url", "admin_editlog_list.do");
			EditLogDTO eldto = new EditLogDTO();
			eldto.setId((String)session.getAttribute("id"));
			eldto.setContent("관리자 활동 내역 초기화");
			eldto.setMemo("관리자 활동 내역 정리");
			int elog = logMapper.insertEdit(eldto);
			req.setAttribute("page", 1);
		}
		else {
			req.setAttribute("msg", "수정로그를 비우는데 실패했습니다");
			req.setAttribute("url", "admin_editlog_list.do");
			req.setAttribute("page", 1);
		}
		return "message";
	}
	
	//만료된, 인증된 이메일 인증 DB지우기
	@RequestMapping("/admin_expired_del.do")
	public String admin_expired_del(HttpServletRequest req) {
		
		int res = emailCheckMapper.delExpiredConfirm();
		
		if(res != 0) {
			req.setAttribute("msg", "만료된 인증을 삭제했습니다");
		}
		else {
			req.setAttribute("msg", "만료된 인증을 제거하지 못했습니다");
		}
		req.setAttribute("url", "admin_inlog_list.do");
		return "message";
	}
}
