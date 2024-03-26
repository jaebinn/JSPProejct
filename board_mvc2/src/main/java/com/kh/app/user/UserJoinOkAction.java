package com.kh.app.user;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.action.Action;
import com.kh.action.Transfer;
import com.kh.model.dao.UserDAO;
import com.kh.model.dto.UserDTO;

public class UserJoinOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String userid = req.getParameter("userid");
		UserDTO user = new UserDTO();
		user.setUserid(userid);
		user.setUserpw(req.getParameter("userpw"));
		user.setUsername(req.getParameter("username"));
		user.setUsergender(req.getParameter("usergender")+"-"+req.getParameter("foreigner"));//W-K
		user.setZipcode(req.getParameter("zipcode"));
		user.setAddr(req.getParameter("addr"));
		user.setAddrdetail(req.getParameter("addrdetail"));
		user.setAddretc(req.getParameter("addretc"));
		user.setUserhobby(req.getParameter("userhobby"));
		
		UserDAO udao = new UserDAO();
		if(udao.insertUser(user)) {
			Cookie cookie = new Cookie("joinid", userid);
			cookie.setPath("/");
			resp.addCookie(cookie);
		}
		else {
			
		}
		
		Transfer transfer = new Transfer();
		transfer.setRedirect(true);
		transfer.setPath(req.getContextPath()+"/");
		return transfer;
	}
}







