package com.ec.app.chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ChatDAO;
import com.ec.model.dto.Chat_detailDTO;


public class SendMessageAction implements Action{
   @Override
   public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      long chat_idx = Long.parseLong(req.getParameter("chat_idx"));
      String contents = req.getParameter("contents");
      String type = "u";
      
      Chat_detailDTO chat = new Chat_detailDTO();
      chat.setChat_idx(chat_idx);
      chat.setContents(contents);
      chat.setType(type);
      
      ChatDAO cdao = new ChatDAO();
      if(cdao.insertchat_detail(chat)) {
         System.out.println("샌드채팅 성공");
      }else {
         System.out.println("샌드채팅 실패");
      }

      return null;
   }
}