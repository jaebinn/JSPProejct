package com.ec.model.dto;

public class RatingDTO {
	private Long star_idx;
	private String user_id;
	private Long expert_idx;
	private double star_score;
	
	public Long getStar_idx() {
		return star_idx;
	}
	public void setStar_idx(Long star_idx) {
		this.star_idx = star_idx;
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
	public double getStar_score() {
		return star_score;
	}
	public void setStar_score(Long star_score) {
		this.star_score = star_score;
	}
	
	
}
