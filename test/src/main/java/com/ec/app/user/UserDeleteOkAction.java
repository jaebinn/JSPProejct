package com.ec.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.UserDAO;
import com.ec.model.dto.UserDTO;

public class UserDeleteOkAction implements Action {
	
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8");
		String userid = req.getParameter("user_id");
		HttpSession session = req.getSession();
        String loginUser = (String) session.getAttribute("loginUser");
		String userpw = req.getParameter("pw");
		PrintWriter out = resp.getWriter();
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
			else if(temp.getPw().equals(userpw)) {
				udao.deleteUser(userid);
				
				udao.deleteExpert(userid);
				session.removeAttribute("loginUser");
				out.print("<script>");
				out.print("alert('회원 탈퇴 처리가 완료되었습니다.');");
				
				out.print("location.replace('"+req.getContextPath()+"/index.jsp')");
				out.print("</script>");
			}
			else if(!temp.getPw().equals(userpw) || !temp.getUser_id().equals(userid)) {
				req.getSession().setAttribute("loginUser", userid);
				out.print("<script>");
				out.print("alert('아이디/비밀번호를 다시 확인해주세요 ');");
				
				out.print("location.replace('"+req.getContextPath()+"/app/user/user-login.jsp')");
				out.print("</script>");
			}
		}
		
		
		/*
		 * UserDTO user = new UserDTO(); String db_user_id = user.getUser_id(); String
		 * db_pw = user.getPw();
		 * 
		 * 
		 * UserDAO udao = new UserDAO(); UserDTO temp = udao.getUserById(userid);
		 * Transfer transfer = new Transfer(); transfer.setRedirect(true);
		 * if(temp.getUser_id().equals(userid)) { udao.deleteUser(userid);
		 * out.print("<script>"); out.print("alert('회원탈퇴 처리가 완료되었습니다.');");
		 * out.print("location.replace('"+req.getContextPath()+"./index.jsp')");
		 * out.print("</script>");
		 * 
		 * } else if(!temp.getUser_id().equals(userid)) { out.print("<script>");
		 * out.print("alert('회원탈퇴 처리중 오류가 발생핬습니다.');");
		 * out.print("location.replace('"+req.getContextPath()+"./user-delete.jsp')");
		 * out.print("</script>");
		 * 
		 * 
		 * } else if(userid == "" || userpw == "") { out.print("<script>");
		 * out.print("alert('회원탈퇴 처리중 오류가 발생핬습니다.');");
		 * out.print("location.replace('"+req.getContextPath()+"./user-delete.jsp')");
		 * out.print("</script>");
		 * 
		 * }
		 */
		
		return null;
		
	}
}
