package com.ec.app.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ReviewDAO;

public class ReviewDeleteOkAction implements Action {

	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		long review_idx = Long.parseLong(req.getParameter("review_idx"));
		
		String temp = req.getParameter("page");
		int page = temp == null || temp.equals("") ? 1 : Integer.parseInt(temp);
		
		
		ReviewDAO rdao = new ReviewDAO();
		
		Transfer transfer = new Transfer();
		transfer.setRedirect(true);
		
		if(rdao.deleteReview(review_idx)) {
			transfer.setPath(req.getContextPath()+"/reviewlist.rf?page="+page);
			
		} else {
			transfer.setPath(req.getContextPath()+"/reviewlist.rf?page="+page+"&review_idx="+review_idx);
		}
		
		return transfer;
	}

}
