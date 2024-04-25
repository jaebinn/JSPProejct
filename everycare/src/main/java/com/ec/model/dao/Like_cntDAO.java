package com.ec.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ec.model.dto.ExpertDTO;
import com.ec.model.dto.Like_cntDTO;
import com.ec.mybatis.SQLMapConfig;

public class Like_cntDAO {
	private SqlSession ss;
	
	public Like_cntDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}

	public void insertIsLike(Long expert_idx, String user_id, String likeStatus) {
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
	    // SQL 쿼리에서 사용할 맵 객체 생성
	    Map<String, Object> params = new HashMap<>();
	    params.put("user_id", user_id);
	    params.put("expert_idx", expert_idx);
	    
	    // SQL 쿼리를 실행하여 결과를 가져옴
	    int count = ss.selectOne("Like.isExpertLike", params);
	    
	    // 결과를 기반으로 좋아요 여부를 반환
	    return count > 0; // count가 0보다 크면 true, 아니면 false
	}

	public boolean deleteIsLike(String user_id, Long expert_idx) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("user_id", user_id);
		datas.put("expert_idx", expert_idx);
		return ss.insert("Like.delete",datas) == 1;
	}

//	public List<Integer> getLikedExperts(String user_id) {
//        return ss.selectList("Like.getLikedExperts", user_id);
//    }

	public Like_cntDTO getLikeInfo(String user_id, Long expert_idx) {
		HashMap<String,Object> datas = new HashMap<String, Object>();
		datas.put("user_id", user_id);
		datas.put("expert_idx", expert_idx);	
		return ss.selectOne("Like.getLike", datas);
	}




}