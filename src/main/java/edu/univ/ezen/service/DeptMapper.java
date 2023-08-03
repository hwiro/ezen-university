package edu.univ.ezen.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.univ.ezen.dto.DeptDTO;

@Service
public class DeptMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertDept(DeptDTO ddto) {
		return sqlSession.insert("insertDept", ddto);
	}
	
	public List<DeptDTO> listDept() {
		return sqlSession.selectList("listDept");
	}
	
	public List<DeptDTO> listDeptName() {
		return sqlSession.selectList("listDeptName");
	}
	
	public int deleteDept(String dept_id) {
		return sqlSession.delete("deleteDept", dept_id);
	}
	
	public DeptDTO getDept(String dept_id) {
		return sqlSession.selectOne("getDept", dept_id);
	}
	
}
