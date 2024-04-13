package com.ec.app.u_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.U_FileDAO;
import com.ec.model.dao.U_boardDAO;

public class U_boardUpdateAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		long board_idx = Long.parseLong(req.getParameter("board_idx"));
		
		U_boardDAO ubdao = new U_boardDAO();
		U_FileDAO ufdao= new U_FileDAO();
		
		req.setAttribute("u_board", ubdao.getBoardByIdx(board_idx));
		req.setAttribute("u_files", ufdao.getFiles(board_idx));
		
		Transfer transfer = new Transfer();
		transfer.setRedirect(false);
		transfer.setPath("/app/u_board/u_board_modify.jsp");
		return transfer;
	}
}
