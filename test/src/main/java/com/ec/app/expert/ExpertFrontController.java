package com.ec.app.expert;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Transfer;
import com.ec.model.dao.ExpertDAO;


public class ExpertFrontController extends HttpServlet{
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
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath(); 
		String command = requestURI.substring(contextPath.length());
		
		System.out.println(command);

		Transfer transfer = null;
		switch(command) {
		case "/expertok.ep" :
			try {
				transfer = new ExpertAddOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/expertok.ep : "+e);
			}
			break;
		case "/expertlist.ep":
			try {
				transfer = new ExpertListOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/expertlist.ep : "+e);
			}
			break;
		case "/expertsort.ep":
			try {
				transfer = new ExpertSortOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/expertsort.ep : "+e);
			}
			break;
		case "/expertkeywordsort.ep":
			try {
				transfer = new ExpertkeywordSortOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/expertkeywordsort.ep : "+e);
			}
			break;
		case "/expertsearchkeywordsort.ep":
			try {
				transfer = new ExpertSearchkeywordSortOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/expertsearchkeywordsort.ep : "+e);
			}
			break;
		case "/expertview.ep":
			try {
				transfer = new ExpertViewOkAction().execute(req, resp);
			} catch(Exception e) {
				System.out.println("/expertview.ep : "+e);
			}
			break;
		case "/expertlikecnt.ep":
			try {
				new ExpertLikeCntOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/expertlikecnt.ep : "+e);
			}
			break;
		case "/getexpertinfo.ep":
			try {
				new ExpertGetInfoOkAction().execute(req, resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "/getexpertrating.ep":
			try {
				new ExpertRatingOkAction().execute(req, resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "/getexpertlocation.ep":
			try {
				new ExpertLoctionOkAction().execute(req, resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "/getNamebyExpert_idx.ep":
	         try {
	            new GetNameByExpert_idxAction().execute(req, resp);
	         } catch (Exception e) {
	            System.out.println("/getNamebyExpert_idx.ep : "+e);
	         }
	         break;
  		//전문가 마이페이지
  		case "/expertinfo.ep":
  			try {
  				transfer = new ExpertInfoViewOkAction().execute(req, resp);
  			} catch(Exception e) {
  				e.printStackTrace();
  			}
  			break;
  		//전문가 수정
  		case "/expertinfo/update/fm.ep":
  			try {
  				transfer = new ExpertInfoViewFormUpdateOkAction().execute(req, resp);
  			} catch(Exception e) {
  				e.printStackTrace();
  			}
  			break;
  		//전문가 경력/자격증 수정
  		case "/expertinfo/update/aj.ep":
  			try {
  				new ExpertInfoViewAjaxUpdateOkAction().execute(req, resp);
  			} catch(Exception e) {
  				e.printStackTrace();
  			}
  			break;
  		//전문가 파일 업로드
  		case "/expertinfo/update/fl.ep":
  			try {
  				new ExpertInfoViewFileUpdateOkAction().execute(req, resp);
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
