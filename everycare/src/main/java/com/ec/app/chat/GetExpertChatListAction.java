package com.ec.app.chat;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ChatDAO;
import com.ec.model.dto.TempChatDTO;
import com.google.gson.Gson;

public class GetExpertChatListAction implements Action{
   @Override
   public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      Long expert_idx = Long.parseLong(req.getParameter("expert_idx"));
      System.out.println(expert_idx);
      ChatDAO cdao = new ChatDAO();
      List<TempChatDTO> list = null;
      list = cdao.getExpertChatList(expert_idx);
      if(list != null) {
         for(TempChatDTO chat : list) {
            System.out.println("채팅인덱스:"+chat.getChat_idx());
            System.out.println(chat.getExpert_idx());
            System.out.println(chat.getUser_id());
            System.out.println(chat.getUser_name());
            System.out.println(chat.getNotReadCnt());
         }
         Gson gson = new Gson();
         String json = gson.toJson(list);
         
         resp.setContentType("application/json");
         resp.setCharacterEncoding("UTF-8");
         resp.getWriter().write(json);
      }else {
         System.out.println("전문가 채팅리스트 가져오기 실패");
      }
      return null;
   }
}