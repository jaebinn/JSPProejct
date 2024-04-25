package com.ec.action;

public class Transfer {
	//어디로 이동할 것인지
	private String path;
	//true : redirect 방식 / false : forward 방식
	private boolean isRedirect;
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
}
