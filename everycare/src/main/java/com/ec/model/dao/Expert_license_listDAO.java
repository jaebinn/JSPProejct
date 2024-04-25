package com.ec.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ec.model.dto.ExpertLicenseListDTO;
import com.ec.model.dto.ExpertLicenseListUpdateDTO;
import com.ec.mybatis.SQLMapConfig;

public class Expert_license_listDAO {
	private SqlSession ss;
	
	public Expert_license_listDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}
	public boolean insertExpert_license_list(ExpertLicenseListDTO expertlicense) {
		return ss.insert("Expert_license_list.insert",expertlicense) == 1;
	}
	
	// expertinfo.jsp
	// 트랜잭션
	public List<ExpertLicenseListDTO> getLicenseList(SqlSession tsss, Long expert_idx) {
		return tsss.selectList("Expert_license_list.getRowsListByIdx", expert_idx);
	}
	// 자격증 create
	public boolean createLicense(SqlSession tsss, ExpertLicenseListUpdateDTO dto) {
		return 1 == tsss.insert("Expert_license_list.insertRow", dto);
	}
	// 자격증 update
	public boolean updateLicense(SqlSession tsss, ExpertLicenseListUpdateDTO dto) {
		return 1 == tsss.update("Expert_license_list.updateRow", dto);
	}
	// 자격증 update - name 제외
	public boolean updateLicenseButNotName(SqlSession tsss, ExpertLicenseListUpdateDTO dto) {
		return 1 == tsss.update("Expert_license_list.updateRowButNotName", dto);
	}
	// 자격증 delete
	public boolean deleteLicense(SqlSession tsss, ExpertLicenseListUpdateDTO dto) {
		return 1 == tsss.delete("Expert_license_list.deleteRow", dto);
	}
}
