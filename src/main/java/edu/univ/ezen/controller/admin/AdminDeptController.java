package edu.univ.ezen.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.univ.ezen.dto.DeptDTO;
import edu.univ.ezen.dto.EditLogDTO;
import edu.univ.ezen.service.DeptMapper;
import edu.univ.ezen.service.LogMapper;

@Controller
public class AdminDeptController {
	
	@Autowired
	private DeptMapper deptMapper;
	
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
	
	//학과 목록
	@RequestMapping("/admin_dept_list.do")
	public String admin_dept_list(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		HttpSession session = req.getSession();
		String authority = (String)session.getAttribute("authority_level");
		
		if(authority.equals("학과관리자") || authority.equals("마스터관리자")) {
			List<DeptDTO> deptlist = deptMapper.listDept();
			
			int pageCount = deptlist.size();
			
			if(pageCount < 11) pageCount = 1;
			else {
				if(pageCount%10 == 0) pageCount = (pageCount/10);
				else pageCount = (pageCount/10)+1;
			}
			
			req.setAttribute("deptlist", deptlist);
			req.setAttribute("pageCount", pageCount);
			
			return "admin/admin_dept/admin_dept_list";
		}
		
		req.setAttribute("msg", "권한이 없습니다");
		req.setAttribute("url", "admin_index.do");
		return "message";
	}
	
	//새 학과 개설
	@RequestMapping("/admin_dept_insert.do")
	public String admin_dept_insert(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		return "admin/admin_dept/admin_dept_insert";
	}
	
	//새 학과 개설 처리
	@RequestMapping("/admin_dept_insert_pro.do")
	public String admin_dept_insert_pro(HttpServletRequest req, @ModelAttribute DeptDTO dto) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		HttpSession session = req.getSession();
		
		DeptDTO ddto = dto;
		
		if(ddto.getIssingle() == null) ddto.setIssingle("해당없음");
		
		int res = deptMapper.insertDept(ddto);
		
		if(res != 0) {
			req.setAttribute("msg", "학과가 개설되었습니다");
			req.setAttribute("url", "admin_dept_list.do");
			
			//수정 로그 추가
			EditLogDTO edto = new EditLogDTO();
			edto.setId((String)session.getAttribute("id"));
			edto.setContent("학과개설:"+ddto.getDept_name());
			edto.setMemo(req.getParameter("memo"));
			int elog = logMapper.insertEdit(edto);
		}
		else {
			req.setAttribute("msg", "학과 개설에 실패했습니다");
			req.setAttribute("url", "admin_dept_list.do");
		}
		
		return "message";
	}
	
	//학과 삭제
	@RequestMapping("/admin_dept_del.do")
	public String admin_dept_del(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		HttpSession session = req.getSession();
		
		String dept_id = req.getParameter("dept_id");
		
		DeptDTO ddto = deptMapper.getDept(dept_id);
		int res = deptMapper.deleteDept(dept_id);
		
		if(res != 0) {
			req.setAttribute("msg", "학과가 삭제되었습니다");
			req.setAttribute("url", "admin_dept_list.do");
			
			//수정 로그 추가
			EditLogDTO edto = new EditLogDTO();
			edto.setId((String)session.getAttribute("id"));
			edto.setContent("학과삭제:"+ddto.getDept_name());
			edto.setMemo("학과삭제");
			int elog = logMapper.insertEdit(edto);
		}
		else {
			req.setAttribute("msg", "학과 삭제에 실패했습니다");
			req.setAttribute("url", "admin_dept_list.do");
		}
		
		return "message";
	}
}
