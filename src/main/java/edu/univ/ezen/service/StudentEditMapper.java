package edu.univ.ezen.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.univ.ezen.dto.AccountStudentDTO;
import edu.univ.ezen.dto.StudentAttendanceDTO;
import edu.univ.ezen.dto.StudentScholarDTO;

@Service
public class StudentEditMapper {

	@Autowired
	private SqlSession sqlSession;
	//학생출결기능
	public int insertAttend(StudentAttendanceDTO dto) {
		return sqlSession.insert("insertAttend", dto);
	}
	
	public int updateAttend(StudentAttendanceDTO dto) {
		return sqlSession.update("updateAttend", dto);
	}
	
	public List<StudentAttendanceDTO> listAttend(){
		return sqlSession.selectList("listAttend");
	}
	
	public int deleteAttend() {
	return sqlSession.delete("deleteAttend");
	}
	//학생 장학정보
	public int insertScholar(StudentScholarDTO dto) {
		return sqlSession.insert("insertScholar", dto);
	}
	
	public List<StudentScholarDTO> listScholar(String student_id){
		return sqlSession.selectList("listScholar", student_id);
	}
	
	public List<StudentScholarDTO> findListScholar(String searchString){
		return sqlSession.selectList("findListScholar", searchString);
	}
	
	public int updateScholar(StudentScholarDTO dto) {
		return sqlSession.update("updateScholar", dto);
	}
	
	public int deleteScholar(int num) {
		return sqlSession.delete("deleteScholar", num);
	}
	
	public StudentScholarDTO getScholar(int num) {
		return sqlSession.selectOne("getScholar", num);
	}
	//학생 학적
	public int updateStatus(Map<String, String> params) {
		return sqlSession.update("updateStatus", params);
	}
	
	public List<AccountStudentDTO> listStatus(){
		return sqlSession.selectList("listStatus");
	}
	
	public List<AccountStudentDTO> findListStatus(String search, String searchString){
		Map<String, String> param = new HashMap<String, String>();
		param.put("search", search);
		param.put("searchString", searchString);
		return sqlSession.selectList("findListStatus", param);
	}
	
	
}


