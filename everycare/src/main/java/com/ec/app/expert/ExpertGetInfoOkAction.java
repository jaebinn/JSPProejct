package com.ec.app.expert;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ExpertDAO;
import com.ec.model.dto.ExpertDTO;
import com.google.gson.Gson;

public class ExpertGetInfoOkAction implements Action {
    @Override
    public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        ExpertDAO edao = new ExpertDAO();
        List<ExpertDTO> expertList = edao.getLikeTopThree();
        Gson gson = new Gson();
        String jsonData = gson.toJson(expertList);
        System.out.println(jsonData);
        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(jsonData);
        
        return null;
    }
}
