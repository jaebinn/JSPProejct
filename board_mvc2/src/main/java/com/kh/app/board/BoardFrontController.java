package com.kh.app.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.action.Transfer;
import com.mysql.cj.Session;

public class BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doProcess(req, resp);
	}
	
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//길 나누는 코드
		String requestURI = req.getRequestURI();// ???/userjoin.us
		String contextPath = req.getContextPath(); // ???
		String command = requestURI.substring(contextPath.length());
		
		System.out.println(command);

		Transfer transfer = null;
		switch(command) {
		case "/boardlist.bo":
			try {
				transfer = new BoardListOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/boardlist.bo : "+e);
			}
			break;
//		case "boardlistok.bo":
		case "/boardwrite.bo":
			transfer = new Transfer();
			transfer.setRedirect(false);
			transfer.setPath("/app/board/write.jsp");
			break;
		case "/boardwriteok.bo":
			try {
				transfer = new BoardWriteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/boardwriteok.bo : "+e);
			}
			break;
		case "/boardview.bo":
			try {
				transfer = new BoardViewOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/boardview.bo : "+e);
			}
			break;
		case "/boarddelete.bo":
			try {
				transfer = new BoardDeleteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/boarddelete.bo : "+e);
			}
		}
		
		if(transfer != null) {
			if(transfer.isRedirect()) {
				resp.sendRedirect(transfer.getPath());
			}
			else {
				req.getRequestDispatcher(transfer.getPath()).forward(req, resp);
			}
		}
	}
}













