package com.ec.app.chat;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ChatDAO;
import com.ec.model.dto.Chat_detailDTO;
import com.google.gson.Gson;

public class FetchChatDetailUpdateAction implements Action{
   @Override
   public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      long chat_idx = Long.parseLong(req.getParameter("chat_idx"));
      Chat_detailDTO chat = new Chat_detailDTO();
      chat.setChat_idx(chat_idx);
      System.out.println("채팅 번호"+chat_idx);
      ChatDAO cdao = new ChatDAO();
      Chat_detailDTO last_chat_detail  = new Chat_detailDTO(); 
      last_chat_detail = cdao.getLastChat_detail(chat);
      System.out.println("contents:"+last_chat_detail.getContents());
      System.out.println("chat_detail_num:"+last_chat_detail.getChat_detail_num());
      System.out.println("chat_idx:"+last_chat_detail.getChat_idx());
      System.out.println("is_read:"+last_chat_detail.getIs_read());
      System.out.println("type:"+last_chat_detail.getType());
      if(last_chat_detail != null) {
         Gson gson = new Gson();
         String json = gson.toJson(last_chat_detail);
         
         resp.setContentType("application/json");
         resp.setCharacterEncoding("UTF-8");
         resp.getWriter().write(json);         
      }
      System.out.println(last_chat_detail.getContents());
      
      return null;
   }
}