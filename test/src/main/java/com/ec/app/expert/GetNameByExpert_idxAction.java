package com.ec.app.expert;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ExpertDAO;

public class GetNameByExpert_idxAction implements Action {
    @Override
    public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
       long expert_idx = Integer.parseInt(req.getParameter("expert_idx"));
        ExpertDAO edao = new ExpertDAO();
        String user_name = edao.getUser_nameByExpert_idx(expert_idx);
        
        resp.setContentType("text/plain");

      resp.setContentType("text/plain");
      resp.setCharacterEncoding("UTF-8");
      resp.getWriter().write(user_name);
      
        return null;
    }
}