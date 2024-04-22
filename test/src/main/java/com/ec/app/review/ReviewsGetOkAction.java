package com.ec.app.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ReviewDAO;
import com.ec.model.dto.ReviewDTO;
import com.google.gson.Gson;

public class ReviewsGetOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ReviewDAO rdao = new ReviewDAO();
		List<ReviewDTO> reviews = rdao.getReviews();
		System.out.println(reviews);
		Gson gson = new Gson();
		String jsonReviews = gson.toJson(reviews);
		System.out.println(jsonReviews);
		resp.setContentType("text/html; charset=utf-8");
		resp.setCharacterEncoding("UTF-8");

		resp.getWriter().write(jsonReviews);

		return null;
	}
}
