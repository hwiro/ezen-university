package edu.univ.ezen.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.univ.ezen.dto.MajorBoardDTO;
import edu.univ.ezen.dto.MajorBoardReplyDTO;

@Service
public class ClassBoardMapper {

	@Autowired
	private SqlSession sqlSession;
	//Board
	public int insertBoard(MajorBoardDTO dto) {
		return sqlSession.insert("insertBoard", dto);
	}
	
	public List<MajorBoardDTO> listBoard(){
		return sqlSession.selectList("listBoard");
	}
	
	public List<MajorBoardDTO>findListBoard(String search, String searchString){
		Map<String, String> param = new HashMap<String, String>();
		param.put("search", search);
		param.put("searchString", searchString);
		return sqlSession.selectList("findListBoard", param);
	}
	
	public int updateBoard(MajorBoardDTO dto) {
		return sqlSession.update("updateBoard", dto);
	}
	
	public int deleteBoard(int major_board_code) {
		return sqlSession.delete("deleteBoard", major_board_code);
	}
	
	public MajorBoardDTO classBoard_getByNum(int major_board_code) {
		return sqlSession.selectOne("getBoard", major_board_code);
	}
	
	public int plusReadCount(int major_board_code ) {
		return sqlSession.update("plusReadCount", major_board_code);
	}
	
	public int insertReBoard(MajorBoardReplyDTO dto) {
		return sqlSession.insert("insertReBoard", dto);
	}
	
	public List<MajorBoardReplyDTO> listReBoard(){
		return sqlSession.selectList("listReBoard");
	}
	//ReBoard
	public int updateReBoard(MajorBoardReplyDTO dto) {
		return sqlSession.update("updateReBoard", dto);
	}
	
	public int deleteReBoard(int major_board_reply_code) {
		return sqlSession.delete("deleteReBoard", major_board_reply_code);
	}
	

	
}
