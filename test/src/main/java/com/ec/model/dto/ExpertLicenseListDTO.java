package com.ec.model.dto;

import java.util.Date;

public class ExpertLicenseListDTO {
	
	private Long expert_idx;
	private String license_name;
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
	
	
}
