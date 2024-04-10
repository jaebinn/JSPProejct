package com.ec.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.ec.mybatis.SQLMapConfig;

public class DAO {
private SqlSession ss;
	
	public UserDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}
	
	
}

