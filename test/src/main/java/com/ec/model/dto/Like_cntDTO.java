package com.ec.model.dto;

public class Like_cntDTO {
	private Long likeCnt_idx;
	private String user_id;
	private Long expert_idx;
	private String isLike;
	
	public Long getLikeCnt_idx() {
		return likeCnt_idx;
	}
	public void setLikeCnt_idx(Long likeCnt_idx) {
		this.likeCnt_idx = likeCnt_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Long getExpert_idx() {
		return expert_idx;
	}
	public void setExpert_idx(Long expert_idx) {
		this.expert_idx = expert_idx;
	}
	public String getIsLike() {
		return isLike;
	}
	public void setIsLike(String isLike) {
		this.isLike = isLike;
	}

	
	
}
