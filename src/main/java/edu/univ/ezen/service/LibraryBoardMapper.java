package edu.univ.ezen.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.univ.ezen.dto.LibraryBoardDTO;

@Service
public class LibraryBoardMapper {
	@Autowired
	private SqlSession sqlSession;
	
	//도서관 공지 작성
	public int libBoard_insert(LibraryBoardDTO dto) {
		return sqlSession.insert("insertBoard", dto);
	}
	
	//도서관 공지 10개씩 리스트
	public List<LibraryBoardDTO> libBoard_list(int page){
		List<LibraryBoardDTO> list = sqlSession.selectList("liblistBoard");
		
		if(list.size() > 10 && page != 1) {
			list.subList(0, 10*(page-1)).clear();
			if(list.size() > 10) {
				List<LibraryBoardDTO> newlist = list.subList(0, 10);
				list = newlist;
			}
		}
		else if(list.size() > 10 && page == 1) {
			list.subList(10, list.size()).clear();
		}
		
		return list;
	}
	
	//도서관 공지 삭제
	public int libBoard_del(int lib_board_code) {
		return sqlSession.delete("deleteBoard", lib_board_code);
	}
	
	//도서관 공지 num으로 가져오기
	public LibraryBoardDTO libBoard_getByNum(int lib_board_code) {
		return sqlSession.selectOne("libgetBoard", lib_board_code);
	}
	
	//도서관 공지 조회수 +1
	public void libBoard_plusReadcount(int lib_board_code) {
		sqlSession.update("libPlusReadCount", lib_board_code);
	}
	
	//도서관 공지 수정
	public int libBoard_update(LibraryBoardDTO dto) {
		return sqlSession.update("updateBoard", dto);
	}
	
	//도서관 공지 찾기
	public List<LibraryBoardDTO> libBoard_findList(Map<String, String> params){
		return sqlSession.selectList("libfindBoard", params);
	}
	
	//도서관 공지 갯수 얻기
	public int countBoard() {
		return sqlSession.selectOne("countBoard");
	}
}
