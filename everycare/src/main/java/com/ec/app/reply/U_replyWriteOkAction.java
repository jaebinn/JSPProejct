package com.ec.app.reply;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.U_replyDAO;
import com.ec.model.dto.U_replyDTO;

public class U_replyWriteOkAction implements Action{
   @Override
   public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      long board_idx = Long.parseLong(req.getParameter("board_idx"));
      String contents = req.getParameter("contents");
      String user_id = (String)req.getSession().getAttribute("loginUser"); 
      String page = req.getParameter("page");
      /* String keyword = req.getParameter("keyword"); */
      
      U_replyDTO u_reply = new U_replyDTO();
      u_reply.setBoard_idx(board_idx);
      u_reply.setContents(contents);
      u_reply.setUser_id(user_id);
      
      U_replyDAO urdao = new U_replyDAO();
//      Transfer transfer = new Transfer();
//      transfer.setRedirect(true);
//      transfer.setPath(req.getContextPath()+"/boardview.bo?boardnum=");
      resp.setCharacterEncoding("UTF-8");
      resp.setContentType("text/html; charset=utf-8");
      PrintWriter out = resp.getWriter();
      
      out.print("<script>");
      if(urdao.insertReply(u_reply)) {
         out.print("alert('댓글 등록 성공!');");
      }
      else {
         out.print("alert('댓글 등록 실패!');");
      }
      //location.replace('/boardview.bo?boardnum=1&keyword=지우개&page=1')
      String format = String.format("location.replace('%s/u_boardview.ub?board_idx=%s&page=%s')",
            req.getContextPath(),board_idx+"",page);
      out.print(format);
      out.print("</script>");
      
      return null;
   }
}