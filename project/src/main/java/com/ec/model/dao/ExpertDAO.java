package com.ec.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ec.model.dto.ExpertDTO;
import com.ec.model.dto.UserDTO;
import com.ec.mybatis.SQLMapConfig;

public class ExpertDAO {
	private SqlSession ss;
	
	public ExpertDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}
	
	public boolean insertUser(ExpertDTO expert) {
		return ss.insert("Expert.insert",expert) == 1;
	}

	public ExpertDTO getExpertById(long expert_id) {
		return ss.selectOne("Expert.getExpertById",expert_id);
	}

	public long getExpertCnt() {
		return ss.selectOne("Expert.getExpertCnt");
	}

	public List<ExpertDTO> getList(int startRow, int pageSize) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		return ss.selectList("Expert.getList",datas);
	}

	public boolean increaseLikeCount(Long expert_idx) {
		return ss.update("Expert.updateLikeCnt", expert_idx) == 1;
	}

	public List<ExpertDTO> getExpertSortByLike(int startRow, int pageSize) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		return ss.selectList("Expert.getExpertSortByLike", datas);
	}
	public List<ExpertDTO> getExpertSortByLowCost(int startRow, int pageSize) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		return ss.selectList("Expert.getExpertSortByLowCost", datas);
	}
	
	public List<ExpertDTO> getExpertSortByHighCost(int startRow, int pageSize) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		return ss.selectList("Expert.getExpertSortByHighCost", datas);
	}
	
	

}