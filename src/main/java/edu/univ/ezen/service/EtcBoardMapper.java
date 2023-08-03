package edu.univ.ezen.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.univ.ezen.dto.EtcBoardDTO;
import edu.univ.ezen.dto.EtcBoardReplyDTO;
import edu.univ.ezen.dto.UserBlacklistDTO;

@Service
public class EtcBoardMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	//글 등록
	public int etcBoard_insert(EtcBoardDTO dto) {
		return sqlSession.insert("EtcinsertBoard", dto);
	}
	
	//일반 글 갯수 카운트
	public int etcBoard_listcount() {
		return sqlSession.selectOne("EtcCountBoard");
	}
	
	//개념 글 갯수 카운트
	public int etcBoard_listcount_best() {
		return sqlSession.selectOne("EtcCountBoardThumb");
	}
	
	//검색 글 갯수 카운트
	public int etcBoard_listcount_search(String search, String searchString) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("search", search);
		param.put("searchString", searchString);
		return sqlSession.selectOne("EtcCountBoardFind", param);
	}
	
	//글 목록 불러오기
	public List<EtcBoardDTO> etcBoard_list(int page){
		List<EtcBoardDTO> list = sqlSession.selectList("listEtcBoard");
		
		if(list.size() > 20 && page != 1) {
			list.subList(0, 20*(page-1)).clear();
			if(list.size() > 20) {
				List<EtcBoardDTO> newlist = list.subList(0, 20);
				list = newlist;
			}
		}
		else if(list.size() > 20 && page == 1) {
			list.subList(20, list.size()).clear();
		}
		
		return list;
	}
	
	//thumb(추천수)가 10 이상인 값들만 불러오기
	public List<EtcBoardDTO> etcBoard_list_best(int page) {
		List<EtcBoardDTO> list = sqlSession.selectList("listEtcBoardThumb");
		
		if(list.size() > 10 && page != 1) {
			list.subList(0, 10*(page-1)).clear();
			if(list.size() > 10) {
				List<EtcBoardDTO> newlist = list.subList(0, 10);
				list = newlist;
			}
		}
		else if(list.size() > 10 && page == 1) {
			list.subList(10, list.size()).clear();
		}
		
		return list;
	}
	
	//글 삭제
	public int etcBoard_del(int etc_board_code) {
		return sqlSession.delete("EtcdeleteBoard", etc_board_code);
	}
	
	//글 코드로 글 내용 가져오기
	public EtcBoardDTO etcboard_getByNum(int etc_board_code) {
		return sqlSession.selectOne("getEtcBoard", etc_board_code);
	}
	
	//조회수 +1
	public int plusReadCount(int etc_board_code) {
		return sqlSession.update("EtcplusReadCount", etc_board_code);
	}
	
	//추천수 +1
	public int plusThumb(int etc_board_code) {
		return sqlSession.update("EtcplusThumb", etc_board_code);
	}
	
	//글 수정
	public int etcBoard_update(EtcBoardDTO dto) {
		return sqlSession.update("EtcupdateBoard",	dto);
	}
	
	//글 찾기
	public List<EtcBoardDTO> etcBoard_findList(String search, String searchString){
		Map<String, String> param = new HashMap<String, String>();
		param.put("search", search);
		param.put("searchString", searchString);
		return sqlSession.selectList("EtcfindBoard", param);
	}
	
	//댓글 등록
	public int etcBoardRe_insert(EtcBoardReplyDTO dto) {
		return sqlSession.insert("EtcinsertReply", dto);
	}
	
	//댓글 삭제
	public int etcBoardRe_delete(int etc_board_reply_code) {
		return sqlSession.delete("EtcdeleteReply", etc_board_reply_code);
	}
	
	//글 삭제로 인한 댓글 삭제
	public int etcBoardRe_deleteAll(int ref_group) {
		return sqlSession.delete("EtcdeleteReplyAll", ref_group);
	}
	
	//댓글 수정
	public int etcBoardRe_update(EtcBoardReplyDTO dto) {
		return sqlSession.update("EtcupdateReply", dto);
	}
	
	//댓글 목록 뽑기
	public List<EtcBoardReplyDTO> etcBoardRe_list(int ref_group){
		return sqlSession.selectList("listEtcReply", ref_group);
	}
	
	//댓글 갯수 뽑기
	public int etcBoardRe_listCount(int ref_group){
		return sqlSession.selectOne("countEtcReply", ref_group);
	}
	
	//유저 차단하기
	public int insertBlacklist(UserBlacklistDTO ubdto) {
		return sqlSession.insert("insertBlacklist", ubdto);
	}
	
	//차단한 유저 가져오기
	public UserBlacklistDTO getBlacklist(String student_id) {
		return sqlSession.selectOne("getBlacklist");
	}
	
	//차단한 유저 목록
	public List<UserBlacklistDTO> getBlacklistAll() {
		return sqlSession.selectList("getBlacklistAll");
	}
	
	//유저 차단 해제
	public int delBlacklist(String student_id) {
		return sqlSession.delete("delBlacklist", student_id);
	}
}
