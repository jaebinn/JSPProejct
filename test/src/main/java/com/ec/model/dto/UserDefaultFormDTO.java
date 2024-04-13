package com.ec.model.dto;


public class UserDefaultFormDTO {
	private String existing_user_id;
	private String modified_user_id;
	private String name;
	private String gender;
	private String birth;
	
	public UserDefaultFormDTO(String existing_user_id, String modified_user_id, String name, String gender, String birth) {
		this.existing_user_id = existing_user_id;
		this.modified_user_id = modified_user_id;
		this.name = name;
		this.gender = gender;
		this.birth = birth;
	}

	public UserDefaultFormDTO() {}

	public String getExisting_user_id() {
		return existing_user_id;
	}

	public String getModified_user_id() {
		return modified_user_id;
	}

	public String getName() {
		return name;
	}

	public String getGender() {
		return gender;
	}
	
	public String getBirth() {
		return birth;
	}

	public void setExisting_user_id(String existing_user_id) {
		this.existing_user_id = existing_user_id;
	}

	public void setModified_user_id(String modified_user_id) {
		this.modified_user_id = modified_user_id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public void setBirth(String birth) {
		this.birth = birth;
	}
}
