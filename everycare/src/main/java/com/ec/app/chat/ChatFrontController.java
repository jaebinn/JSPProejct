package com.ec.app.chat;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Transfer;


public class ChatFrontController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doProcess(req, resp);
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      req.setCharacterEncoding("UTF-8");
      doProcess(req, resp);
   }
   
   private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      //길 나누는 코드
      String requestURI = req.getRequestURI();// ???/userjoin.us
      String contextPath = req.getContextPath(); // ???
      String command = requestURI.substring(contextPath.length());
      
      System.out.println(command);

      Transfer transfer = null;
      switch(command) {
      case "/getChatList.ch":
         try {
            transfer = new ChatListOkAction().execute(req,resp);
         } catch (Exception e) {
            System.out.println("/getChatList.ch : "+e);
         }
         break;
      case "/getChatNotReadCnt.ch":
         try {
            transfer = new GetChatNotReadCntAction().execute(req,resp);
         } catch (Exception e) {
            System.out.println("/getChatNotReadCnt.ch : "+e);
         }
         break;
      case "/getChatDetail.ch":
         try {
            transfer = new GetChatDetailAction().execute(req,resp);
         } catch (Exception e) {
            System.out.println("/getChatDetail.ch : "+e);
         }
         break;
      case "/sendMessage.ch":
         try {
            transfer = new SendMessageAction().execute(req,resp);
         } catch (Exception e) {
            System.out.println("/sendMessage.ch : "+e);
         }
         break;
      case "/fetchChatDetailUpdate.ch":
         try {
            transfer = new FetchChatDetailUpdateAction().execute(req,resp);
         } catch (Exception e) {
            System.out.println("/fetchChatDetailUpdate.ch : "+e);
         }
         break;
      case "/getExpertChatList.ch":
         try {
            transfer = new GetExpertChatListAction().execute(req,resp);
         } catch (Exception e) {
            System.out.println("/getExpertChatList.ch : "+e);
         }
         break;
      case "/expertChatIsReadUpdate.ch":
         try {
            transfer = new ExpertChatIsReadUpdate().execute(req,resp);
         } catch (Exception e) {
            System.out.println("/expertChatIsReadUpdate.ch : "+e);
         }
         break;
      case "/getExpertChat_detail.ch":
         try {
            transfer = new GetExpertChat_detail().execute(req,resp);
         } catch (Exception e) {
            System.out.println("/getExpertChat_detail.ch : "+e);
         }
         break;
      case "/expertSendMsg.ch":
         try {
            transfer = new ExpertSendMsg().execute(req,resp);
         } catch (Exception e) {
            System.out.println("/expertSendMsg.ch : "+e);
         }
         break;
      case "/sendReservation.ch":
         try {
            transfer = new SendReservation().execute(req,resp);
         } catch (Exception e) {
            System.out.println("/sendReservation.ch : "+e);
         }
         break;
      case "/openChatRoom.ch":
          try {
             transfer = new OpenChatRoom().execute(req,resp);
          } catch (Exception e) {
             System.out.println("/openChatRoom.ch : "+e);
          }
          break;   
      }
      if(transfer != null) {
         if(transfer.isRedirect()) {
            resp.sendRedirect(transfer.getPath());
         }
         else {
            req.getRequestDispatcher(transfer.getPath()).forward(req, resp);
         }
      }
   }
}










