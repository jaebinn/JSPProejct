package com.kh.app.board;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.action.Action;
import com.kh.action.Transfer;
import com.kh.model.dao.BoardDAO;
import com.kh.model.dto.BoardDTO;

public class BoardWriteOkAction implements Action {
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String boardtitle = req.getParameter("boardtitle");
		String boardcontents = req.getParameter("boardcontents");
		String userid = req.getParameter("userid");
		
		BoardDTO board = new BoardDTO();
		board.setBoardtitle(boardtitle);
		board.setBoardcontents(boardcontents);
		board.setUserid(userid);
		
		System.out.println(board.getBoardtitle());
		System.out.println(board.getBoardcontents());
		System.out.println(board.getUserid());
		
		BoardDAO bdao = new BoardDAO();
		Transfer transfer = new Transfer();
		transfer.setRedirect(true);
		if(bdao.insertBoard(board)) {
			//list
			transfer.setPath(req.getContextPath()+"/boardlist.bo");
			
		}
		else {
			//list
			Cookie cookie = new Cookie("w","f");
			cookie.setPath("/");
			cookie.setMaxAge(1);
			resp.addCookie(cookie);
			transfer.setPath(req.getContextPath()+"/boardlist.bo");
		}
		return transfer;
	}
}









