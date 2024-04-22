package com.ec.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ec.model.dto.ReviewDTO;
import com.ec.mybatis.SQLMapConfig;

public class ReviewDAO {

	private SqlSession ss;

	public ReviewDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}

	public long getReviewCnt() {
		return ss.selectOne("Review.getReviewCnt");
	}

	public List<ReviewDTO> getList(int startRow, int pageSize) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		return ss.selectList("Review.getList", datas);
	}
	public List<ReviewDTO> getReviews() {
		return ss.selectList("Review.selectReviews");
	}
	public boolean insertReview(ReviewDTO review) {

		return ss.insert("Review.insert", review) == 1;
	}

	public long getLastNum(String user_id) {
		return ss.selectOne("Review.getLastNum", user_id);
	}

	public boolean deleteReview(long review_idx) {
		return ss.delete("Review.delete", review_idx) == 1;
	}

	public boolean updateReview(ReviewDTO review) {
		return ss.update("Review.update", review) == 1;
	}
	public Long getExpertRatingScore(Long expert_idx) {
		return ss.selectOne("Expert.totalScore", expert_idx);
	}
	public int getExpertCntByRatingUser(Long expert_idx) {
		return ss.selectOne("Expert.getExpertCntByRatingUser", expert_idx);
	}

	
}
