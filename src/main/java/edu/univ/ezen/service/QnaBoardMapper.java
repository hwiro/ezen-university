package edu.univ.ezen.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.univ.ezen.dto.EtcBoardDTO;
import edu.univ.ezen.dto.EtcBoardReplyDTO;
import edu.univ.ezen.dto.QnaBoardDTO;

@Service
public class QnaBoardMapper {
	
	@Autowired
	private SqlSession sqlSession;
		
	//글 목록 불러오기
	public List<QnaBoardDTO> qnaBoard_list(int page){
		List<QnaBoardDTO> list = sqlSession.selectList("listQnaBoard");
		
		if(list.size() > 20 && page != 1) {
			list.subList(0, 20*(page-1)).clear();
			if(list.size() > 20) {
				List<QnaBoardDTO> newlist = list.subList(0, 20);
				list = newlist;
			}
		}
		else if(list.size() > 20 && page == 1) {
			list.subList(20, list.size()).clear();
		}
		
		return list;
	}
	
	//글 목록 불러오기(검색)
	public List<QnaBoardDTO> qnaBoard_listSearch(int page, String search, String searchString){
		Map<String, Object> param = new HashMap<>();
		param.put("search", search);
		param.put("searchString", searchString);
		List<QnaBoardDTO> list = sqlSession.selectList("listQnaBoardSearch", param);
		
		if(list.size() > 20 && page != 1) {
			list.subList(0, 20*(page-1)).clear();
			if(list.size() > 20) {
				List<QnaBoardDTO> newlist = list.subList(0, 20);
				list = newlist;
			}
		}
		else if(list.size() > 20 && page == 1) {
			list.subList(20, list.size()).clear();
		}
		
		return list;
	}
	
	//자주묻는 질문 글 갯수 카운트(검색아님)
	public int qnaBoard_countList() {
		return sqlSession.selectOne("CountQnaBoard");
	}
	
	//자주묻는 질문 글 갯수 카운트(검색)
	public int qnaBoard_countListSearch(String search, String searchString) {
		Map<String, Object> param = new HashMap<>();
		param.put("search", search);
		param.put("searchString", searchString);
		return sqlSession.selectOne("CountQnaBoardSearch", param);
	}
	
	//자주묻는 질문 입력
	public int qnaBoard_insert(QnaBoardDTO qdto) {
		return sqlSession.insert("InsertQnaBoard", qdto);
	}
	
	//자주묻는 질문 삭제
	public int qnaBoard_delete(int qna_code) {
		return sqlSession.delete("DeleteQnaBoard", qna_code);
	}
	
	//질문 가져오기(하나)
	public QnaBoardDTO qnaBoard_get(int qna_code) {
		return sqlSession.selectOne("GetQnaBoard", qna_code);
	}
	
	//질문 수정
	public int qnaBoard_update(QnaBoardDTO qdto) {
		return sqlSession.update("UpdateQnaBoard", qdto);
	}
}
