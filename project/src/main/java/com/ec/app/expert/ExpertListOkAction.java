package com.ec.app.expert;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.app.action.Action;
import com.ec.app.action.Transfer;
import com.ec.model.dao.ExpertDAO;

public class ExpertListOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String temp = req.getParameter("page");
		int page = temp == null || temp.equals("") ? 1 : Integer.parseInt(temp);
		String keyword = req.getParameter("keyword");
		
		ExpertDAO edao = new ExpertDAO();
		//전체 전문가 프로필 개수
		long totalCnt = 0;
		totalCnt = edao.getExpertList();
		
		return null;
	}
}
