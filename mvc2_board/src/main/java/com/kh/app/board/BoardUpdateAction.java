package com.kh.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.action.Action;
import com.kh.action.Transfer;
import com.kh.model.dao.BoardDAO;
import com.kh.model.dao.FileDAO;

public class BoardUpdateAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		long boardnum = Long.parseLong(req.getParameter("boardnum"));
		
		BoardDAO bdao = new BoardDAO();
		FileDAO fdao= new FileDAO();
		
		req.setAttribute("board", bdao.getBoardByNum(boardnum));
		req.setAttribute("files", fdao.getFiles(boardnum));
		
		Transfer transfer = new Transfer();
		transfer.setRedirect(false);
		transfer.setPath("/app/board/modify.jsp");
		return transfer;
	}
}







