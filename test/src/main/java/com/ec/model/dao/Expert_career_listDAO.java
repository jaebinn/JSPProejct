package com.ec.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ec.model.dto.ExpertCareerListDTO;
import com.ec.model.dto.ExpertCareerListUpdateDTO;
import com.ec.mybatis.SQLMapConfig;

public class Expert_career_listDAO {
	private SqlSession ss;
	
	public Expert_career_listDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}
	public boolean insertExpert_career_list(ExpertCareerListDTO expertcareer) {
		return ss.insert("Expert_career_list.insert",expertcareer) == 1;
	}
	
	// Expertinfo.jsp
	// 트랜잭션
	//경력 리스트로 뽑아오기
	public List<ExpertCareerListDTO> getCareerList(SqlSession tsss, Long expert_idx) {
		return tsss.selectList("Expert_career_list.getRowsListByIdx", expert_idx);
	}
	//경력 create
	public boolean createCareer(SqlSession tsss, ExpertCareerListUpdateDTO edto) {
		return 1 == tsss.insert("Expert_career_list.insertRow", edto);
	}
	//경력 update
	public boolean updateCareer(SqlSession tsss, ExpertCareerListUpdateDTO edto) {
		return 1 == tsss.update("Expert_career_list.updateRow", edto);
	}
	//경력 update - career_name은 유지
	public boolean updateCareerButNotName(SqlSession tsss, ExpertCareerListUpdateDTO edto) {
		return 1 == tsss.update("Expert_career_list.updateRowButNotName", edto);
	}
	//경력 delete
	public boolean deleteCareer(SqlSession tsss, ExpertCareerListUpdateDTO edto) {
		return 1 == tsss.delete("Expert_career_list.deleteRow", edto);
	}
}
