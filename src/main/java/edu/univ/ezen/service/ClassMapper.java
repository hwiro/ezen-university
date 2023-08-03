package edu.univ.ezen.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.univ.ezen.dto.ClassDTO;

@Service
public class ClassMapper {

	@Autowired
	private SqlSession sqlSession;
	
	//DTO를 통한 DB 인젝션
	public int insertClass(ClassDTO cdto) {
		return sqlSession.insert("insertClass", cdto);
	}
	
	//page값으로 20개만 가져오기
	public List<ClassDTO> listClass(int page) {
		List<ClassDTO> list = sqlSession.selectList("listClass");
		if(list.size() > 20 && page != 1) {
			list.subList(0, 20*(page-1)).clear();
			if(list.size() > 20) {
				List<ClassDTO> newlist = list.subList(0, 20);
				list = newlist;
			}
		}
		else if(list.size() > 20 && page == 1) {
			list.subList(20, list.size()).clear();
		}
		return list;
	}
	
	//학기에 맞는 강의 가져오기
	public List<ClassDTO> listClass_getSem(int page, String semester){
		Map<String, Object> param = new HashMap<>();
		param.put("page", page);
		param.put("semester", semester);
		List<ClassDTO> list = sqlSession.selectList("listClass_getSem", param);
		if(list.size() > 20 && page != 1) {
			list.subList(0, 20*(page-1)).clear();
			if(list.size() > 20) {
				List<ClassDTO> newlist = list.subList(0, 20);
				list = newlist;
			}
		}
		else if(list.size() > 20 && page == 1) {
			list.subList(20, list.size()).clear();
		}
		return list;
	}
	//page값으로 20개만 가져오기
	public List<ClassDTO> listClassAll() {
		return sqlSession.selectList("listClass");
	}
	
	//특정 학과 아이디 혹은 강의명을 가진 DTO 리스트 가져오기
	public List<ClassDTO> listClassDept(String searchString, int page) {
		List<ClassDTO> list = sqlSession.selectList("listClassDept", searchString);
		if(list.size() > 20 && page != 1) {
			list.subList(0, 20*(page-1)).clear();
			if(list.size() > 20) {
				List<ClassDTO> newlist = list.subList(0, 20);
				list = newlist;
			}
		}
		else if(list.size() > 20 && page == 1) {
			list.subList(20, list.size()).clear();
		}
		return list;
	}
	
	//특정 학과 아이디 혹은 강의명을 가진 DTO 리스트 가져오기 -학기별
	public List<ClassDTO> listClassDept_getSem(String searchString, int page, String semester) {
		Map<String, Object> param = new HashMap<>();
		param.put("searchString", searchString);
		param.put("page", page);
		param.put("semester", semester);
		List<ClassDTO> list = sqlSession.selectList("listClassDept_getSem", param);
		if(list.size() > 20 && page != 1) {
			list.subList(0, 20*(page-1)).clear();
			if(list.size() > 20) {
				List<ClassDTO> newlist = list.subList(0, 20);
				list = newlist;
			}
		}
		else if(list.size() > 20 && page == 1) {
			list.subList(20, list.size()).clear();
		}
		return list;
	}
	//강의 번호로 강의 삭제
	public int deleteClass(String class_code) {
		return sqlSession.delete("deleteClass", class_code);
	}
	
	//강의 코드로 DTO가져오기
	public ClassDTO getClass(String class_code) {
		return sqlSession.selectOne("getClass", class_code);
	}

	//강의 이름으로 DTO 가져오기
	public ClassDTO getClassName(String class_name) {
		return sqlSession.selectOne("getClassName", class_name);
	}
	
	//강의 전체 갯수 카운트
	public int countClass() {
		return sqlSession.selectOne("countClass");
	}
	
	//강의 검색 갯수 카운트
	public int countClassDist(String dept_id) {
		return sqlSession.selectOne("countClassDist", dept_id);
	}
	
	//교수한테 걸려있는 강의 찾기
	public List<ClassDTO> getProClassList(String teacher_id){
		return sqlSession.selectList("getProClass", teacher_id);
	}
}
