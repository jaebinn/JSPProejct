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
		String starParam = req.getParameter("star");
		String expert_name = req.getParameter("expert_name");
		int star = 0; // 기본값으로 설정
		ExpertDAO edao = new ExpertDAO();
		
		long expert_idx = edao.getExpertIdxByName(expert_name); //expert_idx 나옴 
		
		
		// starParam이 null이 아닌 경우에만 정수로 변환
		if (starParam != null && !starParam.isEmpty()) {
			star = Integer.parseInt(starParam);
		}

		ReviewDTO review = new ReviewDTO();
		review.setTitle(title);
		review.setDetail(detail);
		review.setUser_id(user_id);
		review.setStar(star);
		review.setExpert_idx(expert_idx);

		System.out.println(review.getTitle());
		System.out.println(review.getDetail());
		System.out.println(review.getUser_id());
		System.out.println(review.getExpert_idx());
		System.out.println(review.getStar());

		ReviewDAO rdao = new ReviewDAO();
		Transfer transfer = new Transfer();
		if (rdao.insertReview(review)) {
			req.setAttribute("review", review);
			
		} else {
			
		}
		transfer.setRedirect(false);
		transfer.setPath(req.getContextPath()+"/app/review/review_list.jsp");
		return transfer;
	}

}
