package edu.univ.ezen.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.univ.ezen.dto.AccountAdminDTO;

@Service
public class AccAdminMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertAdmin(AccountAdminDTO aadto) {
		return sqlSession.insert("adminInsert", aadto);
	}
	
	public List<AccountAdminDTO> listAdmin(int page) {
		List<AccountAdminDTO> list = sqlSession.selectList("adminList");
		
		if(list.size() > 10 && page != 1) {
			list.subList(0, 10*(page-1)).clear();
			if(list.size() > 10) {
				List<AccountAdminDTO> newlist = list.subList(0, 10);
				list = newlist;
			}
		}
		else if(list.size() > 10 && page == 1) {
			list.subList(10, list.size()).clear();
		}
		
		return list;
	}
	
	public int updateAdmin(AccountAdminDTO aadto) {
		return sqlSession.update("adminUpdate", aadto);
	}
	
	public int deleteAdmin(String admin_id) {
		return sqlSession.delete("adminDelete", admin_id);
	}
	
	public AccountAdminDTO getAdmin(String admin_id) {
		return sqlSession.selectOne("adminGet", admin_id);
	}
}
