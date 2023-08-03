package edu.univ.ezen.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.univ.ezen.dto.UserNoticeDTO;

@Service
public class UserNoticeMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertUserNotice(UserNoticeDTO undto) {
		return sqlSession.insert("insertUserNotice", undto);
	}
	
	public List<UserNoticeDTO> getUserNotice(String student_id) {
		return sqlSession.selectList("getUserNotice", student_id);
	}
	
	public int deleteUserNotice(String url) {
		return sqlSession.delete("deleteUserNotice", url);
	}
	
	public int deleteUserNotice_getStu(String student_id) {
		return sqlSession.delete("deleteUserNotice_getStu", student_id);
	}
}
