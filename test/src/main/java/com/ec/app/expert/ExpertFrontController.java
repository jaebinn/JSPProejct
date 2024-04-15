package com.ec.app.expert;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Transfer;
import com.ec.model.dao.ExpertDAO;


public class ExpertFrontController extends HttpServlet{
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
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath(); 
		String command = requestURI.substring(contextPath.length());
		
		System.out.println(command);

		Transfer transfer = null;
		switch(command) {
		case "/expertok.ep" :
			try {
				transfer = new ExpertAddOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/expertok.ep : "+e);
			}
			break;
		case "/expertlist.ep":
			try {
				transfer = new ExpertListOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/expertlist.ep : "+e);
			}
			break;
		case "/expertsort.ep":
			try {
				transfer = new ExpertSortOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/expertsort.ep : "+e);
			}
			break;
		case "/expertkeywordsort.ep":
			try {
				transfer = new ExpertkeywordSortOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/expertkeywordsort.ep : "+e);
			}
			break;
		case "/expertview.ep":
			try {
				transfer = new ExpertViewOkAction().execute(req, resp);
			} catch(Exception e) {
				System.out.println("/expertview.ep : "+e);
			}
			break;
		case "/expertlikecnt.ep":
			try {
				new ExpertLikeCntOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/expertlikecnt.ep : "+e);
			}
			break;
		case "/getexpertinfo.ep":
			try {
				new ExpertGetInfoOkAction().execute(req, resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
