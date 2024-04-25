package com.ec.app.u_board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Transfer;



public class U_boardFrontController extends HttpServlet {
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
		case "/u_boardlist.ub":
			try {
				transfer = new U_boardListOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/u_boardlist.ub : "+e);
			}
			break;
		case "/u_boardwrite.ub":
			try {
				transfer = new U_boardWriteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/u_boardwrite.ub : "+e);
			}
			break;
		case "/u_boardview.ub":
			try {
				transfer = new U_boardViewOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/u_boardview.ub : "+e);
			}
			break;
		case "/filedownload.ub":
			try {
				new FileDownloadAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/filedownload.ub : "+e);
			}
			break;
		case "/u_boarddelete.ub":
			try {
				transfer = new U_boardDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/u_boarddelete.ub : "+e);
			}
			break;
		case "/u_boardupdate.ub":
			try {
				transfer = new U_boardUpdateAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/u_boardupdate.ub : "+e);
			}
			break;
		case "/u_boardupdateok.ub":
			try {
				transfer = new U_boardUpdateOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/u_boardupdateok.ub : "+e);
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













