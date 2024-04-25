package com.ec.app.u_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.U_FileDAO;
import com.ec.model.dao.U_boardDAO;
import com.ec.model.dao.U_replyDAO;
import com.ec.model.dto.U_boardDTO;


public class U_boardViewOkAction implements Action{
   @Override
   public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      long board_idx = Long.parseLong(req.getParameter("board_idx"));
      String loginUser = (String)req.getSession().getAttribute("loginUser");
      
      U_boardDAO ubdao = new U_boardDAO();
      
      U_boardDTO u_board = ubdao.getBoardByIdx(board_idx);
      
        if(!u_board.getUser_id().equals(loginUser)){
           ubdao.updateReadCount(board_idx);
           u_board.setReadcount(u_board.getReadcount()+1); 
        }
       
      U_FileDAO ufdao = new U_FileDAO();
      U_replyDAO urdao = new U_replyDAO();
      
      req.setAttribute("u_board", u_board);
      req.setAttribute("files", ufdao.getFiles(board_idx));
      req.setAttribute("replies", urdao.getReplies(board_idx));
      
      Transfer transfer = new Transfer();
      transfer.setRedirect(false);
      transfer.setPath("/app/u_board/u_board_view.jsp");
      return transfer;
   }
}