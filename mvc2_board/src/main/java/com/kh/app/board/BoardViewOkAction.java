package com.kh.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.action.Action;
import com.kh.action.Transfer;
import com.kh.model.dao.BoardDAO;
import com.kh.model.dao.FileDAO;
import com.kh.model.dto.BoardDTO;

public class BoardViewOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		long boardnum = Long.parseLong(req.getParameter("boardnum"));
		String loginUser = (String)req.getSession().getAttribute("loginUser");
		
		BoardDAO bdao = new BoardDAO();
		
		BoardDTO board = bdao.getBoardByNum(boardnum);
		if(!board.getUserid().equals(loginUser)) {
			bdao.updateReadCount(boardnum);
			board.setReadcount(board.getReadcount()+1);
		}
		FileDAO fdao = new FileDAO();
		
		req.setAttribute("board", board);
		req.setAttribute("files", fdao.getFiles(boardnum));
		
		Transfer transfer = new Transfer();
		transfer.setRedirect(false);
		transfer.setPath("/app/board/get.jsp");
		return transfer;
	}
}





