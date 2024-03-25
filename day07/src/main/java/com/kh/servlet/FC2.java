package com.kh.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FC2 extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		
//		contextPath+"/test"+"/???" 라는 형태
		System.out.println(requestURI);

//		앞에 동일하게 붙는 무의미한 문자열은 잘라내기
		String command = requestURI.substring(contextPath.length()+5);
		
//		추출된 command는 어떤 로직을 수행해야 하는지 구별할 수 있게 해주는 서로 다른 문자열
		System.out.println(command);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
