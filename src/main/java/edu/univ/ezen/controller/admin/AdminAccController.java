package edu.univ.ezen.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.univ.ezen.dto.AccountAdminDTO;
import edu.univ.ezen.dto.AccountStaffDTO;
import edu.univ.ezen.dto.AccountStudentDTO;
import edu.univ.ezen.dto.AccountTeacherDTO;
import edu.univ.ezen.dto.DeptDTO;
import edu.univ.ezen.dto.EditLogDTO;
import edu.univ.ezen.service.AccAdminMapper;
import edu.univ.ezen.service.AccMapper;
import edu.univ.ezen.service.DeptMapper;
import edu.univ.ezen.service.LogMapper;

@Controller
public class AdminAccController {

	@Autowired
	private AccAdminMapper accAdminMapper;
	
	@Autowired
	private AccMapper accMapper;
	
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
	
	//관리자 계정 등록/수정 메소드
	protected void accAdmin(HttpServletRequest req, String mode) {
		String admin_id = req.getParameter("admin_id");
		String admin_pw = req.getParameter("admin_pw");
		String name = req.getParameter("name");
		String authority_level = req.getParameter("authority_level");
		AccountAdminDTO aadto = 
				new AccountAdminDTO(admin_id, admin_pw, name, authority_level);
		
		int res = 0;
		
		if(mode.equals("등록")) res = accAdminMapper.insertAdmin(aadto);
		else res = accAdminMapper.updateAdmin(aadto);
		
		if(res == 0) {
			req.setAttribute("msg", mode+"실패");
			req.setAttribute("url", "admin_acc_list.do?mode=admin&page=1");
		}
		else {
			req.setAttribute("msg", mode+"성공");
			req.setAttribute("url", "admin_acc_list.do?mode=admin&page=1");
		}
	}
	
	//교직원 계정 등록/수정 메소드
	protected void accStaff(HttpServletRequest req, String mode) {
		String admin_id = req.getParameter("staff_id");
		String admin_pw = req.getParameter("staff_pw");
		String name = req.getParameter("name");
		String authority_level = req.getParameter("authority_level");
		String indate = req.getParameter("indate");
		String type = req.getParameter("type");
		String birthdate = req.getParameter("birthdate");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");
		String email = req.getParameter("email");
		AccountStaffDTO asdto = new AccountStaffDTO(admin_id, admin_pw, name,
				authority_level, indate, type, birthdate, tel, address, email);
		
		int res = 0;
		
		if(mode.equals("등록")) res = accMapper.insertStaff(asdto);
		else res = accMapper.updateStaff(asdto);
		
		if(res == 0) {
			req.setAttribute("msg", mode+"실패");
			req.setAttribute("url", "admin_acc_list.do?mode=staff&page=1");
		}
		else {
			req.setAttribute("msg", mode+"성공");
			req.setAttribute("url", "admin_acc_list.do?mode=staff&page=1");
		}
	}
	
	//교수 계정 등록/수정 메소드
	protected void accTeacher(HttpServletRequest req, String mode) {
		String teacher_id = req.getParameter("teacher_id");
		String teacher_pw = req.getParameter("teacher_pw");
		String name = req.getParameter("name");
		String dept = req.getParameter("dept");
		String history = req.getParameter("history");
		String birthdate = req.getParameter("birthdate");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");
		String type = req.getParameter("type");
		String email = req.getParameter("email");
		AccountTeacherDTO atdto = new AccountTeacherDTO(teacher_id, teacher_pw, name, 
				dept, history, birthdate, tel, address, type, email);
		
		int res = 0;
		
		if(mode.equals("등록")) res = accMapper.insertTeacher(atdto);
		else res = accMapper.updateTeacher(atdto);
		
		if(res == 0) {
			req.setAttribute("msg", mode+"실패");
			req.setAttribute("url", "admin_acc_list.do?mode=teacher&page=1");
		}
		else {
			req.setAttribute("msg", mode+"성공");
			req.setAttribute("url", "admin_acc_list.do?mode=teacher&page=1");
		}
	}

	//학생 계정 등록/수정 메소드
	protected void accStudent(HttpServletRequest req, String mode) {
		String student_id = req.getParameter("student_id");
		String student_pw = req.getParameter("student_pw");
		String name = req.getParameter("name");
		String dept = req.getParameter("dept");
		int grade = Integer.parseInt(req.getParameter("grade"));
		int total_credit = 0;
		String birthdate = req.getParameter("birthdate");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");
		String indate = "";
		String status = req.getParameter("status");
		String type = req.getParameter("type");
		String college = req.getParameter("college");
		String email = req.getParameter("email");
		AccountStudentDTO asdto = new AccountStudentDTO(student_id, student_pw, name, 
				dept, grade, total_credit, birthdate, tel, address, status, indate, type, college, email);
		
		int res = 0;
		
		if(mode.equals("등록")) res = accMapper.insertStudent(asdto);
		else res = accMapper.updateStudent(asdto);
		
		if(res == 0) {
			req.setAttribute("msg", mode+"실패");
			req.setAttribute("url", "admin_acc_list.do?mode=student&page=1");
		}
		else {
			req.setAttribute("msg", mode+"성공");
			req.setAttribute("url", "admin_acc_list.do?mode=student&page=1");
		}
	}
	
	//계정 관리 선택
	@RequestMapping("/admin_acc_choose.do")
	public String admin_acc_choose(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		HttpSession session = req.getSession();
		String authority = (String)session.getAttribute("authority_level");
		
		if(authority.equals("계정관리자") || authority.equals("마스터관리자")) {
			return "admin/admin_acc/admin_acc_choose";
		}
		
		req.setAttribute("msg", "권한이 없습니다");
		req.setAttribute("url", "admin_index.do");
		return "message";
	}
	
	//선택된 계정으로 리스트 페이지 이동
	@RequestMapping("/admin_acc_list.do")
	public String admin_acc_list(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		int page = 1;
		
		if(req.getParameter("page") != null) page = Integer.parseInt(req.getParameter("page"));
		
		String mode = req.getParameter("mode");
		String link = null;
		int pageCount = 0;
		
		switch(mode) {
			case "admin": 
				List<AccountAdminDTO> listAdmin = accAdminMapper.listAdmin(page);
				pageCount = listAdmin.size();
				
				if(pageCount < 11) pageCount = 1;
				else {
					if(pageCount%10 == 0) pageCount = (pageCount/10);
					else pageCount = (pageCount/10)+1;
				}
				req.setAttribute("pageCount", pageCount);
				req.setAttribute("list", listAdmin);
				link = "admin/admin_acc/admin_acc_listadmin";
				break;
			case "staff": 
				List<AccountStaffDTO> listStaff = accMapper.listStaff(page);
				pageCount = listStaff.size();
				
				if(pageCount < 11) pageCount = 1;
				else {
					if(pageCount%10 == 0) pageCount = (pageCount/10);
					else pageCount = (pageCount/10)+1;
				}
				req.setAttribute("pageCount", pageCount);
				req.setAttribute("list", listStaff);
				link = "admin/admin_acc/admin_acc_liststaff";
				break;
			case "teacher": 
				List<AccountTeacherDTO> listTeacher = accMapper.listTeacher(page);
				
				pageCount = listTeacher.size();
				
				if(pageCount < 11) pageCount = 1;
				else {
					if(pageCount%10 == 0) pageCount = (pageCount/10);
					else pageCount = (pageCount/10)+1;
				}
				req.setAttribute("pageCount", pageCount);
				req.setAttribute("list", listTeacher);
				link = "admin/admin_acc/admin_acc_listteacher";
				break;
			case "student": 
				List<AccountStudentDTO> listStudent = accMapper.listStudent(page);
				pageCount = listStudent.size();
				
				if(pageCount < 11) pageCount = 1;
				else {
					if(pageCount%10 == 0) pageCount = (pageCount/10);
					else pageCount = (pageCount/10)+1;
				}
				req.setAttribute("pageCount", pageCount);
				req.setAttribute("list", listStudent);
				link = "admin/admin_acc/admin_acc_liststudent";
				break;
			default : link = "admin/admin_login";
		}
		
		return link;
	}
	
	//새 계정 등록 폼 매핑
	@RequestMapping("/admin_acc_insert.do")
	public String admin_acc_insert(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		String mode = req.getParameter("mode");
		String link = null;
		List<DeptDTO> listDept = deptMapper.listDeptName();
		
		switch(mode) {
			case "admin" : 
				link = "admin/admin_acc/admin_acc_insertadmin";
				break;
			case "staff" : 
				link = "admin/admin_acc/admin_acc_insertstaff";
				break;
			case "teacher" : 
				link = "admin/admin_acc/admin_acc_insertteacher";
				req.setAttribute("deptlist", listDept);
				break;
			case "student" : 
				link = "admin/admin_acc/admin_acc_insertstudent";
				req.setAttribute("deptlist", listDept);
				break;
			default : link = "admin/admin_login";
		}
		
		return link;
	}
	
	//새 계정 등록 처리 매핑
	@RequestMapping("/admin_acc_insertpro.do")
	public String admin_acc_insertpro(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		String mode = req.getParameter("mode");
		
		//수정 로그 추가
		EditLogDTO edto = new EditLogDTO();
		HttpSession session = req.getSession();
		edto.setId((String)session.getAttribute("id"));
		
		switch(mode) {
			case "admin" : 
				accAdmin(req, "등록");
				edto.setContent("관리자 계정생성:"+ req.getParameter("admin_id"));
				break;
			case "staff" : 
				accStaff(req, "등록");
				edto.setContent("교직원 계정생성:"+ req.getParameter("staff_id"));
				break;
			case "teacher" : 
				accTeacher(req, "등록");
				edto.setContent("교수 계정생성:"+ req.getParameter("teacher_id"));
				break;
			case "student" : 
				accStudent(req, "등록");
				edto.setContent("학생 계정생성:"+ req.getParameter("student_id"));
				break;
			default : return "admin/admin_login";
		}
		edto.setMemo(req.getParameter("memo"));
		int elog = logMapper.insertEdit(edto);
		
		return "message";
	}
	
	//아이디 수정 폼
	@RequestMapping("/admin_acc_edit.do")
	public String admin_acc_edit(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		String mode = req.getParameter("mode");
		String id = req.getParameter("id");
		String link = null;
		List<DeptDTO> listDept = deptMapper.listDeptName();
		
		switch(mode) {
			case "admin" : 
				req.setAttribute("dto", accAdminMapper.getAdmin(id));
				link = "admin/admin_acc/admin_acc_editadmin";
				break;
			case "staff" : 
				req.setAttribute("dto", accMapper.getStaff(id));
				link = "admin/admin_acc/admin_acc_editstaff";
				break;
			case "teacher" : 
				req.setAttribute("dto", accMapper.getTeacher(id));
				req.setAttribute("deptlist", listDept);
				link = "admin/admin_acc/admin_acc_editteacher";
				break;
			case "student" : 
				req.setAttribute("dto", accMapper.getStudent(id));
				req.setAttribute("deptlist", listDept);
				link = "admin/admin_acc/admin_acc_editstudent";
				break;
			default : link = "admin/admin_login";
		}
		
		return link;
	}
	
	//아이디 수정 처리
	@RequestMapping("/admin_acc_editpro.do")
	public String admin_acc_editpro(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		String mode = req.getParameter("mode");
		
		//수정 로그 추가
		EditLogDTO edto = new EditLogDTO();
		HttpSession session = req.getSession();
		edto.setId((String)session.getAttribute("id"));
		
		switch(mode) {
			case "admin" : 
				accAdmin(req, "수정");
				edto.setContent("관리자 계정수정:"+ req.getParameter("admin_id"));
				break;
			case "staff" : 
				accStaff(req, "수정");
				edto.setContent("교직원 계정수정:"+ req.getParameter("staff_id"));
				break;
			case "teacher" : 
				accTeacher(req, "수정");
				edto.setContent("교수 계정수정:"+ req.getParameter("teacher_id"));
				break;
			case "student" : 
				accStudent(req, "수정");
				edto.setContent("학생 계정수정:"+ req.getParameter("student_id"));
				break;
			default : return "admin/admin_login";
		}
		edto.setMemo(req.getParameter("memo"));
		int elog = logMapper.insertEdit(edto);
		
		return "message";
	}
	
	//아이디 삭제 처리 매핑
	@RequestMapping("/admin_acc_delete.do")
	public String admin_acc_delete(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		String mode = req.getParameter("mode");
		String id = req.getParameter("id");
		
		//수정 로그 추가
		EditLogDTO edto = new EditLogDTO();
		HttpSession session = req.getSession();
		edto.setId((String)session.getAttribute("id"));
		int res = 0;
		
		switch(mode) {
			case "admin" : 
				res = accAdminMapper.deleteAdmin(id);
				req.setAttribute("url", "admin_acc_list.do?mode=admin");
				edto.setContent("관리자 계정삭제:"+ id);
				break;
			case "staff" : 
				res = accMapper.deleteStaff(id);
				req.setAttribute("url", "admin_acc_list.do?mode=staff");
				edto.setContent("교직원 계정삭제:"+ id);
				break;
			case "teacher" : 
				res = accMapper.deleteTeacher(id);
				req.setAttribute("url", "admin_acc_list.do?mode=teacher");
				edto.setContent("교수 계정삭제:"+ id);
				break;
			case "student" : 
				res = accMapper.deleteStudent(id);
				req.setAttribute("url", "admin_acc_list.do?mode=student");
				edto.setContent("학생 계정삭제:"+ id);
				break;
		default : return "admin/admin_login";
	}
	edto.setMemo("계정삭제");
	int elog = logMapper.insertEdit(edto);
	
	req.setAttribute("msg", "삭제되었습니다");
	
	return "message";
	}
}
