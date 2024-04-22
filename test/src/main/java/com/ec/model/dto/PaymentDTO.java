package com.ec.model.dto;

public class PaymentDTO {
	private long payment_idx;
	private String user_id;
	private long expert_idx;
	private String expert_name;
	private String service_day;
	private String start_date;
	private String end_date;
	private String keyword;
	private String req;
	private int pay;
	private String tel_mobile;
	
	public long getPayment_idx() {
		return payment_idx;
	}
	public void setPayment_idx(long payment_idx) {
		this.payment_idx = payment_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public String getService_day() {
		return service_day;
	}
	public void setService_day(String service_day) {
		this.service_day = service_day;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getReq() {
		return req;
	}
	public void setReq(String req) {
		this.req = req;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public String getTel_mobile() {
		return tel_mobile;
	}
	public void setTel_mobile(String tel_mobile) {
		this.tel_mobile = tel_mobile;
	}
	
	
}
