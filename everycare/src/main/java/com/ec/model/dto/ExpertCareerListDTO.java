package com.ec.model.dto;

public class ExpertCareerListDTO {
	private Long expert_idx;
	private String career_name;
	private java.sql.Date start_time;
	private java.sql.Date end_time;
	public Long getExpert_idx() {
		return expert_idx;
	}
	public void setExpert_idx(Long expert_idx) {
		this.expert_idx = expert_idx;
	}
	public String getCareer_name() {
		return career_name;
	}
	public void setCareer_name(String career_name) {
		this.career_name = career_name;
	}
	public java.sql.Date getStart_time() {
		return start_time;
	}
	public void setStart_time(java.sql.Date start_time) {
		this.start_time = start_time;
	}
	public java.sql.Date getEnd_time() {
		return end_time;
	}
	public void setEnd_time(java.sql.Date end_time) {
		this.end_time = end_time;
	}
	
	
}
