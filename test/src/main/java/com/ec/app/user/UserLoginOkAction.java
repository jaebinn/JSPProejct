package com.ec.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.UserDAO;
import com.ec.model.dto.UserDTO;

public class UserLoginOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setCharacterEncoding("UTF-8");
		//MIME 타입
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		String userid = req.getParameter("user_id");
		String userpw = req.getParameter("pw");
		System.out.println(req.getContextPath());
		
		if(userid.equals("") ||userpw.equals("")) {
			
			out.print("<script>");
			out.print("alert('아이디/비밀번호를 입력하세요 ');");
			
			out.print("location.replace('"+req.getContextPath()+"/app/user/user-login.jsp')");
			out.print("</script>");
			
		}
		else {
		
		UserDAO udao = new UserDAO();
		UserDTO temp = udao.getUserById(userid);
		if(temp == null) {
			out.print("<script>");
			out.print("alert('아이디 / 비밀번호가 일치하지 않습니다. ');");
			
			out.print("location.replace('"+req.getContextPath()+"/app/user/user-login.jsp')");
			out.print("</script>");
		}
		
		
		
		

		
		else if(temp.getPw().equals(userpw) ) {
			req.getSession().setAttribute("loginUser", userid);
			//메인으로 이동합니다
			out.print("<script>");
			out.print("alert('"+userid+"님,방문을 환영합니다');");
			
			out.print("location.replace('/index.jsp')");
			out.print("</script>");
		}
		
		else if(!temp.getPw().equals(userpw) || !temp.getUser_id().equals(userid)) {
			req.getSession().setAttribute("loginUser", userid);
			out.print("<script>");
			out.print("alert('아이디/비밀번호를 다시 확인해주세요 ');");
			
			out.print("location.replace('"+req.getContextPath()+"/app/user/user-login.jsp'");
			out.print("</script>");
		}

		}
		return null;
		}
	
}








