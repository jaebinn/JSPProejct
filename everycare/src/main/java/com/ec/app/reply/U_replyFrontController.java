package com.ec.app.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Transfer;



public class U_replyFrontController extends HttpServlet {
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
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		System.out.println(command);

		Transfer transfer = null;
		switch(command) {
		case "/u_replywrite.ur":
			try {
				 transfer = new U_replyWriteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/u_replywrite.rp : "+e);
			}
			break;
		case "/u_replydelete.ur":
			try {
				new U_replyDeleteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/u_replydelete.rp : "+e);
			}
			break;
		case "/u_replyupdate.ur":
			try {
				new U_replyUpdateOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/u_replyupdate.rp : "+e);
			}
			break;
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













