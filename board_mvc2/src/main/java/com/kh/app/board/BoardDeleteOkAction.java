package com.kh.app.board;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.action.Action;
import com.kh.action.Transfer;
import com.kh.model.dao.BoardDAO;

public class BoardDeleteOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		long boardnum = Long.parseLong(req.getParameter("boardnum"));
		String keyword = req.getParameter("keyword");
		String temp = req.getParameter("page");
		int page = temp==null||temp.equals("") ? 1 : Integer.parseInt(temp);
		
		keyword = URLEncoder.encode(keyword,"UTF-8");
		
		BoardDAO bdao = new BoardDAO();
		
		Transfer transfer = new Transfer();
		transfer.setRedirect(true);
		if(bdao.deleteBoard(boardnum)) {
			transfer.setPath(req.getContextPath()+"/boardlist.bo?page="+page+"&keyword="+keyword);
		}
		else {
			transfer.setPath(req.getContextPath()+"/boardview.bo?page="+page+"&keyword="+keyword+"&boardnum="+boardnum);
		}
		return transfer;
	}
}

















