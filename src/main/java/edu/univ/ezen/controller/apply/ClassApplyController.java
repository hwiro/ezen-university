package edu.univ.ezen.controller.apply;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.univ.ezen.dto.ClassDTO;
import edu.univ.ezen.dto.DeptDTO;
import edu.univ.ezen.dto.MyClassDTO;
import edu.univ.ezen.service.AccMapper;
import edu.univ.ezen.service.ClassMapper;
import edu.univ.ezen.service.DeptMapper;
import edu.univ.ezen.service.MyClassMapper;

@Controller
public class ClassApplyController {
	
	@Autowired
	AccMapper accMapper;
	
	@Autowired
	ClassMapper classMapper;
	
	@Autowired
	DeptMapper deptMapper;
	
	@Autowired
	MyClassMapper myClassMapper;
	
	//세션에 id라는 값이 있는지 체크하는 메소드. 있으면 true, 없으면 false를 리턴한다.
	protected boolean id_check(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String type = (String)session.getAttribute("type");
		if(session.getAttribute("id") == null) {
			return false;
		}
		else {
			if(type != null && !type.equals("학생")) {
				return false;
			}
			return true;
		}
	}
	
	//수강신청 페이지 메인
	@RequestMapping("/class_apply_main.do")
	public String class_apply_main(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) {
			req.setAttribute("msg", "학생 로그인 후 이용가능합니다");
			return "closeWindow";
		}
		
		req.setAttribute("imgPath", "resources/img");
		
		return "class_apply/class_apply_main";
	}
	
	//수강신청 메뉴 리스트
	@RequestMapping("/class_apply_list.do")
	public String class_apply_list(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) {
			req.setAttribute("msg", "학생 로그인 후 이용가능합니다");
			return "closeWindow";
		}
		Calendar cal = Calendar.getInstance();
		String semester = cal.get(Calendar.YEAR)+"년";
		int month = (cal.get(Calendar.MONTH)+1);
		
		if(month >= 3 && month <= 6) semester += "1학기";
		else if(month >= 9 && month <= 12) semester += "2학기";
		else semester += "계절학기";	
		String pageS = req.getParameter("page");
		String dist = req.getParameter("distribute");
		
		if(pageS == null) pageS = "1";
		if(dist == null) dist = "all";
		
		int page = Integer.parseInt(pageS);
		int pageCount = 1;
		List<ClassDTO> clist = new ArrayList<ClassDTO>();
		
		if(!dist.equals("all")) {
			clist = classMapper.listClassDept_getSem(dist, page, semester);
			pageCount = classMapper.countClassDist(dist);
		}
		else {
			clist = classMapper.listClass_getSem(page, semester);
			pageCount = classMapper.countClass();
		}
		
		for(ClassDTO cdto : clist) {
			if(cdto.getCourse().equals("yes")) {
				cdto.setCourse("교양");
			}
			else {
				cdto.setCourse("전공");
			}
		}
		
		if(pageCount < 21) pageCount = 1;
		else {
			if(pageCount%20 == 0) pageCount = (pageCount/20);
			else pageCount = (pageCount/20)+1;
		}
		
		List<DeptDTO> dlist = deptMapper.listDept();
		
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("list", clist);
		req.setAttribute("dlist", dlist);
		req.setAttribute("imgPath", "resources/img");
		
		return "class_apply/class_apply_list";
	}
	
	//학과코드로 검색
	@RequestMapping("/class_apply_search_id.do") 
	public String class_apply_search_id(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) {
			req.setAttribute("msg", "학생 로그인 후 이용가능합니다");
			return "closeWindow";
		}
		
		Calendar cal = Calendar.getInstance();
		String semester = cal.get(Calendar.YEAR)+"년";
		int month = (cal.get(Calendar.MONTH)+1);
		
		if(month >= 3 && month <= 6) semester += "1학기";
		else if(month >= 9 && month <= 12) semester += "2학기";
		else semester += "계절학기";	
		
		List<ClassDTO> clist = classMapper.listClassDept_getSem(req.getParameter("searchString"), 1, semester);
		req.setAttribute("list", clist);
		req.setAttribute("pageCount", 1);
		req.setAttribute("imgPath", "resources/img");
		return "class_apply/class_apply_list";
	}
	
	//강의 상세보기에서 수강신청
	@RequestMapping("/class_apply_pro.do")
	public String class_apply_pro(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) {
			req.setAttribute("msg", "학생 로그인 후 이용가능합니다");
			return "closeWindow";
		}
		
		HttpSession session = req.getSession();
		String class_code = req.getParameter("num");
		Calendar cal = Calendar.getInstance();
		int res = 0;
		String id = (String)session.getAttribute("id");
		String semester = cal.get(Calendar.YEAR)+"년";
		int month = (cal.get(Calendar.MONTH)+1);
		String course = "전공";
		
		if(month >= 3 && month <= 6) semester += "1학기";
		else if(month >= 9 && month <= 12) semester += "2학기";
		else semester += "계절학기";	
		
		
		if(!myClassMapper.checkMyClass(id, class_code)) {
			req.setAttribute("msg", "이미 신청한 강의입니다");
			req.setAttribute("url", "class_apply_list.do");
			return "message";
		}
		
		ClassDTO cdto = classMapper.getClass(class_code);
		
		if(cdto.getCourse().equals("yes")) course = "교양";
		else course = "전공";
		
		MyClassDTO mcdto = new MyClassDTO(0, id, class_code, cdto.getTeacher_name(), 
				cdto.getClass_name(), cdto.getClass_credit(), 0, 
				semester, course, cdto.getOnday(), cdto.getOntime());	
		
		
		res = myClassMapper.insertMyClass(mcdto);
		
		
		req.setAttribute("msg", "신청이 완료되었습니다");
		req.setAttribute("url", "class_apply_list.do");
		return "message";
	}
	
	//여러 강의 수강신청 처리
	@RequestMapping("/class_apply_all_pro.do")
	public String class_apply_all_pro(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) {
			req.setAttribute("msg", "학생 로그인 후 이용가능합니다");
			return "closeWindow";
		}
		
		HttpSession session = req.getSession();
		String[] applyCheckS = req.getParameterValues("applyCheck");
		Calendar cal = Calendar.getInstance();
		int res = 0;
		String id = (String)session.getAttribute("id");
		String semester = cal.get(Calendar.YEAR)+"년";
		int month = (cal.get(Calendar.MONTH)+1);
		String course = "전공";
		
		if(month >= 3 && month <= 6) semester += "1학기";
		else if(month >= 9 && month <= 12) semester += "2학기";
		else semester += "계절학기";	
		
		if(applyCheckS != null) {
			for(String class_code : applyCheckS) {
				if(!myClassMapper.checkMyClass(id, class_code)) {
					req.setAttribute("msg", "이미 신청한 강의입니다");
					req.setAttribute("url", "class_apply_list.do");
					return "message";
				}
			}
			
			for(String class_code : applyCheckS) {
				ClassDTO cdto = classMapper.getClass(class_code);
				
				if(cdto.getCourse().equals("yes")) course = "교양";
				else course = "전공";
				
				MyClassDTO mcdto = new MyClassDTO(0, id, class_code, cdto.getTeacher_name(), 
						cdto.getClass_name(), cdto.getClass_credit(), 0, 
						semester, course, cdto.getOnday(), cdto.getOntime());
				if(!myClassMapper.checkMyClass(id, class_code)) {
					break;
				}
				res = myClassMapper.insertMyClass(mcdto);
			}
		}
		else {
			req.setAttribute("msg", "선택한 강의가 없습니다");
			req.setAttribute("url", "class_apply_list.do");
			return "message";
		}
		
		req.setAttribute("msg", "신청이 완료되었습니다");
		req.setAttribute("url", "class_apply_list.do");
		return "message";
	}
	
	//내 수강신청 리스트
	@RequestMapping("/class_apply_mylist.do")
	public String class_apply_mylist(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) {
			req.setAttribute("msg", "학생 로그인 후 이용가능합니다");
			return "closeWindow";
		}
		
		String pageS = req.getParameter("page");
		HttpSession session = req.getSession();
		
		if(pageS == null) pageS = "1";
		
		int page = Integer.parseInt(pageS);
		Calendar cal = Calendar.getInstance();
		String semester = cal.get(Calendar.YEAR)+"년";
		int month = (cal.get(Calendar.MONTH)+1);
		
		if(month >= 3 && month <= 6) semester += "1학기";
		else if(month >= 9 && month <= 12) semester += "2학기";
		else semester += "계절학기";	
		
		List<MyClassDTO> clist = myClassMapper.listMyClassAll((String)session.getAttribute("id"), semester);
		
		req.setAttribute("list", clist);
		req.setAttribute("imgPath", "resources/img");
		
		return "class_apply/class_apply_mylist";
	}
	
	//신청한 강의 취소
	@RequestMapping("/class_apply_cancel.do")
	public String class_apply_cancel(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) {
			req.setAttribute("msg", "학생 로그인 후 이용가능합니다");
			return "closeWindow";
		}
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		String class_code = req.getParameter("class_code");
		
		int res = myClassMapper.deleteMyClass(id, class_code);
		
		req.setAttribute("msg", "취소신청이 완료되었습니다");
		req.setAttribute("url", "class_apply_mylist.do");
		return "message";
	}
	
	//내 수강신청 스케줄
	@RequestMapping("/class_apply_schedule.do")
	public String class_apply_schedule(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) {
			req.setAttribute("msg", "학생 로그인 후 이용가능합니다");
			return "closeWindow";
		}
		
		HttpSession session = req.getSession();
		Calendar cal = Calendar.getInstance();
		String semester = cal.get(Calendar.YEAR)+"년";
		int month = (cal.get(Calendar.MONTH)+1);
		
		if(month >= 3 && month <= 6) semester += "1학기";
		else if(month >= 9 && month <= 12) semester += "2학기";
		else semester += "계절학기";
		
		List<MyClassDTO> clist = myClassMapper.listMyClassAll((String)session.getAttribute("id"), semester);
		List<String> onday = new ArrayList<String>();
		onday.add("일");
		onday.add("월");
		onday.add("화");
		onday.add("수");
		onday.add("목");
		onday.add("금");
		onday.add("토");
		req.setAttribute("list", clist);
		req.setAttribute("onday", onday);
		req.setAttribute("imgPath", "resources/img");
		
		return "class_apply/class_apply_schedule";
	}
	
	//강의 자세히 보기 메소드
	@RequestMapping("/class_apply_detail.do")
	public String class_apply_detail(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) {
			req.setAttribute("msg", "학생 로그인 후 이용가능합니다");
			return "closeWindow";
		}
		
		String class_code = req.getParameter("class_no");
		
		ClassDTO cdto = classMapper.getClass(class_code);
		
		req.setAttribute("dto", cdto);
		req.setAttribute("imgPath", "resources/img");
		
		return "class_apply/class_apply_detail";
	}
}
