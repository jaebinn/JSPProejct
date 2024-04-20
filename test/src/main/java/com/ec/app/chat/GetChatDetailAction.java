package com.ec.app.chat;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ChatDAO;
import com.ec.model.dto.Chat_detailDTO;
import com.google.gson.Gson;

public class GetChatDetailAction implements Action{
   @Override
   public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      long chat_idx = Integer.parseInt(req.getParameter("chat_idx"));
      ChatDAO cdao = new ChatDAO();
      //챗 내용 가져오기 전에 .friend를 눌러서 챗 내용을 가져오는 거기때문에 기존에 있는 채팅들 is_read 바꿔주기
      cdao.UpdateIsRead(chat_idx);
      //챗 내용 가져오기
      List<Chat_detailDTO> chat_detail  = cdao.getChatDetail(chat_idx);
      /* System.out.println(chat_detail); */
      for (Chat_detailDTO detail : chat_detail) {
          System.out.println("Type: " + detail.getType());
          System.out.println("Contents: " + detail.getContents());
          System.out.println("Regdate: " + detail.getRegdate());
          System.out.println("Chat_detail_num" +detail.getChat_detail_num());
          System.out.println("Original_name" +detail.getOriginal_name());
      }
      Gson gson = new Gson();
      String json = gson.toJson(chat_detail);
      
      resp.setContentType("application/json");
      resp.setCharacterEncoding("UTF-8");
      resp.getWriter().write(json);
      return null;
   }
}