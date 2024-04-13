package com.ec.model.dto;

public class U_boardDTO {
	private long board_idx;
	private String title;
	private String contents;
	private String regdate;
	private String updatetdate;
	private int readcount;
	private String user_id;
	private String name;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(long board_idx) {
		this.board_idx = board_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getUpdatetdate() {
		return updatetdate;
	}
	public void setUpdatetdate(String updatetdate) {
		this.updatetdate = updatetdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	
}
