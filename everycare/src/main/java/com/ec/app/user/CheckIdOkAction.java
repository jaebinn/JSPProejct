package com.ec.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.UserDAO;
import com.ec.model.dto.UserDTO;

public class CheckIdOkAction implements Action {
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String userid = req.getParameter("user_id");
		
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










