package com.ec.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.ec.model.dto.ExpertCareerListDTO;
import com.ec.mybatis.SQLMapConfig;

public class Expert_career_listDAO {
	private SqlSession ss;
	
	public Expert_career_listDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}
	public boolean insertExpert_career_list(ExpertCareerListDTO expertcareer) {
		return ss.insert("Expert_career_list.insert",expertcareer) == 1;
	}
}
