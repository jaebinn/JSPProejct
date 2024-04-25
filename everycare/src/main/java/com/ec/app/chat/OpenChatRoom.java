package com.ec.app.chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ChatDAO;
import com.ec.model.dto.ChatDTO;

public class OpenChatRoom implements Action{
   @Override
   public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      String user_id = req.getParameter("user_id");
      long expert_idx = Long.parseLong(req.getParameter("expert_idx"));
      
      ChatDAO cdao = new ChatDAO();
      ChatDTO chat = new ChatDTO();
      chat.setUser_id(user_id);
      chat.setExpert_idx(expert_idx);
      String respText ="";
      if(cdao.openChatRoom(chat)) {
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