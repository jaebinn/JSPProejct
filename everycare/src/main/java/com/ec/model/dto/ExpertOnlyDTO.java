package com.ec.model.dto;

public class ExpertOnlyDTO {
	private Long expert_idx;
	private String user_id;
	private String resume;
	private Boolean is_drivable;
	private String location;
	private String keyword_list;
	private String available_time;
	private Integer cost;
	private String account;
	private Long totalCnt;
	
	public Long getExpert_idx() {
		return expert_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getResume() {
		return resume;
	}
	public Boolean getIs_drivable() {
		return is_drivable;
	}
	public String getLocation() {
		return location;
	}
	public String getKeyword_list() {
		return keyword_list;
	}
	public String getAvailable_time() {
		return available_time;
	}
	public Integer getCost() {
		return cost;
	}
	public String getAccount() {
		return account;
	}
	public Long getTotalCnt() {
		return totalCnt;
	}
	public void setExpert_idx(Long expert_idx) {
		this.expert_idx = expert_idx;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	public void setIs_drivable(Boolean is_drivable) {
		this.is_drivable = is_drivable;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public void setKeyword_list(String keyword_list) {
		this.keyword_list = keyword_list;
	}
	public void setAvailable_time(String available_time) {
		this.available_time = available_time;
	}
	public void setCost(Integer cost) {
		this.cost = cost;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public void setTotalCnt(Long totalCnt) {
		this.totalCnt = totalCnt;
	}
}