package edu.univ.ezen.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.univ.ezen.dto.AccountStudentDTO;
import edu.univ.ezen.dto.MyClassDTO;

@Service
public class MyClassMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	//이너조인으로 수강중인 학생을 가져오기
	public List<MyClassDTO> stuList(String class_code){
		return sqlSession.selectList("listLecStu", class_code);
	}
	
	//학생 아이디, page값으로 20개의 강의만 리스트로 출력
	public List<MyClassDTO> listMyClass(String student_id, int page) {
		List<MyClassDTO> list = sqlSession.selectList("listMyClass", student_id);
		if(list.size() > 20 && page != 1) {
			list.subList(0, 20*(page-1)).clear();
			if(list.size() > 20) {
				List<MyClassDTO> newlist = list.subList(0, 20);
				list = newlist;
			}
		}
		else if(list.size() > 20 && page == 1) {
			list.subList(20, list.size()).clear();
		}
		return list;
	}
	
	//내가 신청한 강의를 특정 학기만 리스트로 출력
	public List<MyClassDTO> listMyClassAll(String student_id, String semester) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("student_id", student_id);
		param.put("semester", semester);
		return sqlSession.selectList("semListMyClass", param);
	}
	
	//테이블에 해당 학생이 특정 강의를 수강중인지 체크하는 메소드. 이미 수강중이면 false, 신청가능하면 true
	public boolean checkMyClass(String student_id, String class_code){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("student_id", student_id);
		param.put("class_code", class_code);
		List<MyClassDTO> list = sqlSession.selectList("checkMyClass", param);
		if(list == null || list.size() == 0) return true;
		else return false;
	}
	
	//수강신청 인젝션 메소드
	public int insertMyClass(MyClassDTO mcdto) {
		return sqlSession.insert("insertMyClass", mcdto);
	}
	
	//신청한 강의 삭제 메소드
	public int deleteMyClass(String student_id, String class_code) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("student_id", student_id);
		param.put("class_code", class_code);
		return sqlSession.delete("deleteMyClass", param);
	}
	//강의에서 학생 정보 가져오는 메소드
	public MyClassDTO getMyClass(String student_id, String class_code) {
		Map<String, String> param = new HashMap<>();
		param.put("student_id", student_id);
		param.put("class_code", class_code);
		return sqlSession.selectOne("getMyClass", param);
	}
	//성적 저장해주는 메소드
	public int setMyCredit(String student_id, String class_code, int my_credit) {
		Map<String, Object> param = new HashMap<>();
		param.put("my_credit", my_credit);
		param.put("student_id", student_id);
		param.put("class_code", class_code);
		return sqlSession.update("setMyCredit", param);
	}
	//성적 꺼내오는 메소드
	public int getMyCredit(String student_id, String class_code) {
		Map<String, Object> param = new HashMap<>();
		param.put("student_id", student_id);
		param.put("class_code", class_code);
		return sqlSession.selectOne("getMyCredit", param);
	}
	//강의 폐지되면 마이클래스에서도 삭제해주는 메소드
	   public int deleteAllClass(String class_code, String semester) {
	      Map<String, String> param = new HashMap<>();
	      param.put("class_code", class_code);
	      param.put("semester", semester);
	      return sqlSession.delete("deleteAllClass", param);
	   }
}
