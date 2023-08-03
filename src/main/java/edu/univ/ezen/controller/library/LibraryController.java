package edu.univ.ezen.controller.library;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.univ.ezen.dto.BookDTO;
import edu.univ.ezen.dto.InfoBoardDTO;
import edu.univ.ezen.service.BookMapper;
import edu.univ.ezen.service.InfoBoardMapper;

@Controller
public class LibraryController {
	
	@Autowired
	private InfoBoardMapper infoBoardMapper;
	
	@Autowired
	private BookMapper bookMapper;
	
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
	
	//도서관 메인
	@RequestMapping("/library_main.do")
	public String library_main(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) {
			return "/loginPortal/login_main";
			}
		HttpSession session = req.getSession();
		String type2 = (String)session.getAttribute("type");
		if(!type2.equals("학생")) {
			req.setAttribute("msg", "학생 전용 도서관입니다");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		
		String page = "1";
		String type = "infoLib";
		List<InfoBoardDTO> noticelist = infoBoardMapper.infoBoard_list(type, Integer.parseInt(page));
		req.setAttribute("noticelist", noticelist);
		List<BookDTO> bookImage_list = bookMapper.listBook_Image();
		req.setAttribute("bookImage", bookImage_list);
		return "library/library_main";
	}
	
	//도서관 소개
	@RequestMapping("/library_info.do")
	public String library_info(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		
		return "library/library_info";
	}
}
