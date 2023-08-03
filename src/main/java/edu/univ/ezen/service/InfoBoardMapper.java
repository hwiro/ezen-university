package edu.univ.ezen.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.univ.ezen.dto.InfoBoardDTO;

@Service
public class InfoBoardMapper {

	@Autowired
	private SqlSession sqlSession;
	
	//공지 작성
	public int infoBoard_insert(InfoBoardDTO dto) {
		return sqlSession.insert("info_insertBoard", dto);
	}
	
	//공지 리스트 띄우기
	public List<InfoBoardDTO> infoBoard_list(String type, int page){
		List<InfoBoardDTO> list = sqlSession.selectList("info_listBoard", type);
		
		if(list.size()>10 && page != 1) {
			 list.subList(0, 10*(page-1)).clear();
			 if(list.size() > 10) {
	            List<InfoBoardDTO> newlist = list.subList(0, 10);
	            list = newlist;
	         }
	      }
	      else if(list.size() > 10 && page == 1) {
	         list.subList(10, list.size()).clear();
	      }
		return list;
	}
	
	//관리자용 모든 공지 리스트 띄우기
	public List<InfoBoardDTO> infoBoard_listAll(int page){
		List<InfoBoardDTO> list = sqlSession.selectList("info_listBoardAll");
		
		if(list.size()>10 && page != 1) {
			 list.subList(0, 10*(page-1)).clear();
			 if(list.size() > 10) {
	            List<InfoBoardDTO> newlist = list.subList(0, 10);
	            list = newlist;
	         }
	      }
	      else if(list.size() > 10 && page == 1) {
	         list.subList(10, list.size()).clear();
	      }
		return list;
	}
	
	//공지 삭제
	public int infoBoard_del(int info_code) {
		return sqlSession.delete("info_deleteBoard", info_code);
	}
	
	//공지 번호로 가져오기
	public InfoBoardDTO infoBoard_getByNum(int info_code) {	
		return sqlSession.selectOne("info_getBoard", info_code);
	}
	
	//공지 조회수 증가
	public int plusReadCount(int info_code) {
		return sqlSession.update("info_plusReadCount", info_code);
	}
	
	//공지 수정
	public int infoBoard_update(InfoBoardDTO dto) {
		return sqlSession.update("info_updateBoard", dto);
	}
	
	//공지 찾기
	public List<InfoBoardDTO> infoBoard_findList(String search, String searchString, String type){
		Map<String, String> params = new HashMap<String, String>();
		params.put("search", search);
		params.put("searchString", "%"+searchString+"%");
		params.put("type", type);
		return sqlSession.selectList("info_findBoard", params);
	}
	
	//공지 갯수 세기
	public int countBoard(String type) {
		return sqlSession.selectOne("info_countBoard", type);
	}
	
	//관리자용 모든 공지 갯수 세기
	public int countBoardAll() {
		return sqlSession.selectOne("info_countBoardAll");
	}
	
	//관리자용 검색 공지 갯수 세기
	public int countBoardSearch(String search, String searchString, String type) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("search", search);
		params.put("searchString", searchString);
		params.put("type", type);
		return sqlSession.selectOne("info_countBoardSearch", params);
	}
	
	//관리자용 최신 인덱스 불러오기
	public int infoGetRecentNum() {
		return sqlSession.selectOne("info_getRecentNum");
	}
	
}
 