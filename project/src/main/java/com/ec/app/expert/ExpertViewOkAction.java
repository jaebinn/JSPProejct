package com.ec.app.expert;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.app.action.Action;
import com.ec.app.action.Transfer;
import com.ec.model.dao.ExpertDAO;
import com.ec.model.dto.ExpertDTO;

@WebServlet("/toggle_like_count")
public class ExpertViewOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Long expert_idx = Long.parseLong(req.getParameter("expert_idx"));
		
		ExpertDAO edao = new ExpertDAO();
		ExpertDTO expert = edao.getExpertById(expert_idx);

		req.setAttribute("expert", expert);
		
		Transfer transfer = new Transfer();
		transfer.setRedirect(false);
		transfer.setPath("/app/expert/expertView.jsp");
		return transfer;
	}
}
