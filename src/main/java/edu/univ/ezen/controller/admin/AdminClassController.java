package edu.univ.ezen.controller.admin;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.univ.ezen.dto.AccountTeacherDTO;
import edu.univ.ezen.dto.ClassDTO;
import edu.univ.ezen.dto.DeptDTO;
import edu.univ.ezen.dto.EditLogDTO;
import edu.univ.ezen.service.AccMapper;
import edu.univ.ezen.service.ClassMapper;
import edu.univ.ezen.service.DeptMapper;
import edu.univ.ezen.service.LogMapper;
import edu.univ.ezen.service.MyClassMapper;

@Controller
public class AdminClassController {
	
	@Autowired
	private ClassMapper classMapper;
	
	@Autowired
	private DeptMapper deptMapper;
	
	@Autowired
	private AccMapper accMapper;
	
	@Autowired
	private LogMapper logMapper;

   @Autowired
   private MyClassMapper myClassMapper;
	
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
	
	//강의 목록
	@RequestMapping("/admin_class_list.do")
	public String admin_class_list(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		HttpSession session = req.getSession();
		String authority = (String)session.getAttribute("authority_level");
		String pageS = req.getParameter("page");
		
		if(authority.equals("학과관리자") || authority.equals("마스터관리자")) {
			String mode = req.getParameter("dept_id");
			List<ClassDTO> classlist = null;
			List<DeptDTO> deptlist = deptMapper.listDeptName();
			int page = 1;
			
			if(pageS != null) page = Integer.parseInt(pageS);
			
			if(mode == null || mode.equals("all")) classlist = classMapper.listClass(page);
			else classlist = classMapper.listClassDept(mode, page);
			
			int pageCount = classMapper.countClass();
			
			if(pageCount < 21) pageCount = 1;
			else {
				if(pageCount%20 == 0) pageCount = (pageCount/20);
				else pageCount = (pageCount/20)+1;
			}
			
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("classlist", classlist);
			req.setAttribute("deptlist", deptlist);
			
			return "admin/admin_class/admin_class_list";
		}
		
		req.setAttribute("msg", "권한이 없습니다");
		req.setAttribute("url", "admin_index.do");
		return "message";
	}
	
	//새 강의 개설
	@RequestMapping("/admin_class_insert.do")
	public String admin_class_insert(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		Calendar cal = Calendar.getInstance();
		String semester = cal.get(Calendar.YEAR)+"년";
		int month = (cal.get(Calendar.MONTH)+1);
		if(month >= 3 && month <= 6) semester += "1학기";
		else if(month >= 9 && month <= 12) semester += "2학기";
		else semester += "계절학기";	
		List<DeptDTO> deptlist = deptMapper.listDeptName();
		List<AccountTeacherDTO> teachlist = accMapper.listTeacherAll();
		
		req.setAttribute("deptlist", deptlist);
		req.setAttribute("teachList", teachlist);
		req.setAttribute("semester", semester);
		return "admin/admin_class/admin_class_insert";
	}
	
	//새 강의 개설 처리
	@RequestMapping("/admin_class_insert_pro.do")
	public String admin_class_insert_pro(HttpServletRequest req, @ModelAttribute ClassDTO dto) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		HttpSession session = req.getSession();
		
		ClassDTO cdto = dto;
		DeptDTO ddto = deptMapper.getDept(req.getParameter("dept_id"));
		AccountTeacherDTO tdto = accMapper.getTeacher(req.getParameter("teacher_id"));
		cdto.setDept_name(ddto.getDept_name());
		cdto.setClass_code(ddto.getDept_id() +"-");
		cdto.setTeacher_name(tdto.getName());
		
		if(req.getParameter("course") == null) {
			cdto.setCourse("none");
		}
		else {
			cdto.setCourse("yes");
		}
		
		int res = classMapper.insertClass(cdto);
		
		if(res != 0) {
			req.setAttribute("msg", "강의가 개설되었습니다");
			req.setAttribute("url", "admin_class_list.do");
			
			//수정 로그 추가
			EditLogDTO edto = new EditLogDTO();
			edto.setId((String)session.getAttribute("id"));
			edto.setContent("강의개설:"+cdto.getClass_name());
			edto.setMemo(req.getParameter("memo"));
			int elog = logMapper.insertEdit(edto);
		}
		else {
			req.setAttribute("msg", "강의 개설에 실패했습니다");
			req.setAttribute("url", "admin_class_list.do");
		}
		
		return "message";
	}
	
	   //강의 삭제
	   @RequestMapping("/admin_class_del.do")
	   public String admin_class_del(HttpServletRequest req) {
	      boolean ch = id_check(req);
	      if(!ch) return "admin/admin_login";
	      HttpSession session = req.getSession();
	      
	      String class_code = req.getParameter("class_code");
	      String semester = req.getParameter("semester");
	      ClassDTO cdto = classMapper.getClass(class_code);
	      int res = classMapper.deleteClass(class_code);
	      if(res != 0) {
	         myClassMapper.deleteAllClass(class_code, semester);
	         req.setAttribute("msg", "강의가 삭제되었습니다");
	         req.setAttribute("url", "admin_class_list.do");
	         
	         //수정 로그 추가
	         EditLogDTO edto = new EditLogDTO();
	         edto.setId((String)session.getAttribute("id"));
	         edto.setContent("강의삭제:"+cdto.getClass_name());
	         edto.setMemo("강의삭제/폐강");
	         int elog = logMapper.insertEdit(edto);
	      }
	      else {
	         req.setAttribute("msg", "강의 삭제에 실패했습니다");
	         req.setAttribute("url", "admin_class_list.do");
	      }
	      
	      return "message";
	   }
	
}
