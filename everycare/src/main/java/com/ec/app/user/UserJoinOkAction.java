package com.ec.app.user;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.UserDAO;
import com.ec.model.dto.UserDTO;

public class UserJoinOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String userid = req.getParameter("user_id");
		UserDTO user = new UserDTO();
		user.setUser_id(userid);
		user.setPw(req.getParameter("pw"));
		user.setName(req.getParameter("name"));
		user.setTel_mobile(req.getParameter("tel_mobile"));
		user.setTel_sub(req.getParameter("tel_sub"));
		user.setEmail(req.getParameter("email"));
		user.setGender(req.getParameter("gender")+"-"+req.getParameter("foreigner"));//W-K
		user.setAge(req.getParameter("age"));
		user.setZipcode(req.getParameter("zipcode"));
		user.setAddr(req.getParameter("addr"));
		user.setAddr_detail(req.getParameter("addr_detail"));
		user.setAddr_etc(req.getParameter("addr_etc"));
		user.setUser_etc(req.getParameter("user_etc"));
		PrintWriter out = resp.getWriter();
		UserDAO udao = new UserDAO();
		if(udao.insertUser(user)) {
			Cookie cookie = new Cookie("joinid", userid);
			cookie.setPath("/");
			resp.addCookie(cookie);
			
			
		}
		else {
			
		}
		
		out.print("<script>");
		out.print("alert('"+userid+"님.귀하의 가입이 정상 처리되었습니다');");
		out.print("</script>");
		
		Transfer transfer = new Transfer();
		transfer.setRedirect(true);
		transfer.setPath("/app/user/user-login.jsp");
		return transfer;
	}
}







