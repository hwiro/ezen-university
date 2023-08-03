package edu.univ.ezen.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.univ.ezen.dto.MajorQnaBoardDTO;

@Service
public class MajorQnaBoardMapper {
	@Autowired
	private SqlSession sqlSession;
	public int majorQnaBoard_insert(MajorQnaBoardDTO dto) {
		return sqlSession.insert("qnaBoardInsertBoard", dto);
	}
	public int majorQnaBoard_plusReGroup(int major_qna_board_code) {
		return sqlSession.update("qnaBoardPlusReGroup", major_qna_board_code);
	}
	public List<MajorQnaBoardDTO> majorQnaBoard_list(Map<String, Object> params){
		return sqlSession.selectList("qnaBoardListBoard", params);
	}
	public int majorQnaBoard_del(int major_qna_board_code) {
		return sqlSession.delete("qnaBoardDeleteBoard", major_qna_board_code);
	}
	public MajorQnaBoardDTO majorQnaBoard_getByNum(int major_qna_board_code, String mode) {
		if(mode.equals("content")) plusReadCount(major_qna_board_code);
		return sqlSession.selectOne("qnaBoardGetBoard", major_qna_board_code);
	}
	public int plusReadCount(int major_qna_board_code) {
		return sqlSession.update("qnaBoardPlusReadCount", major_qna_board_code);
	}
	public int majorQnaBoard_update(MajorQnaBoardDTO dto) {
		return sqlSession.update("qnaBoardUpdateBoard", dto);
	}
	public List<MajorQnaBoardDTO> majorQnaBoard_findList(String search, String searchString, String class_code){
		Map<String, String> params = new HashMap<>();
		params.put("search", search);
		params.put("searchString", "%"+searchString+"%");
		params.put("class_code", class_code);
		return sqlSession.selectList("qnaBoardFindBoard", params);
	}
	public int getCount(String  class_code) {
		return sqlSession.selectOne("qnaBoardGetCount", class_code);
	}
	public String selectMax() {
		return sqlSession.selectOne("qnaBoardSelectMax");
	}
	public int selectReStepMax(int re_group) {
		return sqlSession.selectOne("qnaBoardSelectReStepMax", re_group);
	}
}
