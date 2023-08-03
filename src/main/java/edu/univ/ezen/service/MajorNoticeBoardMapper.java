package edu.univ.ezen.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.univ.ezen.dto.MajorNoticeBoardDTO;

@Service
public class MajorNoticeBoardMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertBoard(MajorNoticeBoardDTO dto) {
		return sqlSession.insert("MajorNoticeInsertBoard", dto);
	}
	public List<MajorNoticeBoardDTO> listBoard(Map<String, Object> params){
		return sqlSession.selectList("MajorNoticeListBoard", params);
	}
	public int deleteBoard(int major_notice_board_code) {
		return sqlSession.delete("MajorNoticeDeleteBoard", major_notice_board_code);
	}
	public MajorNoticeBoardDTO getByNum(int major_notice_board_code, String mode){
		if(mode.equals("content")) plusReadCount(major_notice_board_code);
		return sqlSession.selectOne("MajorNoticeGetBoard", major_notice_board_code);
	}
	public int plusReadCount(int major_notice_board_code) {
		return sqlSession.update("MajorNoticePlusReadCount", major_notice_board_code);
	}
	public int updateBoard(MajorNoticeBoardDTO dto) {
		return sqlSession.update("MajorNoticeUpdateBoard", dto);
	}
	public List<MajorNoticeBoardDTO> findList(String search, String searchString, String class_code) {
		Map<String, String> params = new HashMap<>();
		params.put("search", search);
		params.put("searchString", "%"+searchString+"%");
		params.put("class_code", class_code);
		return sqlSession.selectList("MajorNoticeFindBoard", params);
	}
	public int getCount(String class_code) {
		return sqlSession.selectOne("MajorNoticeGetCount", class_code);
	}
	public int getNum() {
		return sqlSession.selectOne("MajorNoticeGetNum");
	}
}
