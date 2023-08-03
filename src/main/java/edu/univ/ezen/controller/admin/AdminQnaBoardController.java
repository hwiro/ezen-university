package edu.univ.ezen.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.univ.ezen.dto.QnaBoardDTO;
import edu.univ.ezen.service.AccAdminMapper;
import edu.univ.ezen.service.LogMapper;
import edu.univ.ezen.service.QnaBoardMapper;

@Controller
public class AdminQnaBoardController {

	@Autowired
	LogMapper logMapper;
	
	@Autowired
	AccAdminMapper accAdminMapper;
	
	@Autowired
	QnaBoardMapper qnaBoardMapper;
	
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
	
	//qna 게시판 관리
	@RequestMapping("/admin_qnaBoard_list.do")
	public String admin_qnaBoard_list(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) {
			return "admin/admin_login";
		}
		
		HttpSession session = req.getSession();
		String authority = (String)session.getAttribute("authority_level");
		
		if(authority.equals("게시판관리자") || authority.equals("마스터관리자")) {
			String mode = req.getParameter("mode");
			String pageS = req.getParameter("page");
			String search = req.getParameter("search");
			String searchString = req.getParameter("searchString");
			int page = 1;
			
			if(pageS != null) page = Integer.parseInt(pageS);
			
			List<QnaBoardDTO> list = new ArrayList<>();;
			
			int pageCount = 1;
			
			if(mode == null && search == null && searchString == null) mode = "all";
			else if(mode == null && search != null && searchString != null) mode = "search";
			
			if(mode.equals("all")) {
				list = qnaBoardMapper.qnaBoard_list(page);
				pageCount = qnaBoardMapper.qnaBoard_countList();
			}
			else if(mode.equals("search")) {
				searchString = "%" + searchString + "%";
				list = qnaBoardMapper.qnaBoard_listSearch(page, search, searchString);
				pageCount = qnaBoardMapper.qnaBoard_countListSearch(search, searchString);
			}

			if(pageCount < 21) pageCount = 1;
			else {
				if(pageCount%20 == 0) pageCount = (pageCount/20);
				else pageCount = (pageCount/20)+1;
			}
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("list", list);
			req.setAttribute("mode", mode);

			return "admin/admin_qnaBoard/admin_qnaBoard";
		}
		req.setAttribute("msg", "권한이 없습니다");
		req.setAttribute("url", "admin_index.do");
		return "message";
	}
	
	//자주묻는 질문 글 작성
	@RequestMapping("/admin_qnaBoard_insert.do")
	public String admin_qnaBoard_insert(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		HttpSession session = req.getSession();
		String authority = (String)session.getAttribute("authority_level");
		
		if(authority.equals("게시판관리자") || authority.equals("마스터관리자")) {
			return "admin/admin_qnaBoard/admin_qnaBoard_insert";
		}
		
		req.setAttribute("msg", "권한이 없습니다");
		req.setAttribute("url", "admin_index.do");
		return "message";
	}
	
	//자주묻는 질문 글 작성 처리
	@RequestMapping("/admin_qnaBoard_insert_pro.do")
	public String admin_qnaBoard_insert_pro(HttpServletRequest req, 
			@ModelAttribute QnaBoardDTO dto, BindingResult result) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		QnaBoardDTO qdto = dto;
		
		int res = qnaBoardMapper.qnaBoard_insert(qdto);
		
		if(res != 0) {
			req.setAttribute("msg", "글이 등록되었습니다");
			req.setAttribute("url", "admin_qnaBoard_list.do");
			return "message";
		}
		else {
			req.setAttribute("msg", "글 등록에 실패했습니다");
			req.setAttribute("url", "admin_qnaBoard_list.do");
			return "message";
		}
	}
	
	//글 수정 매핑
	@RequestMapping("/admin_qnaBoard_edit.do")
	public String admin_qnaBoard_edit(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		HttpSession session = req.getSession();
		int code = Integer.parseInt(req.getParameter("code"));
		String authority = (String)session.getAttribute("authority_level");
		
		if(authority.equals("게시판관리자") || authority.equals("마스터관리자")) {
			QnaBoardDTO qdto = qnaBoardMapper.qnaBoard_get(code);
			req.setAttribute("dto", qdto);
			return "admin/admin_qnaBoard/admin_qnaBoard_edit";
		}
		
		req.setAttribute("msg", "권한이 없습니다");
		req.setAttribute("url", "admin_index.do");
		return "message";
	}
	
	//글 수정 처리 매핑
	@RequestMapping("/admin_qnaBoard_edit_pro.do")
	public String admin_qnaBoard_edit_pro(HttpServletRequest req, 
			@ModelAttribute QnaBoardDTO dto, BindingResult result) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		QnaBoardDTO qdto = dto;
		
		int res = qnaBoardMapper.qnaBoard_update(qdto);
		
		if(res != 0) {
			req.setAttribute("msg", "글이 수정되었습니다");
			req.setAttribute("url", "admin_qnaBoard_list.do");
			return "message";
		}
		else {
			req.setAttribute("msg", "글 수정에 실패했습니다");
			req.setAttribute("url", "admin_qnaBoard_list.do");
			return "message";
		}
	}
	
	//글 삭제 매핑
	@RequestMapping("/admin_qnaBoard_delete.do")
	public String admin_qnaBoard_delete(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		HttpSession session = req.getSession();
		int code = Integer.parseInt(req.getParameter("code"));
		String authority = (String)session.getAttribute("authority_level");
		
		if(authority.equals("게시판관리자") || authority.equals("마스터관리자")) {
			int res = qnaBoardMapper.qnaBoard_delete(code);
			
			req.setAttribute("msg", "글을 삭제하였습니다");
			req.setAttribute("url", "admin_qnaBoard_list.do");
			return "message";
		}
		else {
			req.setAttribute("msg", "권한이 없습니다");
			req.setAttribute("url", "admin_qnaBoard_list.do");
			return "message";
		}
	}
}