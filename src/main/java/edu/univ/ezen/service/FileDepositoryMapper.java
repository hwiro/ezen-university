package edu.univ.ezen.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.univ.ezen.dto.FileDepositoryDTO;

@Service
public class FileDepositoryMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int fileInsert(FileDepositoryDTO dto) {
		return sqlSession.insert("fileInsert", dto);
	}
	public int fileDelete(int num) {
		return sqlSession.delete("fileDelete", num);
	}
	public int fileUpdate(FileDepositoryDTO dto) {
		return sqlSession.update("fileUpdate", dto);
	}
	public List<FileDepositoryDTO> getFile(Map<String, Object> params) {
		return sqlSession.selectList("getFile", params);
	}
}
