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
			UserDTO Expert = udao.SelectExpert(userid);
			
			
			if (Expert == null) {
				req.getSession().setAttribute("loginUser", userid);
				System.out.println("일반유저 세션값 확인"+req.getSession().getAttribute("loginUser"));
				//메인으로 이동합니다
				out.print("<script>");
				out.print("alert('"+userid+"님,방문을 환영합니다');");
				
				out.print("location.replace('"+req.getContextPath()+"/index.jsp')");
				out.print("</script>");
			}
			
			else if(Expert.getUser_id().equals(userid)) {
				int Expert_idx = udao.SelectExpertIdx(userid);
				req.getSession().setAttribute("expert_idx", Expert_idx);
				System.out.println("전문가 번호 :: "+req.getSession().getAttribute("expert_idx"));
				
				req.getSession().setAttribute("loginUser", userid);
				System.out.println("일반유저 세션값 확인"+req.getSession().getAttribute("loginUser"));
				//메인으로 이동합니다
				out.print("<script>");
				out.print("alert('"+userid+"님,방문을 환영합니다');");
				
				out.print("location.replace('"+req.getContextPath()+"/index.jsp')");
				out.print("</script>");
			}
			
			
		
		}
		
		else if(!temp.getPw().equals(userpw) || !temp.getUser_id().equals(userid)) {
			req.getSession().setAttribute("loginUser", userid);
			out.print("<script>");
			out.print("alert('아이디/비밀번호를 다시 확인해주세요 ');");
			
			out.print("location.replace('"+req.getContextPath()+"/app/user/user-login.jsp')");
			out.print("</script>");
		}
			
		}
		return null;
		}
	
	}









