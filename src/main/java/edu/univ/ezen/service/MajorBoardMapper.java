package edu.univ.ezen.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.univ.ezen.dto.MajorBoardDTO;
import edu.univ.ezen.dto.MajorBoardReplyDTO;


@Service
public class MajorBoardMapper {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertBoard(MajorBoardDTO dto) {
		return sqlSession.insert("MajorInsertBoard", dto);
	}
	public List<MajorBoardDTO> listBoard(Map<String, Object> params){
		return sqlSession.selectList("MajorListBoard", params);
	}
	public int deleteBoard(int major_board_code) {
		return sqlSession.delete("MajorDeleteBoard", major_board_code);
	}
	public MajorBoardDTO getByNum(int major_board_code, String mode){
		if(mode.equals("content")) plusReadCount(major_board_code);
		return sqlSession.selectOne("MajorGetBoard", major_board_code);
	}
	public int plusReadCount(int major_board_code) {
		return sqlSession.update("MajorPlusReadCount", major_board_code);
	}
	public int updateBoard(MajorBoardDTO dto) {
		return sqlSession.update("MajorUpdateBoard", dto);
	}
	public List<MajorBoardDTO> findList(String search, String searchString, String class_code) {
		Map<String, String> params = new HashMap<>();
		params.put("search", search);
		params.put("searchString", "%"+searchString+"%");
		params.put("class_code", class_code);
		return sqlSession.selectList("MajorFindBoard", params);
	}
	public int getCount(String class_name) {
		return sqlSession.selectOne("MajorGetCount", class_name);
	}
	public int getNum() {
		return sqlSession.selectOne("MajorGetNum");
	}
	public List<MajorBoardReplyDTO> readReply(int bno) {
		return sqlSession.selectList("readReply", bno);
	}
	public int writeReply(MajorBoardReplyDTO dto) {
		return sqlSession.insert("writeReply", dto);
	}
	public int updateReply(MajorBoardReplyDTO dto) {
		return sqlSession.update("updateReply2", dto);
	}
	public int deleteReply(int rno) {
		return sqlSession.delete("deleteReply2", rno);
	}
	public MajorBoardReplyDTO selectReply(int rno) {
		return sqlSession.selectOne("selectReply", rno);
	}
	public int countReply(int major_board_code) {
		return sqlSession.selectOne("countReply", major_board_code);
	}
}
