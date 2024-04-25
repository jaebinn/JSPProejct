package com.ec.app.reply;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.U_replyDAO;
import com.ec.model.dto.U_replyDTO;

public class U_replyUpdateOkAction implements Action{
   @Override
   public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      String i = req.getParameter("i");
      long u_reply_idx = Long.parseLong(req.getParameter("u_reply_idx"));
      long board_idx = Long.parseLong(req.getParameter("board_idx"));
//      String keyword = req.getParameter("keyword");
      String page = req.getParameter("page");
      
      String contents = req.getParameter("reply"+i);
      
      U_replyDTO ureply = new U_replyDTO();
      ureply.setContents(contents);
      ureply.setU_reply_idx(u_reply_idx);
      
      U_replyDAO urdao = new U_replyDAO();
      resp.setCharacterEncoding("UTF-8");
      resp.setContentType("text/html; charset=utf-8");
      PrintWriter out = resp.getWriter();
      
      out.print("<script>");
      if(urdao.updateReply(ureply)) {
         out.print("alert('댓글 수정 성공!');");
      }
      else {
         out.print("alert('댓글 수정 실패!');");
      }
      //location.replace('/boardview.bo?boardnum=1&keyword=지우개&page=1')
      String format = String.format("location.replace('%s/u_boardview.ub?board_idx=%s&page=%s')",
            req.getContextPath(),board_idx+"",page);
      out.print(format);
      out.print("</script>");
      return null;
   }
}