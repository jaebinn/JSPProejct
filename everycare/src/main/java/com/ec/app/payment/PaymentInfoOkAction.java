package com.ec.app.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ExpertDAO;
import com.ec.model.dao.PaymentDAO;
import com.ec.model.dto.PaymentDTO;

public class PaymentInfoOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Long payment_idx = Long.parseLong(req.getParameter("payment_idx"));
		HttpSession session = req.getSession();
        String user_id = (String) session.getAttribute("loginUser");
		String serviceDay = req.getParameter("serviceDay");
		String startTime = req.getParameter("startTime");
		String endTime = req.getParameter("endTime");
		String user_request = req.getParameter("req");
		
    	String expert_name = req.getParameter("expert_name");

   		String select_keyword = req.getParameter("select_keyword");

       	int pay = Integer.parseInt(req.getParameter("pay"));
       	ExpertDAO edao = new ExpertDAO();
		
		PaymentDTO payment = new PaymentDTO();
		payment.setPayment_idx(payment_idx);
		payment.setUser_id(user_id);
		payment.setExpert_idx(edao.getExpertIdxByName(expert_name));
		payment.setExpert_name(expert_name);
		payment.setService_day(serviceDay);
		payment.setStart_date(startTime);
		payment.setEnd_date(endTime);
		payment.setKeyword(select_keyword);
		payment.setReq(user_request);
		payment.setPay(pay);
		
		PaymentDAO pdao = new PaymentDAO();
		
		if(pdao.insertPayInfo(payment)){
			req.setAttribute("payment", payment);
		}
		else {
			System.out.println("삽입 실패...");
		}

		return null;
	}
}
