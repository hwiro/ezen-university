package edu.univ.ezen.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.univ.ezen.dto.BookRentDTO;

@Service
public class BookRentMapper {

	@Autowired
	private SqlSession sqlSession;
	//책 대여 기능
	public int insertRent(BookRentDTO dto) {
		return sqlSession.insert("insertRent", dto);
	}
	
	public List<BookRentDTO> listRentPersonal(String student_id){
		return sqlSession.selectList("listRentPersonal", student_id);
	}
	
	public List<BookRentDTO> listRent(){
		return sqlSession.selectList("listRent");
	}
	
	public int deleteRent(String book_id) {
		return sqlSession.delete("deleteRent", book_id);
	}
	
	public List<BookRentDTO> getStu(String student_id) {
		return sqlSession.selectList("getStu_rent", student_id);
	}
	
	public BookRentDTO getBook(String book_id) {
		return sqlSession.selectOne("getBook_rent", book_id);
	}
	
}
