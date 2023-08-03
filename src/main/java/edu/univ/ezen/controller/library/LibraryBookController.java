package edu.univ.ezen.controller.library;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.univ.ezen.dto.BookDTO;
import edu.univ.ezen.dto.BookRentDTO;
import edu.univ.ezen.service.BookMapper;
import edu.univ.ezen.service.BookRentMapper;

@Controller
public class LibraryBookController {

	@Autowired
	private BookMapper bookMapper;
	@Autowired
	private BookRentMapper bookRentMapper;
	
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
		
	//도서관 도서목록
	@RequestMapping("/library_bookList.do")
	public String library_book_list(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		
		String page = req.getParameter("page");
		
		List<BookDTO> booklist = bookMapper.listBook(Integer.parseInt(page));
		List<BookRentDTO> list = bookRentMapper.listRent(); //빌린책있는지 비교하기 위함
		
		for(BookDTO bdto : booklist) {
			for(BookRentDTO brdto : list) {
				if(brdto.getBook_id().equals(bdto.getBook_id())) {
					bdto.setRegdate("대여중");
				}
			}
		}
		
		req.setAttribute("booklist", booklist);
		
		int pageCount = bookMapper.countBook();
		
		if(pageCount < 11) pageCount = 1;
		else {
			if(pageCount%10 == 0) pageCount = (pageCount/10);
			else pageCount = (pageCount/10)+1;
		}
		
		req.setAttribute("pageCount", pageCount);
		
		return "library/library_bookList";
	}
	
	//도서관 도서찾기
	@RequestMapping("/library_findBook.do")
	public String library_book_find(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		
		String search = req.getParameter("search");
		String searchString = req.getParameter("searchString");
		List<BookDTO> find = null;
		if(search !=null || searchString !=null) {
			Map<String, String> map = new Hashtable<String, String>();
			map.put("search", search);
			map.put("searchString", "%"+searchString+"%"); //검색 포함된 모든것
			find = bookMapper.findBook(map);
		}
		req.setAttribute("booklist", find);
		
		return "library/library_bookList";
	}
	
	//도서관 도서내용보기
	@RequestMapping("/library_bookView.do")
	public String library_book_view(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		String genre = req.getParameter("genre");
		List<BookDTO> list = bookMapper.listBookImage_getGenre(genre);
		req.setAttribute("image_getGenre", list);
		String book_id = req.getParameter("book_id");
		BookDTO bdto = bookMapper.getBook(book_id);
		req.setAttribute("bdto", bdto);
		return "library/library_bookView";
	}
}
