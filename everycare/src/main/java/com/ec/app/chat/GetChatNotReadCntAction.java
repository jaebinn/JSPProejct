package com.ec.app.chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ChatDAO;


public class GetChatNotReadCntAction implements Action{
   @Override
   public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      long chat_idx = Integer.parseInt(req.getParameter("chat_idx"));
      ChatDAO cdao = new ChatDAO();
      String notReadCnt = cdao.getChatNotReadCnt(chat_idx)+"";
      
      resp.setContentType("text/plain");

      resp.setContentType("text/plain");
      resp.setCharacterEncoding("UTF-8");
      resp.getWriter().write(notReadCnt);
      
      return null;
   }
}