package com.ec.app.expert;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ExpertDAO;
import com.google.gson.JsonObject;

public class GetNameByExpert_idxAction implements Action {
    @Override
    public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	long expert_idx = Integer.parseInt(req.getParameter("expert_idx"));
        ExpertDAO edao = new ExpertDAO();
        String user_name = edao.getUser_nameByExpert_idx(expert_idx);
        String profile = edao.getProfile(expert_idx);
        
        // 응답에 포함될 데이터를 JSON 형식으로 구성
        JsonObject responseData = new JsonObject();
        responseData.addProperty("user_name", user_name);
        responseData.addProperty("profile", profile);
        
        // 응답의 Content-Type 설정
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        
        // 응답 전송
        PrintWriter out = resp.getWriter();
        out.print(responseData.toString());
        out.flush();
        
        return null;
    }
}