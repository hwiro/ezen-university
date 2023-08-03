package edu.univ.ezen.controller.library;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.univ.ezen.dto.AccountStudentDTO;
import edu.univ.ezen.dto.BookDTO;
import edu.univ.ezen.dto.BookRentDTO;
import edu.univ.ezen.service.AccMapper;
import edu.univ.ezen.service.BookMapper;
import edu.univ.ezen.service.BookRentMapper;

@Controller
public class LibraryMyLibraryController {

	@Autowired
	private BookRentMapper bookRentMapper;
	
	@Autowired
	private BookMapper bookMapper;
	
	@Autowired
	private AccMapper accMapper;
	
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
	
	//도서관 myLibrary(나의 대여 현황)
	@RequestMapping("/library_rentList.do")
	public String library_myLibrary_list(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		
		HttpSession session = req.getSession();
		List<BookRentDTO> list = bookRentMapper.listRentPersonal((String)session.getAttribute("id"));
		
		req.setAttribute("listRent", list);	
		
		return "library/library_rentList";
	}
	
	//도서관 도서 대여하기
	@RequestMapping("/library_insertRent.do")
	public ModelAndView library_myLibrary_insertRent(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("message");
		
		boolean ch = id_check(req);
		if(!ch) {
			mav.setViewName("/loginPortal/login_main");
			return mav;
		}
		
		HttpSession session = req.getSession();
		String book_id = req.getParameter("book_id");
		BookDTO bookdto = bookMapper.getBook(book_id);
		AccountStudentDTO studto = accMapper.getStudent((String)session.getAttribute("id"));
		BookRentDTO brdto = new BookRentDTO();
		brdto.setBook_id(bookdto.getBook_id());
		brdto.setBook_name(bookdto.getBook_title());
		brdto.setStudent_id(studto.getStudent_id());
		brdto.setStudent_name(studto.getName());
		brdto.setImage(bookdto.getImage());
		int res = bookRentMapper.insertRent(brdto);
		brdto = bookRentMapper.getBook(book_id);
		mav.addObject("brdto", brdto);
		bookMapper.plusReadCount(book_id);
		if(res != 0) {
			mav.addObject("msg", "도서 대여 성공");
			mav.addObject("url", "library_rentList.do");
			return mav;
		}
		else {
			mav.addObject("msg", "도서 대여 실패");
			mav.addObject("url", "library_bookList.do");
			return mav;
		}
	}
	
	//도서 반납하기
	@RequestMapping("/library_deleteRent.do")
	public ModelAndView library_myLibrary_deleteRent(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("message");
		
		boolean ch = id_check(req);
		if(!ch) {
			mav.setViewName("/loginPortal/login_main");
			return mav;
		}
		
		String book_id = req.getParameter("book_id");
		int res = bookRentMapper.deleteRent(book_id);
		if(res != 0) {
			mav.addObject("msg", "도서 반납 성공");
			mav.addObject("url", "library_rentList.do");
			
			return mav;
		}
		else {
			mav.addObject("msg", "도서 반납 실패");
			mav.addObject("url", "library_rentList.do");
			return mav;
		}
	}
	
}
