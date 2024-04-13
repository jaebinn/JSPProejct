package com.ec.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.ec.model.dto.ExpertLicenseListDTO;
import com.ec.mybatis.SQLMapConfig;

public class Expert_license_listDAO {
	private SqlSession ss;
	
	public Expert_license_listDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}
	public boolean insertExpert_license_list(ExpertLicenseListDTO expertlicense) {
		return ss.insert("Expert_license_list.insert",expertlicense) == 1;
	}
}
