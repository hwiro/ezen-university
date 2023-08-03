package edu.univ.ezen.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.univ.ezen.dto.EmailConfirmDTO;

@Service
public class EmailCheckMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertEmailConfirm(EmailConfirmDTO ecdto) {
		return sqlSession.insert("insertEmailConfirm", ecdto);
	}
	
	public List<EmailConfirmDTO> getEmailConfirm(String email) {
		return sqlSession.selectList("getEmailConfirm", email);
	}
	
	public boolean getEmailConfirmCheck(String fcode, String bcode) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("fcode", fcode);
		param.put("bcode", bcode);
		List<EmailConfirmDTO> list = sqlSession.selectList("getEmailConfirmCheck", param);
		if(list != null && list.size() != 0) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public int okEmailConfirm(String fcode, String bcode) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("fcode", fcode);
		param.put("bcode", bcode);
		int res = sqlSession.update("okEmailConfirm", param);
		sqlSession.clearCache();
		return res;
	}
	
	public int delCheckedEmail(String fcode, String bcode) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("fcode", fcode);
		param.put("bcode", bcode);
		int res = sqlSession.delete("delCheckedEmail", param);
		sqlSession.clearCache();
		return res;
	}
	
	public int expiredConfirm() {
		return sqlSession.selectOne("expiredConfirm");
	}
	
	public int delExpiredConfirm() {
		return sqlSession.delete("delExpiredConfirm");
	}
}
