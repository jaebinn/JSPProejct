package com.ec.model.dto;

public class ExpertDTO {
	private long expert_idx;
	private String user_id;
	private String resume;
	private boolean is_drivable;
	private String location;
	private String keyword_list;
	private String available_time;
	private int cost;
	private String account;
	private String name;
	private int age;
	private String career_name;
	
	public long getExpert_idx() {
		return expert_idx;
	}
	public void setExpert_idx(long expert_idx) {
		this.expert_idx = expert_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	public boolean isIs_drivable() {
		return is_drivable;
	}
	public void setIs_drivable(boolean is_drivable) {
		this.is_drivable = is_drivable;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getKeyword_list() {
		return keyword_list;
	}
	public void setKeyword_list(String keyword_list) {
		this.keyword_list = keyword_list;
	}
	public String getAvailable_time() {
		return available_time;
	}
	public void setAvailable_time(String available_time) {
		this.available_time = available_time;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getCareer_name() {
		return career_name;
	}
	public void setCareer_name(String career_name) {
		this.career_name = career_name;
	}
	
}
