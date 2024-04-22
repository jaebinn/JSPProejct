package com.ec.app.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ExpertDAO;
import com.ec.model.dao.ReviewDAO;
import com.ec.model.dto.ReviewDTO;

public class ReviewWriteOkAction implements Action {

	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) {
	    String title = req.getParameter("title");
	    String detail = req.getParameter("detail");
	    String user_id = req.getParameter("user_id");
	    String starStr = req.getParameter("star_score");
	    System.out.println(starStr); 
	    int star = 0;
	    if (starStr != null && !starStr.isEmpty()) {
	        star = Integer.parseInt(starStr);
	    }
	    
	    String expert_name = req.getParameter("expert_name");
	    
	    ExpertDAO edao = new ExpertDAO();
	    long expert_idx = edao.getExpertIdxByName(expert_name);
	    
	    ReviewDTO review = new ReviewDTO();
	    review.setTitle(title);
	    review.setDetail(detail);
	    review.setUser_id(user_id);
	    review.setExpert_idx(expert_idx);
	    review.setExpert_name(expert_name);
	    review.setStar(star);
	    
	    System.out.println(review.getTitle());
	    System.out.println(review.getDetail());
	    System.out.println(review.getUser_id());
	    System.out.println(review.getExpert_idx());
	    System.out.println(review.getExpert_name());
	    System.out.println(review.getStar());

	    ReviewDAO rdao = new ReviewDAO();
	    Transfer transfer = new Transfer();
	    if (rdao.insertReview(review)) {
	        req.setAttribute("review", review);
	    } else {
	        // 처리가 실패한 경우에 대한 로직 추가
	    }
	    transfer.setRedirect(false);
	    transfer.setPath(req.getContextPath() + "/reviewlist.rf");
	    return transfer;
	}
}
