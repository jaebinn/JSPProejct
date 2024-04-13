package com.ec.model.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.ec.model.dto.Like_cntDTO;
import com.ec.mybatis.SQLMapConfig;

public class Like_cntDAO {
	private SqlSession ss;
	
	public Like_cntDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}

	public void updateIsLike(Long expert_idx, String user_id, String likeStatus) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("expert_idx", expert_idx);
		datas.put("user_id", user_id);
		datas.put("likeStatus", likeStatus);
		ss.insert("Like.insert",datas);
	}
	public void updateTotalCnt(Long expert_idx, Long totalCnt) {
		HashMap<String, Long> datas = new HashMap<>();
		datas.put("expert_idx", expert_idx);
		datas.put("totalCnt", totalCnt);
        
        ss.update("Like.updateTotalCnt", datas);
	}

	public boolean isExpertLike(String user_id, Long expert_idx) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("user_id", user_id);
		datas.put("expert_idx", expert_idx);
		return (Integer)ss.selectOne("Like.isLike",datas) == 1; 
	}

}