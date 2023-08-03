package edu.univ.ezen.controller.staff;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.univ.ezen.dto.AccountStaffDTO;
import edu.univ.ezen.dto.AccountStudentDTO;
import edu.univ.ezen.dto.StudentScholarDTO;
import edu.univ.ezen.service.AccMapper;
import edu.univ.ezen.service.StudentEditMapper;

@Controller
public class StaffController {

	@Autowired
	private AccMapper accMapper;
	
	@Autowired
	private StudentEditMapper studentEditMapper;
	
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
	
	//교직원 페이지
	@RequestMapping("/StaffPage.do")
	public String staff_myPage(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		HttpSession session = req.getSession();
		
		AccountStaffDTO asdto = accMapper.getStaff((String)session.getAttribute("id"));
		req.setAttribute("asdto", asdto);
		return "/staff/staff_info";
	}
	
	/*
	 * //교직원 정보
	 * 
	 * @RequestMapping("/Staff_info.do") public String Staff_info(HttpServletRequest
	 * req) { boolean ch = id_check(req); if(!ch) return "/loginPortal/login_main";
	 * HttpSession session = req.getSession();
	 * 
	 * AccountStaffDTO asdto =
	 * accMapper.getStaff((String)session.getAttribute("id"));
	 * req.setAttribute("asdto", asdto); return "/staff/staff_info"; }
	 */
	
	//교직원 개인정보 수정
	@RequestMapping("/Staff_EditInfoPro.do")
	public ModelAndView staff_editInfoPro(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("message");
		
		boolean ch = id_check(req);
		if(!ch) {
			mav.setViewName("/loginPortal/login_main");
			return mav;
		}
		
		String name = req.getParameter("name");
		String birthdate = req.getParameter("birthdate");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");
		String email = req.getParameter("email");
		
		HttpSession session = req.getSession();
		
		AccountStaffDTO asdto = accMapper.getStaff((String)session.getAttribute("id"));
		asdto = new AccountStaffDTO(asdto.getStaff_id(), asdto.getStaff_pw(), name, asdto.getAuthority_level(),
				 asdto.getIndate(),  asdto.getType(), birthdate, tel, address, email);
		
		int res = accMapper.updateStaff(asdto);
		if(res != 0) {
			mav.addObject("msg", "개인정보가 수정되었습니다");
			mav.addObject("url", "StaffPage.do");
		}
		else {
			mav.addObject("msg", "개인정보 수정에 실패했습니다");
			mav.addObject("url", "StaffPage.do");
		}
		return mav;
	}
	
	//교직원 비밀번호 변경
	@RequestMapping("/Staff_ChangePasswdPro.do")
	public ModelAndView staff_changePasswdPro(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("message");
		
		boolean ch = id_check(req);
		if(!ch) {
			mav.setViewName("/loginPortal/login_main");
			return mav;
		}
		
		String orig_passwd = req.getParameter("orig_passwd");	//기존
		String new_passwd = req.getParameter("new_passwd");	//새로
		String new_passwd_ch = req.getParameter("new_passwd_ch");	//새로 체크
		HttpSession session = req.getSession();
		
        // 최소 9자리 이상, 영문자, 숫자, 특수문자를 모두 포함하는 정규표현식
        String pattern = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{9,}$";
        Pattern regex = Pattern.compile(pattern);
        Matcher matcher = regex.matcher(new_passwd);
        boolean match = matcher.matches();
        
		AccountStaffDTO asdto = accMapper.getStaff((String)session.getAttribute("id"));
		if(orig_passwd.equals(asdto.getStaff_pw())) {
			if(orig_passwd != new_passwd && new_passwd.equals(new_passwd_ch) && match) {
				int res = accMapper.updateStaff_pw(new_passwd, (String)session.getAttribute("id"));
				if(res != 0) {
					mav.addObject("msg", "비밀번호가 수정되었습니다, 다시 로그인해주세요");
					session.invalidate();
					mav.setViewName("closeWindow_move");
				}
				else {
					mav.addObject("msg", "비밀번호 수정에 실패했습니다");
					mav.addObject("url", "StaffPage.do");
				}
			}else {
				mav.addObject("msg", "새로운 비밀번호가 일치하지 않거나 비밀번호의 조건이 맞지 않습니다. 다시입력해주세요");
				mav.addObject("url", "StaffPage.do");
			}
		}else {
			mav.addObject("msg", "기존비밀번호가 틀렸습니다. 다시입력해주세요");
			mav.addObject("url", "StaffPage.do");
		}
		return mav;
	}
	
	//교직원 학생 학적정보 조회
	@RequestMapping("/Staff_stuStatus_list.do")
	public String staff_stuStatus_list(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		
		String page = req.getParameter("page");
		int pageCount = accMapper.countStudent();
		if(pageCount < 11) pageCount = 1;
		else {
			if(pageCount%10 == 0) pageCount = (pageCount/10);
			else pageCount = (pageCount/10)+1;
		}
		req.setAttribute("pageCount", pageCount);
		
		List<AccountStudentDTO> list = accMapper.listStudent(Integer.parseInt(page));
		req.setAttribute("listStudent", list);
		
		return "/staff/staff_stuStatus_list";
	}
	
	//교직원 학생 학적정보 수정 폼
	@RequestMapping("/Staff_stuStatus_edit.do")
	public String staff_stuStatus_edit(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		
		String student_id = req.getParameter("student_id");
		AccountStudentDTO asdto = accMapper.getStudent(student_id);
		req.setAttribute("asdto", asdto);
		return "/staff/staff_stuStatus_edit";
	}
	
	//교직원 학생 학적정보 수정
	@RequestMapping("/Staff_stuStatus_editPro.do")
	public ModelAndView staff_stuStatus_editPro(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("message");
		
		boolean ch = id_check(req);
		if(!ch) {
			mav.setViewName("/loginPortal/login_main");
			return mav;
		}
		
		String student_id = req.getParameter("student_id");
		String name = req.getParameter("name");
		String status = req.getParameter("status");
		
		AccountStudentDTO asdto = accMapper.getStudent(student_id);
		asdto = new AccountStudentDTO(student_id, asdto.getStudent_pw(),
				name, asdto.getDept(), asdto.getGrade(), asdto.getTotal_credit(), asdto.getBirthdate(),
				asdto.getTel(), asdto.getAddress(), status, asdto.getIndate(), asdto.getType(), asdto.getCollege(), 
				asdto.getEmail());
		
		int res = accMapper.updateStudent(asdto);
		if(res != 0) {
			mav.addObject("msg", "재학상태가 수정되었습니다");
			mav.addObject("url", "Staff_stuStatus_list.do?page=1");
		}
		else {
			mav.addObject("msg", "재학상태 수정에 실패했습니다");
			mav.addObject("url", "Staff_stuStatus_edit.do?student_id="+student_id);
		}
		return mav;
	}
	
	//교직원 학생 학번으로 찾기
	@RequestMapping("Staff_stuStatus_findId.do")
	public String staff_stuStatus_findId(HttpServletRequest req) {
	boolean ch = id_check(req);
	if(!ch) return "/loginPortal/login_main";
	
	String searchString = req.getParameter("searchString");
	List<AccountStudentDTO> find = accMapper.findStudent(searchString);
	req.setAttribute("listStudent", find);
	
	return "/staff/staff_stuStatus_list";
	}
	
	//교직원 학생 장학정보 조회 목록
	@RequestMapping("/Staff_stuScholar_list.do")
	public String staff_stuScholar_list(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		
		String page = req.getParameter("page");
		int pageCount = accMapper.countStudent();
		if(pageCount < 11) pageCount = 1;
		else {
			if(pageCount%10 == 0) pageCount = (pageCount/10);
			else pageCount = (pageCount/10)+1;
		}
		req.setAttribute("pageCount", pageCount);
		
		List<AccountStudentDTO> list = accMapper.listStudent(Integer.parseInt(page));
		req.setAttribute("listStudent", list);
		
		return "/staff/staff_stuScholar_list";
	}
	
	//교직원 학생 장학정보 조회
	@RequestMapping("/Staff_stuScholar_view.do")
	public String staff_stuScholar_view(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		String student_id = req.getParameter("student_id");
		
		List<StudentScholarDTO> list = studentEditMapper.listScholar(student_id);
		req.setAttribute("scholarList", list);
		req.setAttribute("student_id", student_id);
		return "/staff/staff_stuScholar_view";
	}
	
	//교직원 학생 장학정보 입력 폼
	@RequestMapping("/Staff_stuScholar_insert.do")
	public String staff_stuScholar_insert(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		
		String student_id = req.getParameter("student_id");
		req.setAttribute("student_id", student_id);
		return"/staff/staff_stuScholar_insert";
	}
	
	//교직원 학생 장학정보 입력
	@RequestMapping("/Staff_stuScholar_insertPro.do")
	public ModelAndView staff_stuScholar_insertPro(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("message");
		
		boolean ch = id_check(req);
		if(!ch) {
			mav.setViewName("/loginPortal/login_main");
			return mav;
		}
		
		String student_id = req.getParameter("student_id");
		String scholar_year = req.getParameter("scholar_year");
		String semester = req.getParameter("semester");
		String scholar_name = req.getParameter("scholar_name");
		String price = req.getParameter("price");
		String get_method = req.getParameter("get_method");
		
		StudentScholarDTO sdto = new StudentScholarDTO(); 
		sdto.setStudent_id(student_id);
		sdto.setScholar_year(scholar_year);
		sdto.setSemester(semester);
		sdto.setScholar_name(scholar_name);
		sdto.setPrice(price);
		sdto.setGet_method(get_method);
		
		int res = studentEditMapper.insertScholar(sdto);
		if(res > 0) {
			mav.addObject("msg", "장학정보가 추가되었습니다");
			mav.addObject("url", "Staff_stuScholar_view.do?student_id="+student_id);
		}
		else {
			mav.addObject("msg", "장학정보 추가에 실패했습니다");
			mav.addObject("url", "Staff_stuScholar_view.do?student_id="+student_id);
		}
		
		return mav;
	}
	
	//교직원 학생장학정보 수정 폼
	@RequestMapping("Staff_stuScholar_edit.do")
		public String staff_stuScholar_edit(HttpServletRequest req) {
			boolean ch = id_check(req);
			if(!ch) return "/loginPortal/login_main";
			
			int num = Integer.parseInt(req.getParameter("num"));
			req.setAttribute("num", num);
			StudentScholarDTO ssdto = studentEditMapper.getScholar(num);
			req.setAttribute("ssdto", ssdto);
			
			return "/staff/staff_stuScholar_edit";
		}
	
	//교직원 학생장학정보 수정
	@RequestMapping("Staff_stuScholar_editPro.do")
		public ModelAndView staff_stuScholar_editPro(HttpServletRequest req) {
			ModelAndView mav = new ModelAndView("message");
			
			boolean ch = id_check(req);
			if(!ch) {
				mav.setViewName("/loginPortal/login_main");
				return mav;
			}
			
			String student_id = req.getParameter("student_id");
			String scholar_year = req.getParameter("scholar_year");
			String semester = req.getParameter("semester");
			String scholar_name = req.getParameter("scholar_name");
			String price = req.getParameter("price");
			String get_method = req.getParameter("get_method");
			
			int num = Integer.parseInt(req.getParameter("num"));
			req.setAttribute("num", num);
			
			StudentScholarDTO sdto = new StudentScholarDTO();
			sdto.setNum(num);
			sdto.setStudent_id(student_id);
			sdto.setScholar_year(scholar_year);
			sdto.setSemester(semester);
			sdto.setScholar_name(scholar_name);
			sdto.setPrice(price);
			sdto.setGet_method(get_method);
			
			int res = studentEditMapper.updateScholar(sdto);
			if(res > 0) {
				mav.addObject("msg", "장학정보가 수정되었습니다");
				mav.addObject("url", "Staff_stuScholar_view.do?student_id="+student_id);
			}
			else {
				mav.addObject("msg", "장학정보 수정에 실패했습니다");
				mav.addObject("url", "Staff_stuScholar_view.do?student_id="+student_id);
			}
			return mav;
	}
	
	//교직원 학생 장학정보 삭제
	@RequestMapping("Staff_stuScholar_delete.do")
		public ModelAndView staff_stuScholar_delete(HttpServletRequest req) {
			ModelAndView mav = new ModelAndView("message");
			
			boolean ch = id_check(req);
			if(!ch) {
				mav.setViewName("/loginPortal/login_main");
				return mav;
			}
			
			int num = Integer.parseInt(req.getParameter("num"));
			String student_id = req.getParameter("student_id");
			
			int res = studentEditMapper.deleteScholar(num);
			if(res > 0) {
				mav.addObject("msg", "장학정보가 삭제되었습니다");
				mav.addObject("url", "Staff_stuScholar_view.do?student_id="+student_id);
			}
			else {
				mav.addObject("msg", "장학정보 삭제에 실패했습니다");
				mav.addObject("url", "Staff_stuScholar_view.do?student_id="+student_id);
			}
			return mav;
	}
	
	//교직원 학생 장학정보 학번으로 찾기
	@RequestMapping("Staff_stuScholar_findId.do")
		public String staff_stuScholar_findId(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		
		String searchString = req.getParameter("searchString");
		List<AccountStudentDTO> find = accMapper.findStudent(searchString);
		req.setAttribute("listStudent", find);
		
		return "/staff/staff_stuScholar_list";
	}
	
}
