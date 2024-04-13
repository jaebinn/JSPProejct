package com.ec.model.dto;

public class UserDTO {
	private String user_id;		//유저 아이디
	private String pw;			//비밀번호
	private String name;		//이름
	private String tel_mobile;	//전화번호
	private String tel_sub;		//보호자 전화번호
	private String email;		//이메일
	private String gender;		//성별
	private String age;			//나이
	private String zipcode;		//우편번호
	private String addr;		//주소
	private String addr_detail;	//상세주소
	private String addr_etc;	//기타사항(주소)
	private String user_etc;	//유저의 특이사항(질병, 불편한 곳 등)
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	public String getAddr_etc() {
		return addr_etc;
	}
	public void setAddr_etc(String addr_etc) {
		this.addr_etc = addr_etc;
	}
	
	public String getTel_mobile() {
		return tel_mobile;
	}
	public void setTel_mobile(String tel_mobile) {
		this.tel_mobile = tel_mobile;
	}
	public String getTel_sub() {
		return tel_sub;
	}
	public void setTel_sub(String tel_sub) {
		this.tel_sub = tel_sub;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getUser_etc() {
		return user_etc;
	}
	public void setUser_etc(String user_etc) {
		this.user_etc = user_etc;
	}
	
}
