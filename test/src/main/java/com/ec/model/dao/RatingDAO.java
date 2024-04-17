package com.ec.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.ec.mybatis.SQLMapConfig;

public class RatingDAO {
	private SqlSession ss;
	public RatingDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}
	public Long getExpertRatingScore(Long expert_idx) {
		return ss.selectOne("Expert.totalScore", expert_idx);
	}
	public int getExpertCntByRatingUser(Long expert_idx) {
		return ss.selectOne("Expert.getExpertCntByRatingUser", expert_idx);
	}
	
	
}
