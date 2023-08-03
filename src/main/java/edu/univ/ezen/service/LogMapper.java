package edu.univ.ezen.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.univ.ezen.dto.EditLogDTO;
import edu.univ.ezen.dto.InLogDTO;

@Service
public class LogMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	// Inlog 
	public List<InLogDTO> listLog(int page){
		List<InLogDTO> list = sqlSession.selectList("listLog");
		
		if(list.size() > 10 && page != 1) {
			list.subList(0, 10*(page-1)).clear();
			if(list.size() > 10) {
				List<InLogDTO> newlist = list.subList(0, 10);
				list = newlist;
			}
		}
		else if(list.size() > 10 && page == 1) {
			list.subList(10, list.size()).clear();
		}
		
		return list;
	}
	
	public int insertLog(InLogDTO dto) {
		return sqlSession.insert("insertLog", dto);
	}
	
	public int deleteLog() {
		return sqlSession.delete("deleteLog");
	}
	
	public int countLog() {
		return sqlSession.selectOne("countLog");
	}
	
	// 수정로그 
	public List<EditLogDTO> listEdit(int page) {
		List<EditLogDTO> list = sqlSession.selectList("listEdit");
		
		if(list.size() > 10 && page != 1) {
			list.subList(0, 10*(page-1)).clear();
			if(list.size() > 10) {
				List<EditLogDTO> newlist = list.subList(0, 10);
				list = newlist;
			}
		}
		else if(list.size() > 10 && page == 1) {
			list.subList(10, list.size()).clear();
		}
		
		return list;
	}
	
	public int insertEdit(EditLogDTO dto) {
		return sqlSession.insert("insertEdit", dto);
	}
	
	public int deleteEdit() {
		return sqlSession.delete("deleteEdit");
	}	
	
	public int countELog() {
		return sqlSession.selectOne("countELog");
	}
}
