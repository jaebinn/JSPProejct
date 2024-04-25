package com.ec.app.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Transfer;

public class ReviewFrontController extends HttpServlet {
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

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());

		System.out.println(command);
		Transfer transfer = null;
		switch (command) {
		case "/reviewlist.rf":
			try {
				transfer = new ReviewListOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/reviewlist.rf : " + e);
			}
			break;
		case "/reviewwrite.rf":
			try {
				transfer = new ReviewWriteOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/reviewwrite.rf : " + e);
			}
			break;
		case "/reviewdelete.rf":
			try {
				transfer = new ReviewDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/reviewdelete.rf : " + e);
			}
			break;
		case "/reviewupdate.rf":
			try {
				transfer = new ReviewUpdateOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/reviewupdate.rf : " + e);
			}
			break;
		case "/getreviews.rf":
			try {
				transfer = new ReviewsGetOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/getreviews.rf : " + e);
			}
			break;
		case "/review.rf":
			try {
				transfer = new ReviewUpdateOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/reviewupdate.rf : " + e);
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



