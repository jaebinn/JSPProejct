package com.ec.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ec.model.dto.U_FileDTO;
import com.ec.mybatis.SQLMapConfig;

public class U_FileDAO {
	private SqlSession ss;
	
	public U_FileDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}

	public boolean insertFile(U_FileDTO fdto) {
		return ss.insert("U_File.insert",fdto) == 1;
	}

	public void deleteFile(String system_name) {
		ss.delete("U_File.delete",system_name);
	}

	public List<U_FileDTO> getFiles(long board_idx) {
		return ss.selectList("U_File.getFiles",board_idx);
	}
	public String getUFiles(Long expert_idx) {
		return ss.selectOne("U_File.getUFiles",expert_idx);
	}
}





