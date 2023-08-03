package edu.univ.ezen.controller.freeBoard;

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

import edu.univ.ezen.dto.AccountStudentDTO;
import edu.univ.ezen.dto.EtcBoardDTO;
import edu.univ.ezen.dto.EtcBoardReplyDTO;
import edu.univ.ezen.dto.Thumb_logDTO;
import edu.univ.ezen.dto.UserBlacklistDTO;
import edu.univ.ezen.dto.UserNoticeDTO;
import edu.univ.ezen.service.AccMapper;
import edu.univ.ezen.service.EtcBoardMapper;
import edu.univ.ezen.service.Thumb_logMapper;
import edu.univ.ezen.service.UserNoticeMapper;

@Controller
public class FreeBoardController {
	
	@Autowired
	AccMapper accMapper;
	
	@Autowired
	EtcBoardMapper etcBoardMapper;
	
	@Autowired
	Thumb_logMapper thumb_logMapper;
	
	@Autowired
	UserNoticeMapper userNoticeMapper;
	
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
	
	//자유게시판 글 목록
	@RequestMapping("/freeB_list.do")
	public String freeB_list(HttpServletRequest req) {		
		String mode = req.getParameter("mode");
		String pageS = req.getParameter("page");
		String search = req.getParameter("search");
		String searchString = req.getParameter("searchString");
		int page = 1;
		
		if(pageS != null) page = Integer.parseInt(pageS);
		
		List<EtcBoardDTO> list = null;
		
		if(mode == null && search == null && searchString == null) mode = "all";
		else if(mode == null && search != null && searchString != null) mode = "search";
		
		int pageCount = 1;
		
		if(mode.equals("all")) {
			list = etcBoardMapper.etcBoard_list(page);
			pageCount = etcBoardMapper.etcBoard_listcount();
		}
		else if(mode.equals("search")) {
			searchString = "%"+ searchString +"%";
			list = etcBoardMapper.etcBoard_findList(search, searchString);
			pageCount = etcBoardMapper.etcBoard_listcount_search(search, searchString);
		}
		else {
			list = etcBoardMapper.etcBoard_list_best(page);
			pageCount = etcBoardMapper.etcBoard_listcount_best();
		}
		
		if(pageCount < 21) pageCount = 1;
		else {
			if(pageCount%20 == 0) pageCount = (pageCount/20);
			else pageCount = (pageCount/20)+1;
		}
		
		for(EtcBoardDTO dto : list) {
			dto.setIp(""+etcBoardMapper.etcBoardRe_listCount(dto.getEtc_board_code()));
		}
		
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("list", list);
		req.setAttribute("mode", mode);
		req.setAttribute("page", page);
		req.setAttribute("blank", 1000 - (list.size()*10));
		
		return "freeBoard/freeB_list";
	}
	
	//자유게시판 글 보기
	@RequestMapping("/freeB_view.do")
	public String freeB_view(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		HttpSession session = req.getSession();
		String type = (String)session.getAttribute("type");
		if(!type.equals("학생")) {
			req.setAttribute("msg", "학생 전용 게시판입니다");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		
		int etc_board_code = Integer.parseInt(req.getParameter("code"));
		String mode = req.getParameter("mode");
		String pageS = req.getParameter("page");
		String search = req.getParameter("search");
		String searchString = req.getParameter("searchString");
		String student_id = (String)session.getAttribute("id");
		int page = 1;
		
		if(pageS != null) page = Integer.parseInt(pageS);
		
		int res = etcBoardMapper.plusReadCount(etc_board_code);
		EtcBoardDTO ebdto = etcBoardMapper.etcboard_getByNum(etc_board_code);
		List<UserNoticeDTO> unlist = userNoticeMapper.getUserNotice(student_id);
		
		for(UserNoticeDTO undto : unlist) {
			if(undto.getStudent_id().equals(student_id)) {
				int del = userNoticeMapper.deleteUserNotice(undto.getUrl());
			}
		}
		
		List<EtcBoardDTO> list = null;
		int pageCount = 1;
		
		if(mode == null) mode = "all";
		
		if(mode.equals("all")) {
			list = etcBoardMapper.etcBoard_list(page);
			pageCount = etcBoardMapper.etcBoard_listcount();
		}
		else if(mode.equals("search")) {
			list = etcBoardMapper.etcBoard_findList(search, searchString);
			pageCount = etcBoardMapper.etcBoard_listcount();
		}
		else {
			list = etcBoardMapper.etcBoard_list_best(page);
			pageCount = etcBoardMapper.etcBoard_listcount_best();
		}
		
		if(pageCount < 21) pageCount = 1;
		else {
			if(pageCount%20 == 0) pageCount = (pageCount/20);
			else pageCount = (pageCount/20)+1;
		}
		
		List<EtcBoardReplyDTO> relist = etcBoardMapper.etcBoardRe_list(etc_board_code);
		
		for(EtcBoardDTO dto : list) {
			dto.setIp(""+etcBoardMapper.etcBoardRe_listCount(dto.getEtc_board_code()));
		}
		
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("vdto", ebdto);
		req.setAttribute("list", list);
		req.setAttribute("relist", relist);
		req.setAttribute("mode", mode);
		req.setAttribute("page", page);
		
		return "freeBoard/freeB_view";
	}
	
	//자유게시판 글 작성
	@RequestMapping("/freeB_insert.do")
	public String freeB_insert(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		HttpSession session = req.getSession();
		String type = (String)session.getAttribute("type");
		if(!type.equals("학생")) {
			req.setAttribute("msg", "학생 전용 게시판입니다");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		
		AccountStudentDTO dto = accMapper.getStudent((String)session.getAttribute("id"));
		req.setAttribute("writer", dto.getName());
		
		return "freeBoard/freeB_insert";
	}
	
	//자유게시판 글 작성
	@RequestMapping("/freeB_insert_pro.do")
	public String freeB_insert_pro(HttpServletRequest req, 
			@ModelAttribute EtcBoardDTO dto, BindingResult result) {
		boolean ch = id_check(req);
		if(!ch) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		
		EtcBoardDTO ebdto = dto;
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile mf = mr.getFile("image");
		
		List<UserBlacklistDTO> blist = etcBoardMapper.getBlacklistAll();
		
		for(UserBlacklistDTO ubdto : blist) {
			if(ubdto.getStudent_id().equals(ebdto.getWriter_id()) && ubdto.getBoard().equals("freeB")) {
				req.setAttribute("msg", "글 작성이 차단된 계정입니다");
				req.setAttribute("url", "freeB_list.do");
				return "message";
			}
		}
		
		if(mf == null || mf.isEmpty()) {
			ebdto.setImage("none");
		}
		
		else if(mf != null || !mf.isEmpty()) {
			String filename = mf.getOriginalFilename();
			String fileExtension = filename.substring(filename.lastIndexOf("."));
			String newFilename = UUID.randomUUID().toString() + fileExtension;
			HttpSession session = req.getSession();
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
		
		ebdto.setReg_date("");
		ebdto.setIp(req.getRemoteAddr());
		
		int res = etcBoardMapper.etcBoard_insert(ebdto);
		
		if(res != 0) {
			req.setAttribute("msg", "글이 등록되었습니다");
			req.setAttribute("url", "freeB_list.do");
			req.setAttribute("page", 1);
			return "message";
		}
		else {
			req.setAttribute("msg", "글 등록에 실패했습니다");
			req.setAttribute("url", "freeB_list.do");
			req.setAttribute("page", 1);
			return "message";
		}
	}
	
	//글 수정 매핑
	@RequestMapping("/freeB_edit.do")
	public String freeB_edit(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		
		HttpSession session = req.getSession();
		String myid = (String)session.getAttribute("id");
		String wid = req.getParameter("id");
		int code = Integer.parseInt(req.getParameter("code"));
		req.setAttribute("imgPath", "resources/img");
		
		if(myid.equals(wid)) {
			EtcBoardDTO edto = etcBoardMapper.etcboard_getByNum(code);
			req.setAttribute("dto", edto);
			return "freeBoard/freeB_edit";
		}
		else {
			req.setAttribute("msg", "본인이 작성한 글만 수정 가능합니다");
			req.setAttribute("url", "freeB_view.do?code="+code);
			return "message";
		}		
	}
	
	//글 수정 처리 매핑
	@RequestMapping("/freeB_edit_pro.do")
	public String freeB_edit_pro(HttpServletRequest req, 
			@ModelAttribute EtcBoardDTO dto, BindingResult result) {
		boolean ch = id_check(req);
		if(!ch) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		
		EtcBoardDTO ebdto = dto;
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile mf = mr.getFile("image");
		
		if(mf == null || mf.isEmpty()) {
			ebdto.setImage(mr.getParameter("image2"));
		}
		
		else if(mf != null || !mf.isEmpty()) {
			String filename = mf.getOriginalFilename();
			String fileExtension = filename.substring(filename.lastIndexOf("."));
			String newFilename = UUID.randomUUID().toString() + fileExtension;
			HttpSession session = req.getSession();
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
		
		ebdto.setReg_date("");
		ebdto.setIp(req.getRemoteAddr());
		
		int res = etcBoardMapper.etcBoard_update(ebdto);
		
		if(res != 0) {
			req.setAttribute("msg", "글이 수정되었습니다");
			req.setAttribute("url", "freeB_list.do");
			req.setAttribute("page", 1);
			return "message";
		}
		else {
			req.setAttribute("msg", "글 수정에 실패했습니다");
			req.setAttribute("url", "freeB_list.do");
			req.setAttribute("page", 1);
			return "message";
		}
	}
	
	//글 삭제 매핑
	@RequestMapping("/freeB_delete.do")
	public String freeB_delete(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		
		HttpSession session = req.getSession();
		String myid = (String)session.getAttribute("id");
		String wid = req.getParameter("id");
		int code = Integer.parseInt(req.getParameter("code"));
		
		if(myid.equals(wid)) {
			int res = etcBoardMapper.etcBoard_del(code);//글 삭제
			int res_reply = etcBoardMapper.etcBoardRe_deleteAll(code);//종속된 댓글 삭제
			int res_thumblog = thumb_logMapper.thumblog_delPost(code);//종속된 추천로그 삭제
			String upPath = session.getServletContext().getRealPath("/resources/freeB_img");
			File fileK = new File(upPath, req.getParameter("image"));
			boolean killF = fileK.delete();
			req.setAttribute("msg", "글을 삭제하였습니다");
			req.setAttribute("url", "freeB_list.do");
			req.setAttribute("page", 1);
			return "message";
		}
		else {
			req.setAttribute("msg", "본인이 작성한 글만 삭제 가능합니다");
			req.setAttribute("url", "freeB_view.do?code="+code);
			return "message";
		}		
	}
	
	//자유게시판 글 추천
	@RequestMapping("/freeB_thumbup.do")
	public String freeB_thumbup(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		
		HttpSession session = req.getSession();
		int code = Integer.parseInt(req.getParameter("code"));
		String id = (String)session.getAttribute("id");
		
		Thumb_logDTO tldtoS = thumb_logMapper.thumblog_getlog(code, id);
		
		if(tldtoS == null) {
			Thumb_logDTO tdto = new Thumb_logDTO(0, code, id);
			int res = thumb_logMapper.thumblog_Insert(tdto);
			int res2 = etcBoardMapper.plusThumb(code);
			String student_id = etcBoardMapper.etcboard_getByNum(code).getWriter_id();
			
			if(!id.equals(student_id)) {
				String url = "freeB_view.do?code="+ code;
				UserNoticeDTO undto = new UserNoticeDTO(0, student_id, "작성한 게시글이 추천을 받았습니다", url);
				int res3 = userNoticeMapper.insertUserNotice(undto);
			}
			
			req.setAttribute("msg", "추천하였습니다");
			req.setAttribute("url", "freeB_view.do?code="+code);
		}
		else {
			req.setAttribute("msg", "이미 추천하셨습니다");
			req.setAttribute("url", "freeB_view.do?code="+code);
		}
		return "message";
	}
	
	//댓글 작성 매핑
	@RequestMapping("/freeB_reply_insert.do")
	public String freeB_reply_insert(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		
		HttpSession session = req.getSession();
		String writer_id = req.getParameter("writer");
		String content = req.getParameter("content");
		int ref_group = Integer.parseInt(req.getParameter("ref_group"));
		String ip = req.getRemoteAddr();
		
		List<UserBlacklistDTO> blist = etcBoardMapper.getBlacklistAll();
		
		for(UserBlacklistDTO ubdto : blist) {
			if(ubdto.getStudent_id().equals(writer_id) && ubdto.getBoard().equals("freeB")) {
				req.setAttribute("msg", "글 작성이 차단된 계정입니다");
				req.setAttribute("url", "freeB_list.do");
				return "message";
			}
		}
		
		String writer = accMapper.getStudent(writer_id).getName();
		
		EtcBoardReplyDTO erdto = new EtcBoardReplyDTO(0, writer, writer_id, content,
				"", ip, ref_group);
		String student_id = etcBoardMapper.etcboard_getByNum(ref_group).getWriter_id();
		
		int res = etcBoardMapper.etcBoardRe_insert(erdto);
		
		if(res != 0) {
			if(!student_id.equals((String)session.getAttribute("id"))) {
				String url = "freeB_view.do?code="+ ref_group;
				UserNoticeDTO undto = new UserNoticeDTO(0, student_id, "작성한 게시글에 댓글이 달렸습니다", url);
				int res2 = userNoticeMapper.insertUserNotice(undto);
			}
			
			req.setAttribute("msg", "댓글이 작성되었습니다");
			req.setAttribute("url", "freeB_view.do?code="+ref_group);
		}
		else {
			req.setAttribute("msg", "댓글 작성에 실패했습니다");
			req.setAttribute("url", "freeB_view.do?code="+ref_group);
		}
		
		return "message";
	}
	
	//댓글 삭제 매핑
	@RequestMapping("/freeB_reply_delete.do")
	public String freeB_reply_delete(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		
		HttpSession session = req.getSession();
		String myid = (String)session.getAttribute("id");
		String wid = req.getParameter("id");
		String ref_group = req.getParameter("ref_group");
		String authority = (String)session.getAttribute("authority_level");
		
		if(authority == null) authority = "사용자";
		
		if(myid.equals(wid) || authority.equals("게시판관리자") || authority.equals("마스터관리자")) {
			int code = Integer.parseInt(req.getParameter("code"));
			int res = etcBoardMapper.etcBoardRe_delete(code);
			req.setAttribute("msg", "댓글을 삭제하였습니다");
			req.setAttribute("url", "freeB_view.do?code="+ref_group);
			return "message";
		}
		else {
			req.setAttribute("msg", "본인이 작성한 댓글만 삭제 가능합니다");
			req.setAttribute("url", "freeB_view.do?code="+ref_group);
			return "message";
		}
	}
}
