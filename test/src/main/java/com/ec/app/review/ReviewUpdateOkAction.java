package com.ec.app.review;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ReviewDAO;
import com.ec.model.dao.U_FileDAO;
import com.ec.model.dao.U_boardDAO;
import com.ec.model.dto.ReviewDTO;
import com.ec.model.dto.U_FileDTO;
import com.ec.model.dto.U_boardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewUpdateOkAction implements Action {

	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		long review_idx = Long.parseLong(req.getParameter("review_idx"));
		 String title = req.getParameter("title");
	        String detail = req.getParameter("detail");
	        String user_id = req.getParameter("user_id");
	        String starParam = req.getParameter("star");
	        int star = 0; // 기본값으로 설정
	        
	        // starParam이 null이 아닌 경우에만 정수로 변환
	        if (starParam != null && !starParam.isEmpty()) {
	            star = Integer.parseInt(starParam);
	        }

	        ReviewDTO review = new ReviewDTO();
	        review.setTitle(title);
	        review.setDetail(detail);
	        review.setUser_id(user_id);
	        review.setStar(star);

	        System.out.println(review.getTitle());
	        System.out.println(review.getDetail());
	        System.out.println(review.getUser_id());
	        System.out.println(review.getStar());

	        ReviewDAO rdao = new ReviewDAO();
	        Transfer transfer = new Transfer();
	        transfer.setRedirect(true);
	        if(rdao.updateReview(review)) {
	        	
	        }
	        else {
	        	
	        	
	        }

	     
	        return transfer;
	    }

	}