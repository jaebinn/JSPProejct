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
			//실패 - 입력값이 공란
			out.print("<script>");
			out.print("alert('아이디/비밀번호를 입력하세요 ');");
			
			out.print("location.replace('"+req.getContextPath()+"/app/user/user-login.jsp')");
			out.print("</script>");
		} else {
			//입력값이 존재는 함
			
			//존재하는 userid가 입력되었는지 확인
			UserDAO udao = new UserDAO();
			UserDTO temp = udao.getUserById(userid);
			
			if(temp == null) {
				//입력된 userid와 일치하는 행이 없는 경우
				out.print("<script>");
				out.print("alert('아이디 / 비밀번호가 일치하지 않습니다. ');");
				
				out.print("location.replace('"+req.getContextPath()+"/app/user/user-login.jsp')");
				out.print("</script>");
			} else if(temp.getPw().equals(userpw)) {
				//조회된 행의 pw값과 입력된 pw가 같은 경우
				
				//해당 유저가 전문가인지 확인
				UserDTO Expert = udao.SelectExpert(userid);
				
				if (Expert == null) {
					//일반유저인 경우
					req.getSession().setAttribute("loginUser", userid);
					System.out.println("일반유저 세션값 확인"+req.getSession().getAttribute("loginUser"));
					//메인 페이지로 이동
					out.print("<script>");
					out.print("alert('"+userid+"님,방문을 환영합니다');");
					
					out.print("location.replace('"+req.getContextPath()+"/index.jsp')");
					out.print("</script>");
				} else if(Expert.getUser_id().equals(userid)) {
					//expert에서 조회 성공
					Long expert_idx = udao.SelectExpertIdx(userid);
					req.getSession().setAttribute("expertSession", expert_idx);
					System.out.println("전문가 번호 :: "+req.getSession().getAttribute("expertSession"));
					
					req.getSession().setAttribute("loginUser", userid);
					System.out.println("일반유저 세션값 확인"+req.getSession().getAttribute("loginUser"));
					//메인 페이지로 이동
					out.print("<script>");
					out.print("alert('"+userid+"님,방문을 환영합니다');");
					
					out.print("location.replace('"+req.getContextPath()+"/index.jsp')");
					out.print("</script>");
				}
			} else if(!temp.getPw().equals(userpw) || !temp.getUser_id().equals(userid)) {
				//입력값이 틀린 경우
//				req.getSession().setAttribute("loginUser", userid);
				out.print("<script>");
				out.print("alert('아이디/비밀번호를 다시 확인해주세요 ');");
				
				out.print("location.replace('"+req.getContextPath()+"/app/user/user-login.jsp')");
				out.print("</script>");
			}
		}
		return null;
	}	
}









