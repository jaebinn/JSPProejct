package com.ec.app.chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ChatDAO;
import com.ec.model.dto.Chat_detailDTO;

public class ExpertSendMsg implements Action{
   @Override
   public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      long chat_idx = Long.parseLong(req.getParameter("chat_idx"));
      String contents = req.getParameter("contents");
      ChatDAO cdao = new ChatDAO();
      String type = "e";
      Chat_detailDTO chat_detail = new Chat_detailDTO();
      chat_detail.setChat_idx(chat_idx);
      chat_detail.setContents(contents);
      chat_detail.setType(type);
      String respText = "";
      if(cdao.insertchat_detail(chat_detail)) {
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