package com.ec.model.dto;

public class ExpertLicenseListUpdateDTO {
	private Long expert_idx;
	private String license_name;
	private String new_license_name;
	private java.sql.Date acquire_date;
	
	public String getLicense_name() {
		return license_name;
	}
	public void setLicense_name(String license_name) {
		this.license_name = license_name;
	}
	public java.sql.Date getAcquire_date() {
		return acquire_date;
	}
	public void setAcquire_date(java.sql.Date acquire_date) {
		this.acquire_date = acquire_date;
	}
	public Long getExpert_idx() {
		return expert_idx;
	}
	public void setExpert_idx(Long expert_idx) {
		this.expert_idx = expert_idx;
	}
	public String getNew_license_name() {
		return new_license_name;
	}
	public void setNew_license_name(String new_license_name) {
		this.new_license_name = new_license_name;
	}
}
