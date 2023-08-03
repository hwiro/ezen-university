package edu.univ.ezen.controller.professor;



import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.univ.ezen.dto.AccountStudentDTO;
import edu.univ.ezen.dto.AccountTeacherDTO;
import edu.univ.ezen.dto.ClassDTO;
import edu.univ.ezen.dto.MyClassDTO;
import edu.univ.ezen.service.AccMapper;
import edu.univ.ezen.service.ClassMapper;
import edu.univ.ezen.service.MyClassMapper;

@Controller
public class ProfessorController {
	protected boolean isLogin(HttpServletRequest req) {
		HttpSession session = req.getSession();
		if (session.getAttribute("id") == null) {
			return false;
		} else {
			 return true;
		}
	}
	@Autowired
	private ClassMapper classMapper;
	@Autowired
	private AccMapper accMapper;
	@Autowired
	private MyClassMapper myClassMapper;
	

	// 강의페이지 이동
	@RequestMapping("lecture.do")
	public String lecture(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if(!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "closeWindow_move_move";
		}
		HttpSession session = req.getSession();
		String type = (String)session.getAttribute("type");
		if(!type.equals("교수")) {
			req.setAttribute("msg", "권한이 없습니다.");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		List<ClassDTO> list = classMapper.getProClassList((String)session.getAttribute("id"));
		session.setAttribute("list", list);
		return "Ppage/lecture";
	}

	// 강의 페이지에서 강의 조회 처리
	@RequestMapping("classCheck.do")
	public String classCheck(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if(!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			return "closeWindow_move";
		}
		HttpSession session = req.getSession();
		String type = (String)session.getAttribute("type");
		if(!type.equals("교수")) {
			req.setAttribute("msg", "권한이 없습니다.");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		String lecture = req.getParameter("lecture");
		if(lecture == null) {
			if(session.getAttribute("class_code") == null) {
				req.setAttribute("msg", "세션이 만료되었습니다.");
				req.setAttribute("url", "Ppage.do");
				return "message";
			}
			String class_code = (String)session.getAttribute("class_code");
			lecture = classMapper.getClass(class_code).getClass_name();
		}
		ClassDTO dto = classMapper.getClassName(lecture);
		String class_code = dto.getClass_code();
		session.setAttribute("class_code", class_code);
		req.setAttribute("getClass", dto);
		return "Ppage/classCheck";
	}

	// 강의개설신청 페이지 이동
	@RequestMapping("openLecture.do")
	public String openLecture(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if(!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			return "closeWindow_move";
		}
		HttpSession session = req.getSession();
		String type = (String)session.getAttribute("type");
		if(!type.equals("교수")) {
			req.setAttribute("msg", "권한이 없습니다.");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		return "Ppage/openLecture";
	}

	// 내정보변경 페이지 이동
	@RequestMapping("ProEditMyInfo.do")
	public String editMyInfo(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if(!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "closeWindow_move";
		}
		HttpSession session = req.getSession();
		String type = (String)session.getAttribute("type");
		if(!type.equals("교수")) {
			req.setAttribute("msg", "권한이 없습니다.");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		AccountTeacherDTO dto = accMapper.getTeacher((String)session.getAttribute("id"));
		req.setAttribute("getTeacher", dto);
		return "Ppage/editMyInfo";
	}

	// 내 정보 변경 처리
	@RequestMapping("ProEditMyInfoPro.do")
	public String editMyInfoPro(HttpServletRequest req, @ModelAttribute AccountTeacherDTO dto) {
		boolean id_check = isLogin(req);
		if(!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "closeWindow_move";
		}
		HttpSession session = req.getSession();
		String type = (String)session.getAttribute("type");
		if(!type.equals("교수")) {
			req.setAttribute("msg", "권한이 없습니다.");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");
		String email = req.getParameter("email");
		dto = accMapper.getTeacher((String)session.getAttribute("id"));
		dto.setTel(tel);
		dto.setAddress(address);
		dto.setEmail(email);
		int res = accMapper.updateTeacher(dto);
		if (res > 0) {
			req.setAttribute("msg", "정보 수정 성공");
			req.setAttribute("url", "ProEditMyInfo.do");
		} else {
			req.setAttribute("msg", "정보 수정 실패");
			req.setAttribute("url", "ProEditMyInfo.do");
		}
		return "message";
	}
	//비밀번호변경
	@RequestMapping("/ProChangePasswdPro.do")
	public ModelAndView changePasswdPro(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("message");

		String orig_passwd = req.getParameter("orig_passwd"); // 기존
		String new_passwd = req.getParameter("new_passwd"); // 새로
		String new_passwd_ch = req.getParameter("new_passwd_ch"); // 새로 체크
		HttpSession session = req.getSession();

		// 최소 9자리 이상, 영문자, 숫자, 특수문자를 모두 포함하는 정규표현식
		String pattern = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{9,}$";
		Pattern regex = Pattern.compile(pattern);
		Matcher matcher = regex.matcher(new_passwd);
		boolean match = matcher.matches();

		AccountTeacherDTO tdto = accMapper.getTeacher((String) session.getAttribute("id"));
		if (orig_passwd.equals(tdto.getTeacher_pw())) {
			if (orig_passwd != new_passwd && new_passwd.equals(new_passwd_ch) && match) {
				int res = accMapper.updateTeacher_pw(new_passwd, (String) session.getAttribute("id"));
				if(res != 0) {
					mav.addObject("msg", "비밀번호가 수정되었습니다, 다시 로그인해주세요");
					mav.addObject("url", "login_main.do");
					session.invalidate();
					mav.setViewName("closeWindow_move_move");
				}
				else {
					mav.addObject("msg", "비밀번호 수정에 실패했습니다");
					mav.addObject("url", "ProEditMyInfo.do");
				}
			}else {
				mav.addObject("msg", "새로운 비밀번호가 일치하지 않거나 비밀번호의 조건이 맞지 않습니다. 다시입력해주세요");
				mav.addObject("url", "ProEditMyInfo.do");
			}
		}else {
			mav.addObject("msg", "기존비밀번호가 틀렸습니다. 다시입력해주세요");
			mav.addObject("url", "ProEditMyInfo.do");
		}
		return mav;
	}

	// 강의 듣는 학생 목록 페이지 이동
	@RequestMapping("listStuInfo.do")
	public String listStuInfo(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if(!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "closeWindow_move";
		}
		HttpSession session = req.getSession();
		String type = (String)session.getAttribute("type");
		if(!type.equals("교수")) {
			req.setAttribute("msg", "권한이 없습니다.");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		List<AccountStudentDTO> list = accMapper.stuList((String)session.getAttribute("class_code"));
		req.setAttribute("class_code", (String)session.getAttribute("class_code"));
		req.setAttribute("listStu", list);
		return "Ppage/listStuInfo";
	}

	// 성적입력페이지 이동
	@RequestMapping("insertGrade.do")
	public String insertGrade(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if(!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "closeWindow_move";
		}
		HttpSession session = req.getSession();
		String type = (String)session.getAttribute("type");
		if(!type.equals("교수")) {
			req.setAttribute("msg", "권한이 없습니다.");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		List<AccountStudentDTO> list2 = accMapper.stuList((String)session.getAttribute("class_code"));
		Map<String, String> map = new HashMap<>();
		for(int i = 0; i < list2.size(); ++i) {
			String student_id = list2.get(i).getStudent_id();
			String grade = null;
			MyClassDTO dto= myClassMapper.getMyClass(student_id, (String)session.getAttribute("class_code"));
			if(dto.getMy_credit() >= 95) grade = "A+";
			else if(dto.getMy_credit() >= 90 && dto.getMy_credit() < 95) grade = "A";
			else if(dto.getMy_credit() >= 85 && dto.getMy_credit() < 90) grade = "B+";
			else if(dto.getMy_credit() >= 80 && dto.getMy_credit() < 85) grade = "B";
			else if(dto.getMy_credit() >= 75 && dto.getMy_credit() < 80) grade = "C+";
			else if(dto.getMy_credit() >= 70 && dto.getMy_credit() < 75) grade = "C";
			else if(dto.getMy_credit() >= 65 && dto.getMy_credit() < 70) grade = "D+";
			else if(dto.getMy_credit() >= 60 && dto.getMy_credit() < 65) grade = "D";
			else if(dto.getMy_credit() < 60 && dto.getMy_credit() > 0) grade = "F";
			else grade = "값 없음";
			map.put(student_id, grade);
		}
		req.setAttribute("grade", map);
		req.setAttribute("listStu2", list2);
		return "Ppage/insertGrade";
	}

	// 성적 저장 폼 이동
	@RequestMapping("insertGradePro.do")
	public String insertGradeSave(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if(!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "closeWindow_move";
		}
		HttpSession session = req.getSession();
		String type = (String)session.getAttribute("type");
		if(!type.equals("교수")) {
			req.setAttribute("msg", "권한이 없습니다.");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		String student_id = req.getParameter("student_id");
		req.setAttribute("student_id", student_id);
		String student_name = accMapper.getStudent(student_id).getName();
		req.setAttribute("student_name", student_name);
		return "Ppage/insertGradeForm";
	}
	//성적 계산 및 저장
	@RequestMapping("saveGrade.do")
	public String saveGrade(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if(!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "closeWindow_move";
		}
		HttpSession session = req.getSession();
		String type = (String)session.getAttribute("type");
		if(!type.equals("교수")) {
			req.setAttribute("msg", "권한이 없습니다.");
			req.setAttribute("url", "login_main.do");
			return "message";
		}
		String student_id = req.getParameter("student_id");
		if(req.getParameter("attendance") == null || req.getParameter("attendance").trim().equals("") ||
				req.getParameter("homework") == null || req.getParameter("homework").trim().equals("") ||
				req.getParameter("midterm") == null || req.getParameter("midterm").trim().equals("") || 
				req.getParameter("finals") == null ||  req.getParameter("finals").trim().equals("")) {
			req.setAttribute("msg", "점수를 입력해주세요!");
			req.setAttribute("url", "insertGradePro.do?student_id=" + student_id);
			return "message";
		}
		String attendance = req.getParameter("attendance");
		String homework = req.getParameter("homework");
		String midterm = req.getParameter("midterm");
		String finals = req.getParameter("finals");
		int total = Integer.parseInt(attendance) + Integer.parseInt(homework) + Integer.parseInt(midterm) + Integer.parseInt(finals);
		if(total > 100) {
			req.setAttribute("msg", "총점은 100점을 넘길 수 없습니다. 다시 입력해주세요.");
			req.setAttribute("url", "insertGradePro.do?student_id=" + student_id);
			return "message";
		}else if(total < 0) {
			req.setAttribute("msg", "값을 잘못 입력하셨습니다. 다시 입력해주세요.");
			req.setAttribute("url", "insertGradePro.do?student_id=" + student_id);
			return "message";
		}
		int res = myClassMapper.setMyCredit(student_id, (String)session.getAttribute("class_code"), total);
		if(res>0) {
			req.setAttribute("msg", "성적 저장 성공");
			req.setAttribute("url", "insertGrade.do");
			return "message";
		}else {
			req.setAttribute("msg", "성적 저장 실패");
			req.setAttribute("url", "insertGrade.do");
			return "message";
		}
	}

}
