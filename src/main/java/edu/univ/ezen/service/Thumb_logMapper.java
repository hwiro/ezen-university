package edu.univ.ezen.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.univ.ezen.dto.Thumb_logDTO;

@Service
public class Thumb_logMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int thumblog_Insert(Thumb_logDTO tdto) {
		return sqlSession.insert("thumblog_Insert", tdto);
	}
	
	public Thumb_logDTO thumblog_getlog(int code, String id) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("code", code);
		param.put("id", id);
		return sqlSession.selectOne("thumblog_getlog", param);
	}
	
	public int thumblog_delPost(int code) {
		return sqlSession.delete("thumblog_delPost", code);
	}
}
