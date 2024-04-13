package com.ec.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ec.model.dto.ExpertDTO;
import com.ec.mybatis.SQLMapConfig;

public class ExpertDAO {
	private SqlSession ss;
	
	public ExpertDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}
	
	// 전문가 테이블 추가
	public boolean insertExpert(ExpertDTO expert) {
		return ss.insert("Expert.insert",expert) == 1;
	}
		
	// 전문가 테이블에서 아이디를 매개로 정보 찾아오기
	public ExpertDTO expert_info(String user_id) {
		return ss.selectOne("Expert.select",user_id);
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

	public boolean updateLikeCount(long expert_idx, int like_cnt) {
		Map<String, Object> params = new HashMap<>();
	    params.put("expert_idx", expert_idx);
	    params.put("like_cnt", like_cnt);
	    return ss.update("Expert.updateLikeCount", params) == 1;
	}
	
	public List<ExpertDTO> getExpertSortByKeyword(int startRow, int pageSize, String keyword) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		datas.put("keyword", keyword);
	    return ss.selectList("Expert.getExpertSortByKeyword", datas);
	}
	public boolean updateExpertLikeCount(Long expert_idx, int totalCnt) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("expert_idx", expert_idx);
		datas.put("totalCnt", totalCnt);
        return ss.update("Expert.updateExpertLikeCount", datas) == 1;
    }

	

	
}