package edu.univ.ezen.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import edu.univ.ezen.dto.BookDTO;
import edu.univ.ezen.dto.EditLogDTO;
import edu.univ.ezen.service.BookMapper;
import edu.univ.ezen.service.LogMapper;

@Controller
public class AdminBookController {
	
	@Autowired
	private BookMapper bookMapper;
	
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
	
	//도서관리 페이지
	@RequestMapping("/admin_book_list.do")
	public String admin_booklist(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		HttpSession session = req.getSession();
		String authority = (String)session.getAttribute("authority_level");
		String pageS = req.getParameter("page");
		if(pageS == null) pageS = "1";
		
		if(authority.equals("도서관리자") || authority.equals("마스터관리자")) {
			List<BookDTO> booklist = bookMapper.listBook(Integer.parseInt(pageS));
			req.setAttribute("booklist", booklist);
			
			int pageCount = bookMapper.countBook();
			
			if(pageCount < 11) pageCount = 1;
			else {
				if(pageCount%10 == 0) pageCount = (pageCount/10);
				else pageCount = (pageCount/10)+1;
			}
			
			req.setAttribute("pageCount", pageCount);
			
			return "admin/admin_book/admin_book_list";
		}
		
		req.setAttribute("msg", "권한이 없습니다");
		req.setAttribute("url", "admin_index.do");
		return "message";
	}
	
	//새 도서 등록 페이지
	@RequestMapping("/admin_book_insert.do")
	public String admin_book_insert(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		req.setAttribute("mode", "insert");
		
		return "admin/admin_book/admin_book_insert";
	}
	
	//새 도서 등록 처리
	@RequestMapping("/admin_book_insert_pro.do")
	public ModelAndView admin_book_insert_pro(HttpServletRequest req, 
			@ModelAttribute BookDTO dto, BindingResult result) {
		ModelAndView mav = new ModelAndView("message");
		
		boolean ch = id_check(req);
		if(!ch) {
			mav.setViewName("admin/admin_login");
			return mav;
		}
		HttpSession session = req.getSession();
		
		BookDTO bdto = dto;
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile mf = mr.getFile("image");
		
		if(mf.isEmpty()) {
			bdto.setImage("none");
		}
		else {
			String filename = mf.getOriginalFilename();
			String fileExtension = filename.substring(filename.lastIndexOf("."));
			String newFilename = UUID.randomUUID().toString() + fileExtension;
			String upPath = session.getServletContext().getRealPath("/resources/book_img");
			File file = new File(upPath, newFilename);
			try {
				mf.transferTo(file);
			} catch(IllegalStateException e) {
				e.printStackTrace();
				mav.addObject("msg", "IllegalStateException! : "+ e.getMessage());
				mav.addObject("url", "index_admin.do");
				return mav;
			} catch(IOException e) {
				e.printStackTrace();
				mav.addObject("msg", "IOException! : "+ e.getMessage());
				mav.addObject("url", "index_admin.do");
				return mav;
			}
			bdto.setImage(newFilename);
		}
		
		int res = bookMapper.insertBook(bdto);
		
		if(res != 0) {
			mav.addObject("msg", "도서 등록이 완료되었습니다");
			mav.addObject("url", "admin_book_list.do");
			mav.addObject("page", 1);
			
			//수정내역 로그 남기기
			EditLogDTO eldto = new EditLogDTO();
			eldto.setId((String)session.getAttribute("id"));
			eldto.setContent("도서등록:"+bdto.getBook_title());
			eldto.setMemo(req.getParameter("memo"));
			int elog = logMapper.insertEdit(eldto);
			
			return mav;
		}
		else {
			mav.addObject("msg", "도서등록에 실패했습니다");
			mav.addObject("url", "admin_book_list.do");
			return mav;
		}
	}
	
	//도서 삭제 매핑
	@RequestMapping("/admin_book_del.do")
	public ModelAndView admin_book_del(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("message");
		
		boolean ch = id_check(req);
		if(!ch) {
			mav.setViewName("admin/admin_login");
			return mav;
		}
		
		String book_id = req.getParameter("book_id");
		BookDTO bdto = bookMapper.getBook(book_id);
		
		String upPath = "/resources/book_img/"+bdto.getImage();
		HttpSession session = req.getSession();
		File file = new File(session.getServletContext().getRealPath(upPath));
		int res = bookMapper.deleteBook(book_id);
		boolean killF = file.delete();
		
		if(res != 0) {
			if(killF) {
				mav.addObject("msg", "도서도 파일도 삭제되었습니다");
				mav.addObject("url", "admin_book_list.do");
				
				//수정내역 로그 남기기
				EditLogDTO eldto = new EditLogDTO();
				eldto.setId((String)session.getAttribute("id"));
				eldto.setContent("도서삭제:"+bdto.getBook_title());
				eldto.setMemo("도서삭제");
				int elog = logMapper.insertEdit(eldto);
			}
			else {
				mav.addObject("msg", "도서는 삭제되었으나, 파일은 삭제되지 않았습니다");
				mav.addObject("url", "admin_book_list.do");
			}
		}
		else {
			mav.addObject("msg", "도서도 파일도 삭제에 실패했습니다");
			mav.addObject("url", "admin_book_list.do");
		}		
		return mav;
	}
	
	//도서정보 수정
	@RequestMapping("/admin_book_edit.do")
	public String admin_book_edit(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		String book_id = req.getParameter("book_id");
		BookDTO bdto = bookMapper.getBook(book_id);
		
		req.setAttribute("bdto",  bdto);
		req.setAttribute("mode", "edit");
		
		return "admin/admin_book/admin_book_insert";
	}
	
	//도서 수정 처리
	@RequestMapping("/admin_book_edit_pro.do")
	public ModelAndView admin_book_edit_pro(MultipartHttpServletRequest req, 
			@ModelAttribute BookDTO dto, BindingResult result) {
		ModelAndView mav = new ModelAndView("message");
		boolean ch = id_check(req);
		if(!ch) {
				mav.setViewName("admin/admin_login");
					return mav;
		}
      
		HttpSession session = req.getSession();
		String book_id = req.getParameter("book_id");
		MultipartFile mf = req.getFile("image");
		String filename = mf.getOriginalFilename();
		BookDTO pbdto = bookMapper.getBook(book_id);
		BookDTO bdto = dto;
		String editBookName = pbdto.getBook_title();
		if (filename == null || filename.equals("")) {
			if (req.getParameter("image2").equals("none")) {
				bdto.setImage("none");
			} else {
				bdto.setImage(req.getParameter("image2"));
				String pUpPath = "/resources/book_img/" + pbdto.getImage();
				String fileExtension = bdto.getImage().substring(bdto.getImage().lastIndexOf("."));
				String newFilename = UUID.randomUUID().toString() + fileExtension;
				File pfile = new File(session.getServletContext().getRealPath(pUpPath));
				if (mf.getSize() > 0) {
					try {
						mf.transferTo(pfile);
					} catch (Exception e) {
						e.printStackTrace();
					}
					bdto.setImage(newFilename);
				} else {
					bdto.setImage(req.getParameter("image2"));
				}
			}
		}else {
			String fileExtension = filename.substring(filename.lastIndexOf("."));
			String newFilename = UUID.randomUUID().toString() + fileExtension;
			String upPath = session.getServletContext().getRealPath("/resources/book_img");
			File file = new File(upPath, newFilename);
			if(mf.getSize() > 0 ) {
				try {
					mf.transferTo(file);
				}catch (Exception e) {
					e.printStackTrace();
				}
				bdto.setImage(newFilename);
			}else {
				bdto.setImage(req.getParameter("image2"));
			}
		}
		int res = bookMapper.editBook(bdto);
		if(res != 0) {
			mav.addObject("msg", "도서가 수정되었습니다");
			mav.addObject("url", "admin_book_list.do");
         
			//수정내역 로그 남기기
			EditLogDTO eldto = new EditLogDTO();
			eldto.setId((String)session.getAttribute("id"));
			eldto.setContent("도서수정:"+editBookName);
			eldto.setMemo(req.getParameter("memo"));
			int elog = logMapper.insertEdit(eldto);
		}
		else {
			mav.addObject("msg", "도서 수정에 실패했습니다");
			mav.addObject("url", "admin_book_list.do");
		}
      
		return mav;
	}
	
	//책 상세보기 매핑
	@RequestMapping("/admin_book_view")
	public String admin_book_view(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		String book_id = req.getParameter("book_id");
		BookDTO bdto = bookMapper.getBook(book_id);
		
		req.setAttribute("bdto", bdto);
		
		return "admin/admin_book/admin_book_view";
	}
}
