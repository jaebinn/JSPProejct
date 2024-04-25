package com.ec.model.dto;

public class Expert_file_indexesDTO {
	
	private String system_name;
	private String original_name;
	private boolean is_license_identification;
	private Long expert_idx;
	
	public String getSystem_name() {
		return system_name;
	}
	public void setSystem_name(String system_name) {
		this.system_name = system_name;
	}
	public String getOriginal_name() {
		return original_name;
	}
	public void setOriginal_name(String original_name) {
		this.original_name = original_name;
	}
	public boolean isIs_license_identification() {
		return is_license_identification;
	}
	public void setIs_license_identification(boolean is_license_identification) {
		this.is_license_identification = is_license_identification;
	}
	public Long getExpert_idx() {
		return expert_idx;
	}
	public void setExpert_idx(Long expert_idx) {
		this.expert_idx = expert_idx;
	}
	
	
}
