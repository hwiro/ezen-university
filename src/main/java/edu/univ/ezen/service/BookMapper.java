package edu.univ.ezen.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.univ.ezen.dto.BookDTO;

@Service
public class BookMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertBook(BookDTO bdto) {
		return sqlSession.insert("insertBook", bdto);
	}
	
	public List<BookDTO> listBook(int page) {
		List<BookDTO> list = sqlSession.selectList("listBook");
		
		if(list.size() > 10 && page != 1) {
			list.subList(0, 10*(page-1)).clear();
			if(list.size() > 10) {
				List<BookDTO> newlist = list.subList(0, 10);
				list = newlist;
			}
		}
		else if(list.size() > 10 && page == 1) {
			list.subList(10, list.size()).clear();
		}
		
		return list;
	}
	
	public List<BookDTO> listBook_Image(){
		List<BookDTO> list = sqlSession.selectList("listBookImage");
		return list;
	}
	
	public List<BookDTO> listBookImage_getGenre(String genre){
		List<BookDTO> list = sqlSession.selectList("listBookImage_getGenre", genre);
		return list;
	}
	
	public int plusReadCount(String book_id) {
		return sqlSession.update("book_plusReadCount", book_id);
	}
	
	public int editBook(BookDTO bdto) {
		return sqlSession.update("editBook", bdto);
	}
	
	public int deleteBook(String book_id) {
		return sqlSession.delete("deleteBook", book_id);
	}
	
	public BookDTO getBook(String book_id) {
		return sqlSession.selectOne("getBook", book_id);
	}
	
	public List<BookDTO> findBook(Map<String,String> params){
		return sqlSession.selectList("findBook", params);
	}
	
	public int countBook() {
		return sqlSession.selectOne("countBook");
	}
	
}
