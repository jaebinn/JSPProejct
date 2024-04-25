package com.ec.app.expert;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ExpertDAO;
import com.google.gson.Gson;

public class ExpertLoctionOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String expertIdxParam = req.getParameter("expert_idx");
		Long expert_idx = (expertIdxParam != null && !expertIdxParam.isEmpty()) ? Long.parseLong(expertIdxParam) : null;
		System.out.println(expert_idx);
		ExpertDAO edao = new ExpertDAO();
		
		String location = edao.getExpertLoction(expert_idx);
		
		Gson gson = new Gson();
        String jsonData = gson.toJson(location);
        System.out.println(jsonData);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(jsonData);
		
		return null;
	}
}
