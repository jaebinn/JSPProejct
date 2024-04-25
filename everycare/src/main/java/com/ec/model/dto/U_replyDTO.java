package com.ec.model.dto;

public class U_replyDTO {
	private long u_reply_idx;
	private long board_idx;
	private String user_id;
	private String contents;
	private String updatechk;
	private String regdate;
	private String name;
	private long expert_idx;
	
	public long getU_reply_idx() {
		return u_reply_idx;
	}
	public void setU_reply_idx(long u_reply_idx) {
		this.u_reply_idx = u_reply_idx;
	}
	public long getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(long board_idx) {
		this.board_idx = board_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getUpdatechk() {
		return updatechk;
	}
	public void setUpdatechk(String updatechk) {
		this.updatechk = updatechk;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getExpert_idx() {
		return expert_idx;
	}
	public void setExpert_idx(long expert_idx) {
		this.expert_idx = expert_idx;
	}
	
	
}
