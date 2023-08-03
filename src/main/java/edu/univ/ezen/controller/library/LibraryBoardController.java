package edu.univ.ezen.controller.library;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.univ.ezen.dto.FileDepositoryDTO;
import edu.univ.ezen.dto.InfoBoardDTO;
import edu.univ.ezen.dto.LibraryBoardDTO;
import edu.univ.ezen.service.FileDepositoryMapper;
import edu.univ.ezen.service.InfoBoardMapper;
import edu.univ.ezen.service.LibraryBoardMapper;

@Controller
public class LibraryBoardController {

	@Autowired
	private InfoBoardMapper infoBoardMapper;
	
	@Autowired
	private FileDepositoryMapper fileDepositoryMapper;
	
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
			
	//도서관 공지사항
	@RequestMapping("/library_notice.do")
	public String library_board_list(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		
		String page = req.getParameter("page");
		String type = "infoLib";
		List<InfoBoardDTO> noticelist = infoBoardMapper.infoBoard_list(type, Integer.parseInt(page));
		req.setAttribute("noticelist", noticelist);
		
		int pageCount = infoBoardMapper.countBoard(type);
		
		if(pageCount < 11) pageCount = 1;
		else {
			if(pageCount%10 == 0) pageCount = (pageCount/10);
			else pageCount = (pageCount/10)+1;
		}
		
		req.setAttribute("pageCount", pageCount);
		return "library/library_notice";
	}
	
	//도서관 공지(제목,내용)검색 찾기
	@RequestMapping("/library_findNotice.do")
	public String library_board_find(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		
		String search = req.getParameter("search");
		String searchString = req.getParameter("searchString");
		String type = "infoLib";
		List<InfoBoardDTO> find = null;
		if(search !=null || searchString !=null) {
			Map<String, String> map = new Hashtable<String, String>();
			map.put("search", search);
			map.put("searchString", "%"+searchString+"%");
			map.put("type", type);
			find = infoBoardMapper.infoBoard_findList(search, searchString, type);
		}
		req.setAttribute("noticelist", find);
		
		return "library/library_notice";
	}
	
	//도서관 공지내용보기
	@RequestMapping("/library_noticeView.do")
	public String library_board_view(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		
		String info_code = req.getParameter("info_code");
		String type="infoLib";
		infoBoardMapper.plusReadCount(Integer.parseInt(info_code));
		InfoBoardDTO lbdto = infoBoardMapper.infoBoard_getByNum(Integer.parseInt(info_code));
		req.setAttribute("lbdto", lbdto);
		Map<String, Object> params = new HashMap<>();
		params.put("board", type);
		params.put("code", info_code);
		List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
		req.setAttribute("filelist", list);
		req.setAttribute("type", type);
		return "library/library_noticeView";
	}
	
	//공지 첨부파일 다운로드 처리
		@RequestMapping("/library_infoBoard_download.do")
		public String library_board_download(HttpServletRequest req, 
				HttpServletResponse resp, @RequestParam int info_code) {
			boolean ch = id_check(req);
			if(!ch) return "/loginPortal/login_main";
			
			int code = info_code;
			String board = "infoLib";
			String path = req.getSession().getServletContext().getRealPath("resources/infoBoard_file");
			String name = req.getParameter("name");
			
			Map<String, Object> params = new HashMap<>();
			params.put("board", board);
			params.put("code", code);
			List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
			HttpSession session = req.getSession();
			
			try {
				String original_name = null;
				String save_name = null;
		
				for(FileDepositoryDTO fdto : list) {
					if(fdto.getSave_name().equals(name)){
						original_name = fdto.getOriginal_name();
						save_name = fdto.getSave_name();
					}
				}
				original_name = new String(original_name.getBytes("UTF-8"), "iso-8859-1");
				File file = new File(path, save_name);
				
				FileInputStream fis = new FileInputStream(file);
	            ServletOutputStream sos = resp.getOutputStream();
	            
	            resp.setContentType("application/octet-stream");
	            resp.setContentLength((int) file.length());
	            resp.setHeader("Content-Disposition", "attachment;filename=\""+ original_name +"\"");
			
	            byte[] buffer = new byte[4096];
	            int bytesRead;
	            while ((bytesRead = fis.read(buffer)) != -1) {
	                sos.write(buffer, 0, bytesRead);
	            }
	            fis.close();
	            sos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			req.setAttribute("filelist", list);
			req.setAttribute("dto", infoBoardMapper.infoBoard_getByNum(code));
			req.setAttribute("type", board);
			return "library/library_noticeView";
		}
}
