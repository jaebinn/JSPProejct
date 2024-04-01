package com.kh.model.dto;

public class ReplyDTO {
	private long replynum;
	private String replycontents;
	private String regdate;
	private String updatechk;
	private String userid;
	private long boardnum;
	
	public long getReplynum() {
		return replynum;
	}
	public void setReplynum(long replynum) {
		this.replynum = replynum;
	}
	public String getReplycontents() {
		return replycontents;
	}
	public void setReplycontents(String replycontents) {
		this.replycontents = replycontents;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getUpdatechk() {
		return updatechk;
	}
	public void setUpdatechk(String updatechk) {
		this.updatechk = updatechk;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public long getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(long boardnum) {
		this.boardnum = boardnum;
	}
}
