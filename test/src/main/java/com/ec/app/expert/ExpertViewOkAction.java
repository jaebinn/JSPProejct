package com.ec.app.expert;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ExpertDAO;
import com.ec.model.dao.Like_cntDAO;
import com.ec.model.dto.ExpertDTO;
import com.ec.model.dto.Like_cntDTO;

public class ExpertViewOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Long expert_idx = Long.parseLong(req.getParameter("expert_idx"));
		HttpSession session = req.getSession();
        String user_id = (String) session.getAttribute("loginUser");
        
		ExpertDAO edao = new ExpertDAO();
		Like_cntDAO ldao = new Like_cntDAO();
		ExpertDTO expert = edao.getExpertById(expert_idx);
		Like_cntDTO likeInfo = ldao.getLikeInfo(user_id, expert_idx);

		if(likeInfo != null) {
			System.out.println("like"+likeInfo);		
			req.setAttribute("expert", expert);	
			req.setAttribute("likeInfo", likeInfo);
		}else {
			req.setAttribute("expert", expert);			
		}
		Transfer transfer = new Transfer();
		transfer.setRedirect(false);
		transfer.setPath("/app/expert/expertView.jsp");
		return transfer;
	}
}
