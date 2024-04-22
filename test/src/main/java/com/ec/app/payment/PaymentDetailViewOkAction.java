package com.ec.app.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.model.dao.PaymentDAO;
import com.ec.model.dto.PaymentDTO;
import com.ec.action.Action;
import com.ec.action.Transfer;

public class PaymentDetailViewOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		long payment_idx = Long.parseLong(req.getParameter("payment_idx"));
		
		System.out.println("확인");
		PaymentDAO pdao = new PaymentDAO();
		
		PaymentDTO payment = pdao.getPaymentDetail(payment_idx);
		 	
		req.setAttribute("payment", payment);
		
		Transfer transfer = new Transfer();
		transfer.setRedirect(false);
		transfer.setPath("/app/payment/paymentDetail.jsp");
		return transfer;
	}
}
