package com.ec.app.chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ChatDAO;

public class SendReservation implements Action{
   @Override
   public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      long chat_idx = Long.parseLong(req.getParameter("chat_idx"));
      ChatDAO cdao = new ChatDAO();
      String respText = "";
      if(cdao.sendReservation(chat_idx)) {
         resp.setContentType("text/plain");
         resp.setCharacterEncoding("UTF-8");
         respText = "o";
         resp.getWriter().write(respText);
      }else {
         resp.setContentType("text/plain");
         resp.setCharacterEncoding("UTF-8");
         respText = "x";
         resp.getWriter().write(respText);
      }
      return null;
   }
}