package com.ec.app.payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Transfer;

public class PaymentFrontController extends HttpServlet {
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
		case "/paymentInfo.pm":
			try {
				transfer = new PaymentInfoOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/paymentInfo.pm : " + e);
			}
			break;
		case "/getpaymentlist.pm" :		
			try {
				transfer = new PaymentListOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/getpaymentlist.pm : "+e);
			}
			break;
		case "/paymentDetailView.pm":
	         try {
	            transfer = new PaymentDetailViewOkAction().execute(req,resp);
	         } catch (Exception e) {
	            System.out.println("/paymentDetailView.pm : "+e);
	         }
	         break;
		   case "/getexpertPaymentlist.pm" :      
		         try {
		            transfer = new GetExpertPaymentlist().execute(req, resp);
		         } catch (Exception e) {
		            System.out.println("/getexpertPaymentlist.pm : "+e);
		         }
		         break;
		      case "/expertPaymentDetailView.pm":
		            try {
		               transfer = new ExpertPaymentDetailView().execute(req,resp);
		            } catch (Exception e) {
		               System.out.println("/expertPaymentDetailView.pm : "+e);
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



