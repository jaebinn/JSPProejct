package com.kh.model.dto;

public class FileDTO {
	private String systemname;
	private String orgname;
	private long boardnum;
	
	public String getSystemname() {
		return systemname;
	}
	public void setSystemname(String systemname) {
		this.systemname = systemname;
	}
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	public long getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(long boardnum) {
		this.boardnum = boardnum;
	}
}
