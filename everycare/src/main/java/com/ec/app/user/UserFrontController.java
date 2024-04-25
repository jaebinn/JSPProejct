package com.ec.app.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Transfer;

public class UserFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doProcess(req, resp);
	}
	
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//길 나누는 코드
		String requestURI = req.getRequestURI();// ???/userjoin.us
		String contextPath = req.getContextPath(); // ???
		String command = requestURI.substring(contextPath.length());
		
		System.out.println(command);

		Transfer transfer = null;
		switch(command) {
		case "/userjoin.us":
			transfer = new Transfer();
			transfer.setRedirect(false);
			transfer.setPath("../../user-join.jsp");
			break;
		case "/userjoinok.us":
			try {
				transfer = new UserJoinOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/userjoinok : "+e);
			}
			break;
		case "/userlogin.us":
			transfer = new Transfer();
			transfer.setPath("/");
			transfer.setRedirect(false);
			break;
		case "/userloginok.us":
			try {
				transfer = new UserLoginOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/userloginok : "+e);
			}
			break;
		case "/checkidok.us":
			try {
				new CheckIdOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/checkidok : "+e);
			}
			break;
		case "/userlogout.us":
			req.getSession().invalidate();
			transfer = new Transfer();
			transfer.setRedirect(false);
			transfer.setPath("/");
			break;
		case "/userdeleteok.us":	
			try {
				new UserDeleteOkAction().execute(req,resp);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			break;
		case "/getjoincnt.us":
			try {
				transfer = new GetUserCnt().execute(req,resp);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			break;
		case "/getUserByUserId.us":
	         try {
	            transfer = new GetUserByUserId().execute(req, resp);
	         } catch (Exception e) {
	            System.out.println("/getUserByUserId.us : "+e);
	         }
	         break;
  		//유저 마이페이지
  		case "/userinfo.us":
  			try {
  				transfer = new UserInfoViewOkAction().execute(req, resp);
  			} catch (Exception e) {
  				e.printStackTrace();
  			}
  			break;
  		//유저 마이페이지 수정 Ajax
  		case "/update.us":
  			try {
  				transfer = new UserInfoUpdateOkAction().execute(req, resp);
  			} catch (Exception e) {
  				e.printStackTrace();
  			}
  			break;
  		//유저 마이페이지 사용자 특이사항(user.user_etc) 수정 Ajax
  		case "/etc.us":
  			try {
  				transfer = new UserInfoEtcUpdateOkAction().execute(req, resp);
  			} catch(Exception e) {
  				e.printStackTrace();
  			}
  			break;
		}
		
		if(transfer != null) {
			if(transfer.isRedirect()) {
				resp.sendRedirect(transfer.getPath());
			}
			else {
				req.getRequestDispatcher(transfer.getPath()).forward(req, resp);
			}
		}
	}
}













