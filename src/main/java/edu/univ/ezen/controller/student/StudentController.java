package edu.univ.ezen.controller.student;

import java.util.Calendar;
import java.util.HashMap;
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

import edu.univ.ezen.dto.AccountStudentDTO;
import edu.univ.ezen.dto.ClassDTO;
import edu.univ.ezen.dto.MyClassDTO;
import edu.univ.ezen.dto.StudentScholarDTO;
import edu.univ.ezen.dto.UserNoticeDTO;
import edu.univ.ezen.service.AccMapper;
import edu.univ.ezen.service.ClassMapper;
import edu.univ.ezen.service.MyClassMapper;
import edu.univ.ezen.service.StudentEditMapper;
import edu.univ.ezen.service.UserNoticeMapper;

@Controller
public class StudentController {
	
	@Autowired
	private AccMapper accMapper;
	
	@Autowired
	private StudentEditMapper studentEditMapper;
	
	@Autowired
	private ClassMapper classMapper;
	
	@Autowired
	private MyClassMapper myClassMapper;
	
	@Autowired
	private UserNoticeMapper userNoticeMapper;
	
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
	
	//학생마이페이지
	@RequestMapping("/stuMyPage.do")
	public String stu_myPage(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		
		HttpSession session = req.getSession();
		updateNotice(req);
		
		AccountStudentDTO asdto = accMapper.getStudent((String)session.getAttribute("id"));	//학번(고유번호)으로 학생정보불러오기
		req.setAttribute("accStudent", asdto);
		return "Spage/myPage/stuMyPage";
	}
	
	/*
	 * //학생 정보수정페이지
	 * 
	 * @RequestMapping("/editStuInfo.do") public String
	 * editStuInfo(HttpServletRequest req) { boolean login = isLogin(req); if
	 * (!login) return "loginPortal/login_main";
	 * 
	 * return "Spage/myPage/editStuInfo"; }
	 */
	
	//학생 현재 수강하는 강의 정보
	@RequestMapping("/stuCourseInfo.do")
	public String stu_courseInfo(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		
		HttpSession session = req.getSession();
		updateNotice(req);
		
		Calendar cal = Calendar.getInstance();
		String semester = cal.get(Calendar.YEAR)+"년";
		int month = (cal.get(Calendar.MONTH)+1);
		if(month >= 3 && month <= 6) semester += "1학기";
		else if(month >= 9 && month <= 12) semester += "2학기";
		else semester += "계절학기";	
		List<MyClassDTO> list = myClassMapper.listMyClassAll((String)session.getAttribute("id"), semester); //학번과 현재 학기로 수강중인 강의 정보 받기
		req.setAttribute("semListMyClass", list);
		req.setAttribute("semester", semester);
		return "Spage/myPage/stuCourseInfo";
	}
	
	//학생 수강한 강의 성적 정보
	@RequestMapping("/recordInfo.do")
	public String stu_recordInfo(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		
		String pageS = req.getParameter("page");
		HttpSession session = req.getSession();
		updateNotice(req);
		
		if(pageS == null) pageS = "1";
		
		int page = Integer.parseInt(pageS);
		AccountStudentDTO asdto = accMapper.getStudent((String)session.getAttribute("id")); //학번으로 학생정보 불러오기
		req.setAttribute("accStudent", asdto);
		
		List<MyClassDTO> list = myClassMapper.listMyClass((String)session.getAttribute("id"), page); //학번으로 수강한 강의 불러오기
		Map<String, String> map = new HashMap<>();
		for(MyClassDTO mcdto : list) {	
			String grade = null;	//	받은 점수 합계 학점으로 바꾸기
			if(mcdto.getMy_credit() >= 95) grade = "A+";	
			else if(mcdto.getMy_credit() >= 90 && mcdto.getMy_credit() < 95) grade = "A";
			else if(mcdto.getMy_credit() >= 85 && mcdto.getMy_credit() < 90) grade = "B+";
			else if(mcdto.getMy_credit() >= 80 && mcdto.getMy_credit() < 85) grade = "B";
			else if(mcdto.getMy_credit() >= 75 && mcdto.getMy_credit() < 80) grade = "C+";
			else if(mcdto.getMy_credit() >= 70 && mcdto.getMy_credit() < 75) grade = "C";
			else if(mcdto.getMy_credit() >= 65 && mcdto.getMy_credit() < 70) grade = "D+";
			else if(mcdto.getMy_credit() >= 60 && mcdto.getMy_credit() < 65) grade = "D";
			else if(mcdto.getMy_credit() < 60 && mcdto.getMy_credit() > 0) grade = "F";
			else grade = "학기 중";
			map.put(mcdto.getClass_name(), grade);
		}
		req.setAttribute("grade", map);
		req.setAttribute("listMyClass", list);
		
		return "Spage/myPage/recordInfo";
	}
	
	//학생 장학정보
	@RequestMapping("/scholarInfo.do")
	public String stu_scholarInfo(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		
		HttpSession session = req.getSession();
		updateNotice(req);
		
		List<StudentScholarDTO> list = studentEditMapper.listScholar((String)session.getAttribute("id")); //학번으로 장학정보받아오기
		req.setAttribute("scholarList", list);
		
		return "Spage/myPage/scholarInfo";
	}
	
	//학생 증명서 발급 방법
	@RequestMapping("/certifiInfo.do")
	public String stu_certifiInfo(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		updateNotice(req);
		
		return "Spage/myPage/certifiInfo";
	}
	
	/*
	 * //학생 정보수정시 비밀번호 체크
	 * 
	 * @RequestMapping("/checkPasswd.do") public String
	 * checkPasswd(HttpServletRequest req) { boolean login = isLogin(req); if
	 * (!login) return "loginPortal/login_main";
	 * 
	 * HttpSession session = req.getSession(); AccountStudentDTO asdto =
	 * accMapper.getStudent((String)session.getAttribute("id"));
	 * req.setAttribute("accStudent", asdto);
	 * 
	 * return "Spage/myPage/checkPasswd"; }
	 * 
	 * //학생 개인정보수정 폼
	 * 
	 * @RequestMapping("/editInfoForm.do") public ModelAndView
	 * editInfoForm(HttpServletRequest req) { ModelAndView mav = new
	 * ModelAndView("message");
	 * 
	 * String passwd = req.getParameter("passwd"); HttpSession session =
	 * req.getSession(); AccountStudentDTO asdto =
	 * accMapper.getStudent((String)session.getAttribute("id"));
	 * req.setAttribute("accStudent", asdto);
	 * 
	 * if(!passwd.equals(asdto.getStudent_pw())) { mav.addObject("msg",
	 * "비밀번호를 다시입력해주세요"); mav.addObject("url", "checkPasswd.do"); }else {
	 * mav.setViewName("Spage/myPage/editInfoForm"); } return mav; }
	 */
	
	//학생 개인정보 수정
	@RequestMapping("/editInfoPro.do")
	public ModelAndView stu_editInfoPro(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("message");
		
		boolean ch = id_check(req);
		if(!ch) {
			mav.setViewName("/loginPortal/login_main");
			return mav;
		}
		updateNotice(req);
		
		String name = req.getParameter("name");
		String college = req.getParameter("college");
		String dept = req.getParameter("dept");
		int grade = Integer.parseInt(req.getParameter("grade"));
		String birthdate = req.getParameter("birthdate");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");
		String email = req.getParameter("email");
		
		HttpSession session = req.getSession();
		
		AccountStudentDTO asdto = accMapper.getStudent((String)session.getAttribute("id"));
		asdto = new AccountStudentDTO(asdto.getStudent_id(), asdto.getStudent_pw(),
				name, dept, grade, asdto.getTotal_credit(), birthdate, tel, address, 
				asdto.getStatus(), asdto.getIndate(), asdto.getType(), college, email);
		
		int res = accMapper.updateStudent(asdto);
		if(res != 0) {
			mav.addObject("msg", "개인정보가 수정되었습니다");
			mav.addObject("url", "stuMyPage.do");
		}
		else {
			mav.addObject("msg", "개인정보 수정에 실패했습니다");
			mav.addObject("url", "stuMyPage.do");
		}
		
		return mav;
		
	}
	
	/*
	 * //학생 비밀번호 수정
	 * 
	 * @RequestMapping("/changePasswd.do") public String
	 * changePasswd(HttpServletRequest req) { return "Spage/myPage/changePasswd"; }
	 */
	
	@RequestMapping("/changePasswdPro.do")
	public ModelAndView stu_changePasswdPro(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("message");
		
		boolean ch = id_check(req);
		if(!ch) {
			mav.setViewName("/loginPortal/login_main");
			return mav;
		}
		updateNotice(req);
		
		String orig_passwd = req.getParameter("orig_passwd");	//기존
		String new_passwd = req.getParameter("new_passwd");	//새로
		String new_passwd_ch = req.getParameter("new_passwd_ch");	//새로 체크
		HttpSession session = req.getSession();
		
        // 최소 9자리 이상, 영문자, 숫자, 특수문자를 모두 포함하는 정규표현식
        String pattern = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{9,}$";
        Pattern regex = Pattern.compile(pattern);
        Matcher matcher = regex.matcher(new_passwd);
        boolean match = matcher.matches();
        
		AccountStudentDTO asdto = accMapper.getStudent((String)session.getAttribute("id"));
		if(orig_passwd.equals(asdto.getStudent_pw())) {
			if(orig_passwd != new_passwd && new_passwd.equals(new_passwd_ch) && match) {
				int res = accMapper.updateStudent_pw(new_passwd, (String)session.getAttribute("id"));
				if(res != 0) {
					mav.addObject("msg", "비밀번호가 수정되었습니다, 다시 로그인해주세요");
					mav.addObject("url", "login_main.do");
					session.invalidate();
					mav.setViewName("closeWindow_move");
				}
				else {
					mav.addObject("msg", "비밀번호 수정에 실패했습니다");
					mav.addObject("url", "stuMyPage.do");
				}
			}else {
				mav.addObject("msg", "새로운 비밀번호가 일치하지 않거나 비밀번호의 조건이 맞지 않습니다. 다시입력해주세요");
				mav.addObject("url", "stuMyPage.do");
			}
		}else {
			mav.addObject("msg", "기존비밀번호가 틀렸습니다. 다시입력해주세요");
			mav.addObject("url", "stuMyPage.do");
		}
		return mav;
	}
	
	//학생 증명서 인터넷출력
	@RequestMapping("certifi_output.do")
		public String stu_certifi_output(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		updateNotice(req);
		
		return "/Spage/myPage/certifi_output";
	}
	
	//학생 증명서 우편
	@RequestMapping("certifi_post.do")
	public String stu_certifi_post(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		updateNotice(req);
		
		return "/Spage/myPage/certifi_post";
	}
	
	/*
	 * //학생 수강중인 강의 선택 게시판가기
	 * 
	 * @RequestMapping("stuLecture.do") public String lecture(HttpServletRequest
	 * req) { boolean ch = id_check(req); if(!ch) return "/loginPortal/login_main";
	 * 
	 * String student_id = req.getParameter("student_id"); int page = 1;
	 * List<MyClassDTO> list = myClassMapper.listMyClass(student_id, page);
	 * req.setAttribute("list", list); req.setAttribute("student_id", student_id);
	 * return "Spage/myPage/lecture"; }
	 */
	
	//선택한 강의 정보 확인 후 게시판가기
	@RequestMapping("stuClassCheck.do")
	public String stu_classCheck(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "/loginPortal/login_main";
		HttpSession session = req.getSession();
		updateNotice(req);
		
		String student_id = req.getParameter("student_id");
		String class_name = req.getParameter("class_name");
		ClassDTO dto = classMapper.getClassName(class_name);
		String class_code = dto.getClass_code();
		session.setAttribute("class_code", class_code);
		req.setAttribute("getClass", dto);
		req.setAttribute("student_id", student_id);
		return "Spage/myPage/classCheck";
	}
	
	//유저 알림 갱신 메소드
	   protected void updateNotice(HttpServletRequest req) {
	      HttpSession session = req.getSession();
	      String student_id = (String)session.getAttribute("id");
	      List<UserNoticeDTO> list = userNoticeMapper.getUserNotice(student_id);
	      session.setAttribute("userNotice", list);
	   }
	   
	   //유저 알림 이동
	   @RequestMapping("/stuNoticeMoveTo.do")
	   public ModelAndView stu_moveToNotice(HttpServletRequest req) {
	      ModelAndView mav = new ModelAndView();
	      String url = req.getParameter("url");
	      mav.setViewName("closeWindow_moveBoard");
	      mav.addObject("url", url);
	      int res = userNoticeMapper.deleteUserNotice(url);
	      return mav;
	   }
	   
	   //알림 모두 지우기
	   @RequestMapping("/stuNoticeRemoveAll.do")
	   public String stu_noticeRemoveAll(HttpServletRequest req) {
		   HttpSession session = req.getSession();
		   updateNotice(req);
		   int res = userNoticeMapper.deleteUserNotice_getStu((String)session.getAttribute("id"));
		   AccountStudentDTO asdto = accMapper.getStudent((String)session.getAttribute("id"));	//학번(고유번호)으로 학생정보불러오기
		   req.setAttribute("accStudent", asdto);
		   return "Spage/myPage/stuMyPage";
	   }
}
