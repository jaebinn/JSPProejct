package com.kh.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.action.Action;
import com.kh.action.Transfer;
import com.kh.model.dao.UserDAO;
import com.kh.model.dto.UserDTO;

public class CheckIdOkAction implements Action {
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String userid = req.getParameter("userid");
		
		UserDAO udao = new UserDAO();
		UserDTO temp = udao.getUserById(userid);
		
		PrintWriter out = resp.getWriter();
		
		if(temp == null) {
			out.print("O");
		}
		else {
			out.print("X");
		}
		return null;
	}
}










