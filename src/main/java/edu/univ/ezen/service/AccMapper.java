package edu.univ.ezen.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.univ.ezen.dto.AccountStudentDTO;
import edu.univ.ezen.dto.AccountTeacherDTO;
import edu.univ.ezen.dto.InLogDTO;
import edu.univ.ezen.dto.MyClassDTO;
import edu.univ.ezen.dto.AccountStaffDTO;

@Service
public class AccMapper {

	@Autowired
	private SqlSession sqlSession;
	
	//학생정보 수정 sql메소드
	public int insertStudent(AccountStudentDTO asdto) {
		return sqlSession.insert("studentInsert", asdto);
	}
	
	public List<AccountStudentDTO> listStudent(int page) {
		List<AccountStudentDTO> list = sqlSession.selectList("studentList");

		if(list.size() > 10 && page != 1) {
			list.subList(0, 10*(page-1)).clear();
			if(list.size() > 10) {
				List<AccountStudentDTO> newlist = list.subList(0, 10);
				list = newlist;
			}
		}
		else if(list.size() > 10 && page == 1) {
			list.subList(10, list.size()).clear();
		}
		
		return list;
	}
	
	public List<AccountStudentDTO> findStudent(String searchString){
		return sqlSession.selectList("studentFind", "%"+searchString+"%");
	}
	
	public List<AccountStudentDTO> studentFindByEmail(String email){
		return sqlSession.selectList("studentFindByEmail", email);
	}
	
	public int countStudent() {
		return sqlSession.selectOne("countStudent");
	}
	
	public int updateStudent(AccountStudentDTO asdto) {
		return sqlSession.update("studentUpdate", asdto);
	}
	
	public int updateStudent_pw(String student_pw, String student_id) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("student_pw", student_pw);
		param.put("student_id", student_id);
		return sqlSession.update("student_pw_Update", param);
	}
	
	public int deleteStudent(String student_id) {
		return sqlSession.delete("studentDelete", student_id);
	}
	
	public AccountStudentDTO getStudent(String student_id) {
		return sqlSession.selectOne("studentGet", student_id);
	}
	
	public int plusCreditStudent(String student_id, int credit) {
		Map<Object, Object> param = new HashMap<Object, Object>();
		param.put("student_id", student_id);
		param.put("credit", credit);
		return sqlSession.update("studentPlusCredit", param);
	}
	
	public int plusGradeStudent(String student_id, int grade) {
		Map<Object, Object> param = new HashMap<Object, Object>();
		param.put("student_id", student_id);
		param.put("grade", grade);
		return sqlSession.update("studentPlusGrade", param);
	}
	//이너조인으로 수강중인 학생을 가져오기
	public List<AccountStudentDTO> stuList(String class_code){
		return sqlSession.selectList("listLecStu2", class_code);
	}

	//여기까지 학생정보 수정 sql메소드
	
	//교사정보 수정 sql메소드
	public int insertTeacher(AccountTeacherDTO atdto) {
		return sqlSession.insert("teacherInsert", atdto);
	}
	
	public List<AccountTeacherDTO> listTeacher(int page) {
		List<AccountTeacherDTO> list = sqlSession.selectList("teacherList");

		if(list.size() > 10 && page != 1) {
			list.subList(0, 10*(page-1)).clear();
			if(list.size() > 10) {
				List<AccountTeacherDTO> newlist = list.subList(0, 10);
				list = newlist;
			}
		}
		else if(list.size() > 10 && page == 1) {
			list.subList(10, list.size()).clear();
		}
		
		return list;
	}
	
	public List<AccountTeacherDTO> listTeacherAll() {
		return sqlSession.selectList("teacherList");
	}
	
	public int updateTeacher(AccountTeacherDTO atdto) {
		return sqlSession.update("teacherUpdate", atdto);
	}
	
	public int deleteTeacher(String teacher_id) {
		return sqlSession.delete("teacherDelete", teacher_id);
	}
	
	public AccountTeacherDTO getTeacher(String teacher_id) {
		return sqlSession.selectOne("teacherGet", teacher_id);
	}
	
	public int updateTeacher_pw(String teacher_pw, String teacher_id) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("teacher_pw", teacher_pw);
		param.put("teacher_id", teacher_id);
		return sqlSession.update("teacher_pw_Update", param);
	}
	//여기까지 교사정보 수정 sql메소드
	
	//교직원정보 수정 sql메소드
	public int insertStaff(AccountStaffDTO asdto) {
		return sqlSession.insert("staffInsert", asdto);
	}
	
	public List<AccountStaffDTO> listStaff(int page) {
		List<AccountStaffDTO> list = sqlSession.selectList("staffList");

		if(list.size() > 10 && page != 1) {
			list.subList(0, 10*(page-1)).clear();
			if(list.size() > 10) {
				List<AccountStaffDTO> newlist = list.subList(0, 10);
				list = newlist;
			}
		}
		else if(list.size() > 10 && page == 1) {
			list.subList(10, list.size()).clear();
		}
		
		return list;
	}
	
	public int updateStaff(AccountStaffDTO asdto) {
		return sqlSession.update("staffUpdate", asdto);
	}
	
	public int updateStaff_pw(String staff_pw, String staff_id) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("staff_pw", staff_pw);
		param.put("staff_id", staff_id);
		return sqlSession.update("staff_pw_Update", param);
	}
	
	public int deleteStaff(String staff_id) {
		return sqlSession.delete("staffDelete", staff_id);
	}
	
	public AccountStaffDTO getStaff(String staff_id) {
		return sqlSession.selectOne("staffGet", staff_id);
	}
	//여기까지 교직원정보 수정 sql메소드
}
