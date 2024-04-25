package com.ec.app.chat;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ChatDAO;
import com.ec.model.dto.ChatDTO;
import com.google.gson.Gson;

public class ChatListOkAction implements Action{
   @Override
   public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      String user_id = req.getParameter("user_id");
      ChatDAO cdao = new ChatDAO();
      List<ChatDTO> list  = cdao.getChatList(user_id);
      System.out.println(cdao.getChatList(user_id));
      Gson gson = new Gson();
      String json = gson.toJson(list);
      
      resp.setContentType("application/json");
      resp.setCharacterEncoding("UTF-8");
      resp.getWriter().write(json);
      System.out.println(list);
      return null;
   }
}