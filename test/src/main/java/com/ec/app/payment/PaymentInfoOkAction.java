package com.ec.app.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;

public class PaymentInfoOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String serviceDay = req.getParameter("serviceDay");
		String startTime = req.getParameter("startTime");
		String endTime = req.getParameter("endTime");
		String user_request = req.getParameter("req");
		
    	String expert_name = req.getParameter("expert_name");

   		String select_keyword = req.getParameter("select_keyword");

       	int pay = Integer.parseInt(req.getParameter("pay"));
		System.out.println(serviceDay);
		System.out.println(startTime);
		System.out.println(endTime);
		System.out.println(user_request);
		System.out.println(expert_name);
		System.out.println(select_keyword);
		System.out.println(pay);
		
		return null;
	}
}
