package edu.univ.ezen.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
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

import edu.univ.ezen.dto.AccountAdminDTO;
import edu.univ.ezen.dto.AccountStudentDTO;
import edu.univ.ezen.dto.EditLogDTO;
import edu.univ.ezen.dto.EtcBoardDTO;
import edu.univ.ezen.dto.EtcBoardReplyDTO;
import edu.univ.ezen.dto.UserBlacklistDTO;
import edu.univ.ezen.service.AccAdminMapper;
import edu.univ.ezen.service.AccMapper;
import edu.univ.ezen.service.EtcBoardMapper;
import edu.univ.ezen.service.LogMapper;

@Controller
public class AdminFreeBoardController {
	
	@Autowired
	EtcBoardMapper etcBoardMapper;
	
	@Autowired
	LogMapper logMapper;
	
	@Autowired
	AccAdminMapper accAdminMapper;
	
	@Autowired
	AccMapper accMapper;
	
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
	
	//공지 게시판 관리
	@RequestMapping("/admin_freeB_list.do")
	public String admin_freeB_list(HttpServletRequest req) {
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
			
			List<EtcBoardDTO> list = etcBoardMapper.etcBoard_list(page);

			int pageCount = etcBoardMapper.etcBoard_listcount();
			
			if(mode == null && search == null && searchString == null) mode = "all";
			else if(mode == null && search != null && searchString != null) mode = "search";
			
			if(mode.equals("all")) {
				list = etcBoardMapper.etcBoard_list(page);
				pageCount = etcBoardMapper.etcBoard_listcount();
			}
			else if(mode.equals("search")) {
				list = etcBoardMapper.etcBoard_findList(search, searchString);
				pageCount = etcBoardMapper.etcBoard_listcount();
			}

			if(pageCount < 21) pageCount = 1;
			else {
				if(pageCount%20 == 0) pageCount = (pageCount/20);
				else pageCount = (pageCount/20)+1;
			}
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("list", list);

			return "admin/admin_freeBoard/admin_freeB_list";
		}
		req.setAttribute("msg", "권한이 없습니다");
		req.setAttribute("url", "admin_index.do");
		return "message";
	}
	
	//자유게시판 차단내역 보기
	@RequestMapping("/admin_freeB_blacklist.do")
	public String admin_freeB_blacklist(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		HttpSession session = req.getSession();
		String authority = (String)session.getAttribute("authority_level");
		
		if(authority.equals("게시판관리자") || authority.equals("마스터관리자")) {
			List<UserBlacklistDTO> list = etcBoardMapper.getBlacklistAll();
			req.setAttribute("list", list);
			return "admin/admin_freeBoard/admin_freeB_blacklist";
		}
		
		req.setAttribute("msg", "권한이 없습니다");
		req.setAttribute("url", "admin_index.do");
		return "message";
	}
		
	//자유게시판 유저 차단하기
	@RequestMapping("/admin_freeB_Binsert.do")
	public String admin_freeB_Binsert(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		HttpSession session = req.getSession();
		String authority = (String)session.getAttribute("authority_level");
		
		if(authority.equals("게시판관리자") || authority.equals("마스터관리자")) {
			String student_id = req.getParameter("student_id");
			String board = req.getParameter("board");
			
			AccountStudentDTO asdto = accMapper.getStudent(student_id);
			
			if(asdto != null) {
				UserBlacklistDTO ubdto = new UserBlacklistDTO(0, student_id, board);
				int res = etcBoardMapper.insertBlacklist(ubdto);
				
				//수정내역 로그 남기기
				EditLogDTO eldto = new EditLogDTO();
				eldto.setId((String)session.getAttribute("id"));
				eldto.setContent("유저 차단");
				eldto.setMemo("차단 아이디 : "+ student_id);
				int elog = logMapper.insertEdit(eldto);
				
				req.setAttribute("msg", student_id +" 유저는 차단되었습니다");
				req.setAttribute("url", "admin_freeB_blacklist.do");
				return "message";
			}
			else {
				req.setAttribute("msg", "입력한 아이디가 존재하지 않습니다");
				req.setAttribute("url", "admin_freeB_blacklist.do");
				return "message";
			}
		}
		
		req.setAttribute("msg", "권한이 없습니다");
		req.setAttribute("url", "admin_index.do");
		return "message";
	}
	
	//자유게시판 유저 차단해제하기
	@RequestMapping("/admin_freeB_Bdelete.do")
	public String admin_freeB_Bdelete(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		HttpSession session = req.getSession();
		String authority = (String)session.getAttribute("authority_level");
		
		if(authority.equals("게시판관리자") || authority.equals("마스터관리자")) {
			String student_id = req.getParameter("student_id");
			
			//수정내역 로그 남기기
			EditLogDTO eldto = new EditLogDTO();
			eldto.setId((String)session.getAttribute("id"));
			eldto.setContent("차단 해제");
			eldto.setMemo("차단 해제 아이디 : "+ student_id);
			int elog = logMapper.insertEdit(eldto);
			
			int res = etcBoardMapper.delBlacklist(student_id);
			req.setAttribute("msg", student_id +" 유저는 차단이 해제되었습니다");
			req.setAttribute("url", "admin_freeB_blacklist.do");
			return "message";
		}
		
		req.setAttribute("msg", "권한이 없습니다");
		req.setAttribute("url", "admin_index.do");
		return "message";
	}
	
	//자유게시판 글 내용 보기
	@RequestMapping("/admin_freeB_view.do")
	public String admin_freeB_view(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		HttpSession session = req.getSession();
		String authority = (String)session.getAttribute("authority_level");
		
		if(authority.equals("게시판관리자") || authority.equals("마스터관리자")) {
			int etc_board_code = Integer.parseInt(req.getParameter("code"));
			
			int res = etcBoardMapper.plusReadCount(etc_board_code);
			EtcBoardDTO ebdto = etcBoardMapper.etcboard_getByNum(etc_board_code);
			
			List<EtcBoardReplyDTO> relist = etcBoardMapper.etcBoardRe_list(etc_board_code);
			
			req.setAttribute("vdto", ebdto);
			req.setAttribute("relist", relist);
			
			return "admin/admin_freeBoard/admin_freeB_view";
		}

		req.setAttribute("msg", "권한이 없습니다");
		req.setAttribute("url", "admin_index.do");
		return "message";
	}
	
	//자유게시판 글 작성
	@RequestMapping("/admin_freeB_insert.do")
	public String admin_freeB_insert(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		HttpSession session = req.getSession();
		String authority = (String)session.getAttribute("authority_level");
		
		if(authority.equals("게시판관리자") || authority.equals("마스터관리자")) {
			AccountAdminDTO dto = accAdminMapper.getAdmin((String)session.getAttribute("id"));
			req.setAttribute("writer", dto.getName());
			
			return "admin/admin_freeBoard/admin_freeB_insert";
		}
		
		req.setAttribute("msg", "권한이 없습니다");
		req.setAttribute("url", "admin_index.do");
		return "message";
	}
	
	//자유게시판 글 작성
	@RequestMapping("/admin_freeB_insert_pro.do")
	public String admin_freeB_insert_pro(HttpServletRequest req, 
			@ModelAttribute EtcBoardDTO dto, BindingResult result) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		EtcBoardDTO ebdto = dto;
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile mf = mr.getFile("image");
		HttpSession session = req.getSession();
		
		if(mf == null || mf.isEmpty()) {
			ebdto.setImage("none");
		}
		
		else if(mf != null || !mf.isEmpty()) {
			String filename = mf.getOriginalFilename();
			String fileExtension = filename.substring(filename.lastIndexOf("."));
			String newFilename = UUID.randomUUID().toString() + fileExtension;
			String upPath = session.getServletContext().getRealPath("/resources/freeB_img");
			File file = new File(upPath, newFilename);
			try {
				mf.transferTo(file);
			} catch(IllegalStateException e) {
				e.printStackTrace();
				req.setAttribute("msg", "IllegalStateException! : "+ e.getMessage());
				req.setAttribute("url", "index_admin.do");
				return "message";
			} catch(IOException e) {
				e.printStackTrace();
				req.setAttribute("msg", "IOException! : "+ e.getMessage());
				req.setAttribute("url", "index_admin.do");
				return "message";
			}
			ebdto.setImage(newFilename);
		}
		ebdto.setWriter("관리자");
		ebdto.setReg_date("");
		ebdto.setIp(req.getRemoteAddr());
		
		int res = etcBoardMapper.etcBoard_insert(ebdto);
		
		if(res != 0) {
			//수정내역 로그 남기기
			EditLogDTO eldto = new EditLogDTO();
			eldto.setId((String)session.getAttribute("id"));
			eldto.setContent("자유게시판 글 작성");
			eldto.setMemo("자유게시판 글 작성");
			int elog = logMapper.insertEdit(eldto);
			
			req.setAttribute("msg", "글이 등록되었습니다");
			req.setAttribute("url", "admin_freeB_list.do");
			req.setAttribute("page", 1);
			return "message";
		}
		else {
			req.setAttribute("msg", "글 등록에 실패했습니다");
			req.setAttribute("url", "admin_freeB_list.do");
			req.setAttribute("page", 1);
			return "message";
		}
	}
	
	//글 수정 매핑
	@RequestMapping("/admin_freeB_edit.do")
	public String admin_freeB_edit(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		HttpSession session = req.getSession();
		int code = Integer.parseInt(req.getParameter("code"));
		String authority = (String)session.getAttribute("authority_level");
		
		if(authority.equals("게시판관리자") || authority.equals("마스터관리자")) {
			EtcBoardDTO edto = etcBoardMapper.etcboard_getByNum(code);
			req.setAttribute("dto", edto);
			return "admin/admin_freeBoard/admin_freeB_edit";
		}
		
		req.setAttribute("msg", "권한이 없습니다");
		req.setAttribute("url", "admin_index.do");
		return "message";
	}
	
	//글 수정 처리 매핑
	@RequestMapping("/admin_freeB_edit_pro.do")
	public String admin_freeB_edit_pro(HttpServletRequest req, 
			@ModelAttribute EtcBoardDTO dto, BindingResult result) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		EtcBoardDTO ebdto = dto;
		Calendar cal = Calendar.getInstance();
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile mf = mr.getFile("image");
		HttpSession session = req.getSession();
		
		if(mf == null || mf.isEmpty()) {
			ebdto.setImage(mr.getParameter("image2"));
		}
		
		else if(mf != null || !mf.isEmpty()) {
			String filename = mf.getOriginalFilename();
			String fileExtension = filename.substring(filename.lastIndexOf("."));
			String newFilename = UUID.randomUUID().toString() + fileExtension;
			String upPath = session.getServletContext().getRealPath("/resources/freeB_img");
			File file = new File(upPath, newFilename);
			File fileK = new File(upPath, mr.getParameter("image2"));
			boolean killF = file.delete();
			try {
				mf.transferTo(file);
			} catch(IllegalStateException e) {
				e.printStackTrace();
				req.setAttribute("msg", "IllegalStateException! : "+ e.getMessage());
				req.setAttribute("url", "index_admin.do");
				return "message";
			} catch(IOException e) {
				e.printStackTrace();
				req.setAttribute("msg", "IOException! : "+ e.getMessage());
				req.setAttribute("url", "index_admin.do");
				return "message";
			}
			ebdto.setImage(newFilename);
		}
		
		String year = ""+cal.get(Calendar.YEAR);
		String month = "";
		String day = ""+cal.get(Calendar.DAY_OF_MONTH);
		
		if((cal.get(Calendar.MONTH)+1) > 9) {
			month = ""+(cal.get(Calendar.MONTH)+1);
		}
		else {
			month = "0"+(cal.get(Calendar.MONTH)+1);
		}
		
		ebdto.setReg_date("");
		ebdto.setIp(req.getRemoteAddr());
		ebdto.setContent(ebdto.getContent()+"-"+year+month+day+
				"관리자에 의해 수정되었습니다.");
		
		int res = etcBoardMapper.etcBoard_update(ebdto);
		
		if(res != 0) {
			//수정내역 로그 남기기
			EditLogDTO eldto = new EditLogDTO();
			eldto.setId((String)session.getAttribute("id"));
			eldto.setContent("자유게시판 글 수정:"+ebdto.getSubject());
			eldto.setMemo("자유게시판 글 수정");
			int elog = logMapper.insertEdit(eldto);
			
			req.setAttribute("msg", "글이 수정되었습니다");
			req.setAttribute("url", "admin_freeB_list.do");
			req.setAttribute("page", 1);
			return "message";
		}
		else {
			req.setAttribute("msg", "글 수정에 실패했습니다");
			req.setAttribute("url", "admin_freeB_list.do");
			req.setAttribute("page", 1);
			return "message";
		}
	}
	
	//글 삭제 매핑
	@RequestMapping("/admin_freeB_delete.do")
	public String admin_freeB_delete(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		HttpSession session = req.getSession();
		int code = Integer.parseInt(req.getParameter("code"));
		
		int res = etcBoardMapper.etcBoard_del(code);
		int res_reply = etcBoardMapper.etcBoardRe_deleteAll(code);
		
		if(req.getParameter("image") == null || req.getParameter("image").equals("none")) {
			
		}
		else {
			String upPath = session.getServletContext().getRealPath("/resources/freeB_img");
			File fileK = new File(upPath, req.getParameter("image"));
			boolean killF = fileK.delete();
		}
		req.setAttribute("msg", "글을 삭제하였습니다");
		req.setAttribute("url", "admin_freeB_list.do");
		req.setAttribute("page", 1);
		return "message";
	}
}
