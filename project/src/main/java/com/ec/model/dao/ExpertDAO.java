package com.ec.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.ec.model.dto.ExpertDTO;
import com.ec.mybatis.SQLMapConfig;

public class ExpertDAO {
private SqlSession ss;
	
	public ExpertDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}
	
	public boolean insertUser(ExpertDTO expert) {
		return ss.insert("Expert.insert",expert) == 1;
	}

	public ExpertDTO getExpertById(String expert_id) {
		return ss.selectOne("Expert.select",expert_id);
	}

	public long getExpertList() {
		return ss.selectList("Expert.");
	}
}
