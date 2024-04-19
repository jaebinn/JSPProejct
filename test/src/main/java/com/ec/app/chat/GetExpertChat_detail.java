package com.ec.app.chat;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ChatDAO;
import com.ec.model.dto.Chat_detailDTO;
import com.google.gson.Gson;

public class GetExpertChat_detail implements Action{
   @Override
   public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      long chat_idx = Long.parseLong(req.getParameter("chat_idx"));
      ChatDAO cdao = new ChatDAO();
      List<Chat_detailDTO> list = null;
      list = cdao.getChatDetail(chat_idx);
      if(list != null) {
         Gson gson = new Gson();
         String json = gson.toJson(list);
         
         resp.setContentType("application/json");
         resp.setCharacterEncoding("UTF-8");
         resp.getWriter().write(json);
      }else {
         System.out.println("채팅내역 받아오기 실패");
      }
      return null;
   }
}