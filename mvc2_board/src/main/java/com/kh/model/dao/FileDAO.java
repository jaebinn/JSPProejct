package com.kh.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.model.dto.FileDTO;
import com.kh.mybatis.SQLMapConfig;

public class FileDAO {
	private SqlSession ss;
	
	public FileDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}

	public boolean insertFile(FileDTO fdto) {
		return ss.insert("File.insert",fdto) == 1;
	}

	public void deleteFile(String systemname) {
		ss.delete("File.delete",systemname);
	}

	public List<FileDTO> getFiles(long boardnum) {
		return ss.selectList("File.getFiles",boardnum);
	}
}





