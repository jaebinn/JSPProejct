package com.ec.model.dto;

public class ReviewDTO {
	private long review_idx;
	private String user_id;
	private String name;
	private String title;
	private String detail;
	private long expert_idx;
	private int star;
	private String regdate;
	private String expert_name;
	

	public long getReview_idx() {
		return review_idx;
	}

	public void setReview_idx(long review_idx) {
		this.review_idx = review_idx;
	}


	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getExpert_idx() {
		return expert_idx;
	}

	public void setExpert_idx(long expert_idx) {
		this.expert_idx = expert_idx;
	}

	public String getExpert_name() {
		return expert_name;
	}

	public void setExpert_name(String expert_name) {
		this.expert_name = expert_name;
	}
	
	

}
