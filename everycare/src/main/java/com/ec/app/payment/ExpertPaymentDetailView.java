package com.ec.app.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.model.dao.PaymentDAO;
import com.ec.model.dao.UserDAO;
import com.ec.model.dto.PaymentDTO;
import com.ec.model.dto.UserDTO;
import com.ec.action.Action;
import com.ec.action.Transfer;

public class ExpertPaymentDetailView implements Action{
   @Override
   public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      long payment_idx = Long.parseLong(req.getParameter("payment_idx"));
      
      System.out.println("확인");
      PaymentDAO pdao = new PaymentDAO();
      
      PaymentDTO payment = pdao.getPaymentDetail(payment_idx);
      
      String user_id = payment.getUser_id();
      UserDAO udao = new UserDAO();
      UserDTO user = udao.getUserById(user_id);
      String user_name = user.getName();
      
      req.setAttribute("user_name", user_name);
      req.setAttribute("payment", payment);
      
      Transfer transfer = new Transfer();
      transfer.setRedirect(false);
      transfer.setPath("/app/payment/expertPaymentDetail.jsp");
      return transfer;
   }
}