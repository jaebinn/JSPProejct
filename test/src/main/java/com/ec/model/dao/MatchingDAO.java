package com.ec.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.ec.mybatis.SQLMapConfig;

public class MatchingDAO {
private SqlSession ss;
	
	public MatchingDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}

	public long getMatchingCnt() {
		return ss.selectOne("Matching.matchingCnt");
	}
	
	
}
