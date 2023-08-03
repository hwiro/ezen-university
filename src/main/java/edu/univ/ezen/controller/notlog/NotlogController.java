package edu.univ.ezen.controller.notlog;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
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
import edu.univ.ezen.dto.QnaBoardDTO;
import edu.univ.ezen.service.AccMapper;
import edu.univ.ezen.service.FileDepositoryMapper;
import edu.univ.ezen.service.InfoBoardMapper;
import edu.univ.ezen.service.QnaBoardMapper;


@Controller
public class NotlogController {
	
	@Autowired
	private AccMapper accMapper;
	
	@Autowired
	private InfoBoardMapper infoBoardMapper;
	
	@Autowired
	private QnaBoardMapper qnaBoardMapper;
	
	@Autowired
	private FileDepositoryMapper fileDepositoryMapper;
	
	//비로그인 메인화면
	@RequestMapping("/notlog_main.do")
	public String notlog_main() {
		return "/notlog/notlog_main";
	}
	
	//관리자페이지
	@RequestMapping("/admin_login.do.do")
	public String admin_login() {
		return "/admin/admin_login";
	}
	
	//비로그인 비전
	@RequestMapping("/notlog_vision.do")
	public String notlog_vision() {
		return "/notlog/notlog_vision";
	}
	
	//비로그인 통학버스-서울
	@RequestMapping("/notlog_campusBus_seoul.do")
	public String notlog_campusBus_seoul() {
		return "/notlog/notlog_campusBus_seoul";
	}
	
	//비로그인 통학버스-경기
	@RequestMapping("/notlog_campusBus_gyeonggi.do")
	public String notlog_campusBus_gyeonggi() {
		return "/notlog/notlog_campusBus_gyeonggi";
	}		

	//비로그인 통학버스-덕정
	@RequestMapping("/notlog_campusBus_deokjeong.do")
	public String notlog_campusBus_deokjeong() {
		return "/notlog/notlog_campusBus_deokjeong";
	}
	
	//비로그인 통학버스-남양주
	@RequestMapping("/notlog_campusBus_Namyangju.do")
	public String notlog_campusBus_Namyangju() {
		return "/notlog/notlog_campusBus_Namyangju";
	}	
			
	//비로그인 학사일정
	@RequestMapping("/notlog_schoolCalender.do")
	public String notlog_schoolCalender() {
		return "/notlog/notlog_schoolCalender";
	}
	
	//비로그인 공지게시판
	@RequestMapping("/notlog_infoBoardList.do")
	public String notlog_infoBoardList() {
		return "/notlog/notlog_infoBoardList";
	}
	
	//비로그인 FAQ게시판 목록 보기
   @RequestMapping("/notlog_qnaBoard_list.do")
   public String notlog_qnaBoard_list(HttpServletRequest req) {
      
      String mode = req.getParameter("mode");
      String pageS = req.getParameter("page");
      String search = req.getParameter("search");
      String searchString = req.getParameter("searchString");
      int page = 1;
      
      if(pageS != null) page = Integer.parseInt(pageS);
      List<QnaBoardDTO> list = qnaBoardMapper.qnaBoard_list(page);
      
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
      
      
      return "/notlog/notlog_qnaBoard_list";
   }

	
	//비로그인 재학생 메뉴
	@RequestMapping("/studentList.do")
	public String studentList() {
		return "/notlog/studentList";
	}
	
	//비로그인 교직원 메뉴
	@RequestMapping("/staffList.do")
	public String staffList() {
		return "/notlog/staffList";
	}
	
	//비로그인 예비이젠인 메뉴
	@RequestMapping("/preEzenList.do")
	public String preEzenList() {
		return "/notlog/preEzenList";
	}
	
	//비로그인 로그인 포털 이동
	@RequestMapping("/login_main.do")
	public String login_main(HttpServletRequest req) {
		
		String mode = req.getParameter("mode");
		
		if(mode != null && mode.equals("logout")) {
			HttpSession session = req.getSession();
			session.invalidate();
		}
		
		List<InfoBoardDTO> infoEvent = infoBoardMapper.infoBoard_list("infoEvent", 1);
		List<InfoBoardDTO> infoLecture = infoBoardMapper.infoBoard_list("infoLecture", 1);
		List<InfoBoardDTO> infoScholar = infoBoardMapper.infoBoard_list("infoScholar", 1);
		
		req.setAttribute("infoEvent", infoEvent);
		req.setAttribute("infoLecture", infoLecture);
		req.setAttribute("infoScholar", infoScholar);
		
		return "/loginPortal/login_main";
	}
		
	//로그인 처리 폼
	@RequestMapping("/login_main_pro.do")
	public String login_main_pro(HttpServletRequest req) {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String type = req.getParameter("type");
		
		HttpSession session = req.getSession();
		
		if(type == null) {
			req.setAttribute("msg", "로그인 타입을 체크해주세요");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		
		if(type.equals("교직원") && accMapper.getStaff(id) != null) {
			if(!accMapper.getStaff(id).getStaff_pw().equals(pw)) {
				req.setAttribute("msg", "패스워드가 틀립니다");
				req.setAttribute("url", "login_main.do");
				return "message";
			}
		}
		else if(type.equals("교수") && accMapper.getTeacher(id) != null) {
			if(!accMapper.getTeacher(id).getTeacher_pw().equals(pw)) {
				req.setAttribute("msg", "패스워드가 틀립니다");
				req.setAttribute("url", "login_main.do");
				return "message";
			}
		}
		else if(type.equals("학생") && accMapper.getStudent(id) != null) {
			if(!accMapper.getStudent(id).getStudent_pw().equals(pw)) {
				req.setAttribute("msg", "패스워드가 틀립니다");
				req.setAttribute("url", "login_main.do");
				return "message";
			}
		}
		else {
			req.setAttribute("msg", "존재하지 않는 아이디입니다");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		session.setAttribute("id", id);
		session.setAttribute("type", type);
		
		List<InfoBoardDTO> infoEvent = infoBoardMapper.infoBoard_list("infoEvent", 1);
		List<InfoBoardDTO> infoLecture = infoBoardMapper.infoBoard_list("infoLecture", 1);
		List<InfoBoardDTO> infoScholar = infoBoardMapper.infoBoard_list("infoScholar", 1);
		
		req.setAttribute("infoEvent", infoEvent);
		req.setAttribute("infoLecture", infoLecture);
		req.setAttribute("infoScholar", infoScholar);
		
		return "/loginPortal/login_main";
	}
	
	//비로그인 캠퍼스 가이드
	@RequestMapping("/notlog_campusGuide.do")
	public String notlog_campusGuide() {
		return "/notlog/notlog_campusGuide";
	}
	
	//비로그인 장학정보
	@RequestMapping("/notlog_schoolScholarship.do")
	public String notlog_schoolScholarship() {
		return "/notlog/notlog_schoolScholarship";
	}
	
	//비로그인 졸업
	@RequestMapping("/notlog_graduationRequirement.do")
	public String notlog_graduationRequirement() {
		return "/notlog/notlog_graduationRequirement";
	}
	
	//비로그인 전공
	@RequestMapping("/notlog_majorRelated.do")
	public String notlog_majorRelated() {
		return "/notlog/notlog_majorRelated";
	}
	
	//휴학
	@RequestMapping("/notlog_hyuhak.do")
	public String notlog_hyuhak() {
		return "/notlog/notlog_hyuhak";
	}
	
	//복학
	@RequestMapping("/notlog_returnSchool.do")
	public String notlog_returnSchool() {
		return "/notlog/notlog_returnSchool";
	}
	
	//비로그인 공모행사 공지
	@RequestMapping("/notlog_eventBoardList.do")
	public String notlog_eventBoardList(HttpServletRequest req) {
		
		String page = req.getParameter("page");
		
		if(page == null) page = "1";
		
		List<InfoBoardDTO> list = infoBoardMapper.infoBoard_list("infoEvent", Integer.parseInt(page));
		
		int pageCount = infoBoardMapper.countBoard("infoEvent");
		req.setAttribute("totalPosts3", pageCount);
		if(pageCount < 11) pageCount = 1;
		else {
			if(pageCount%10 == 0) pageCount = (pageCount/10);
			else pageCount = (pageCount/10)+1;
		}
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("event_listBoard", list);
		return "/notlog/notlog_eventBoardList";
	}
	
	//공모`행사공지 상세보기
	@RequestMapping("/notlog_eventBoardList_Content.do")
	public String notlog_eventBoardList_Content(HttpServletRequest req) {
		String code = req.getParameter("info_code");
		String board = "infoEvent";
		
		int dto = infoBoardMapper.plusReadCount(Integer.parseInt(code));
		Map<String, Object> params = new HashMap<>();
		params.put("code", code);
		params.put("board", board);
		List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
		InfoBoardDTO ldto = infoBoardMapper.infoBoard_getByNum(Integer.parseInt(code));
		req.setAttribute("dto", ldto);
		if(list == null || list.size() == 0) {
			req.setAttribute("file", null);
		}
		else {
			req.setAttribute("file", list.get(0));
		}
		
		return "/notlog/notlog_eventBoardList_Content";
	}
	
	//비로그인 장학게시판
	@RequestMapping("/notlog_scholarBoard.do")
	public String notlog_scholarBoard(HttpServletRequest req) {
		
		
		String page = req.getParameter("page");
		
		if(page == null) page = "1";
		
		List<InfoBoardDTO> list = infoBoardMapper.infoBoard_list("infoScholar", Integer.parseInt(page));
		
		int pageCount = infoBoardMapper.countBoard("infoScholar");
		req.setAttribute("totalPosts", pageCount);
		if(pageCount < 11) pageCount = 1;
		else {
			if(pageCount%10 == 0) pageCount = (pageCount/10);
			else pageCount = (pageCount/10)+1;
		}
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("notlog_listBoard", list);
			
		return "/notlog/notlog_scholarBoard";
	}
	
	//장학공지 상세보기
	@RequestMapping("/notlog_scholarBoard_Content.do")	
	public String notlog_scholarBoard_Content(HttpServletRequest req) {
		String code = req.getParameter("info_code");
		String board = "infoScholar";

		int dto = infoBoardMapper.plusReadCount(Integer.parseInt(code));
		Map<String, Object> params = new HashMap<>();
			params.put("code", code);
			params.put("board", board);
		List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
		InfoBoardDTO ldto = infoBoardMapper.infoBoard_getByNum(Integer.parseInt(code));
		req.setAttribute("dto", ldto);
		if(list == null || list.size() == 0) {
			req.setAttribute("file", null);
		}
		else {
			req.setAttribute("file", list.get(0));
		}

		return "/notlog/notlog_scholarBoard_Content";
	}
	
	
	//비로그인 특강공지
	@RequestMapping("/notlog_specialLectureBoardList.do")
	public String notlog_specialLectureBoardList(HttpServletRequest req) {
		
		String page = req.getParameter("page");
		
		if(page == null) page = "1";
		
		List<InfoBoardDTO> list = infoBoardMapper.infoBoard_list("infoLecture", Integer.parseInt(page));
		
		int pageCount = infoBoardMapper.countBoard("infoLecture");
		req.setAttribute("totalPosts4", pageCount);
		
		if(pageCount < 11) pageCount = 1;
		else {
			if(pageCount%10 == 0) pageCount = (pageCount/10);
			else pageCount = (pageCount/10)+1;
		}
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("specialLecture_listBoard", list);	

		return "/notlog/notlog_specialLectureBoardList";
	}
	
	
	//특강공지 상세보기
	@RequestMapping("/notlog_specialLectureBoardList_Content.do")
	public String notlog_specialLectureBoardList_Content(HttpServletRequest req) {
		String code = req.getParameter("info_code");
		String board = "infoLecture";

		int dto = infoBoardMapper.plusReadCount(Integer.parseInt(code));
		Map<String, Object> params = new HashMap<>();
			params.put("code", code);
			params.put("board", board);
		List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
		InfoBoardDTO ldto = infoBoardMapper.infoBoard_getByNum(Integer.parseInt(code));
		req.setAttribute("dto", ldto);
		if(list == null || list.size() == 0) {
			req.setAttribute("file", null);
		}
		else {
			req.setAttribute("file", list.get(0));
		}

		return "/notlog/notlog_specialLectureBoardList_Content";
	}
	
	//비로그인 도서관공지
	@RequestMapping("/notlog_libraryBoardList.do")
	public String notlog_libraryBoardList(HttpServletRequest req) {
		
		String page = req.getParameter("page");
		List<InfoBoardDTO> list = infoBoardMapper.infoBoard_list("infoLib", Integer.parseInt(page));
		
		int pageCount = infoBoardMapper.countBoard("infoLib");
		req.setAttribute("totalPosts1", pageCount);
		
		if(pageCount < 11) pageCount = 1;
	      else {
	         if(pageCount%10 == 0) pageCount = (pageCount/10);
	         else pageCount = (pageCount/10)+1;
	      }
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("notlog_librarylistBoard", list);
		
		return "/notlog/notlog_libraryBoardList";
	}
	
	//도서공지 상세보기
	@RequestMapping("/notlog_libraryBoardList_Content.do")
	
	public String notlog_libraryBoardList_Content(HttpServletRequest req) {
		String code = req.getParameter("info_code");
		String board = "infoLib";

		int dto = infoBoardMapper.plusReadCount(Integer.parseInt(code));
		Map<String, Object> params = new HashMap<>();
			params.put("code", code);
			params.put("board", board);
		List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
		InfoBoardDTO ldto = infoBoardMapper.infoBoard_getByNum(Integer.parseInt(code));
		req.setAttribute("dto", ldto);
		if(list == null || list.size() == 0) {
			req.setAttribute("file", null);
		}
		else {
			req.setAttribute("file", list.get(0));
		}
		
		return "/notlog/notlog_libraryBoardList_Content";
	}
	
	//공지 첨부파일 다운로드 처리
	@RequestMapping("/notlog_infoBoard_download.do")
	public String notlog_infoBoard_download(HttpServletRequest req, 
			HttpServletResponse resp, @RequestParam int info_code) {
		int code = info_code;
		String board = req.getParameter("type");
		String path = req.getSession().getServletContext().getRealPath("resources/infoBoard_file");
		String name = req.getParameter("name");
		
		Map<String, Object> params = new HashMap<>();
		params.put("board", board);
		params.put("code", code);
		List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
		
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
		req.setAttribute("info_code", code);
		req.setAttribute("file", list.get(0));
		req.setAttribute("dto", infoBoardMapper.infoBoard_getByNum(code));
		req.setAttribute("type", board);
		
		return "/notlog/notlog_infoBoard_view";
	}
	
	//비로그인 오프캠퍼스 장학
	@RequestMapping("/notlog_off_CampusScholarship.do")
	public String notlog_off_CampusScholarship() {
		return "/notlog/notlog_off_CampusScholarship";
	}
	
	//증명서 발급(국내)	
	@RequestMapping("/notlog_certificate_domestic.do")
	public String notlog_certificate_domestic() {
		return "/notlog/notlog_certificate_domestic";
	}
	//증명서 발급(인터넷)	
	@RequestMapping("/notlog_certificate_internet.do")
	public String notlog_certificate_internet() {
		return "/notlog/notlog_certificate_internet";
	}
	//증명서발급(방문)
	@RequestMapping("/notlog_certificate_visit.do")
	public String notlog_certificate_visit() {
		return "/notlog/notlog_certificate_visit";
	}
	//증명서 발급(팩스)
	@RequestMapping("/notlog_certificate_fax.do")
	public String notlog_certificate_fax() {
		return "/notlog/notlog_certificate_fax";
	}
	//학생동아리
	@RequestMapping("/notlog_studentClub.do")
	public String notlog_studentClub() {
		return "/notlog/notlog_studentClub";
	}
	//수강신청 안내	
	@RequestMapping("/notlog_courseRegistration.do")
	public String notlog_courseRegistration() {
		return "/notlog/notlog_courseRegistration";
	}
	//수시안내
	@RequestMapping("/notlog_earlyDecision.do")
	public String notlog_earlyDecision() {
		return "/notlog/notlog_earlyDecision";
	}
	
	//정시안내
	@RequestMapping("/notlog_regularDecision.do")
	public String notlog_regularDecision() {
		return "/notlog/notlog_regularDecision";
	}
	
	//수업시간표 안내
	@RequestMapping("/notlog_courseTimetable.do")
	public String notlog_courseTimetable() {
		return "/notlog/notlog_courseTimetable";
	}

}