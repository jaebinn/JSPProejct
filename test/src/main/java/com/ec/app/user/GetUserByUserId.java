package com.ec.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ChatDAO;
import com.ec.model.dao.UserDAO;
import com.ec.model.dto.UserDTO;
import com.google.gson.Gson;

public class GetUserByUserId implements Action{
   @Override
   public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      String chat_idx = req.getParameter("chat_idx");
      ChatDAO cdao = new ChatDAO();
      String user_id = cdao.getUserIdByChatIdx(chat_idx);
      UserDAO udao = new UserDAO();
      UserDTO user = new UserDTO();
      Gson gson = new Gson();
      if(user_id == null) {
         System.out.println("유저아이디를 가져오지 못했어요~");
      }else {
         user = udao.getUserById(user_id);
         if(user != null) {
            String json = gson.toJson(user);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(json);
         }else {
            System.out.println("유저정보 가져오기 실패");
         }
      }
      return null;
   }
}