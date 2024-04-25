package com.ec.app.review;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ReviewDAO;
import com.ec.model.dto.ReviewDTO;

public class ReviewUpdateOkAction implements Action {

   @Override
   public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      long review_idx = Long.parseLong(req.getParameter("review_idx"));
      String page = req.getParameter("page"); 
      String title = req.getParameter("title");
           String detail = req.getParameter("detail");
           String user_id = req.getParameter("user_id");
           String starParam = req.getParameter("star_score");
           int star = 0; // 기본값으로 설정
           
           // starParam이 null이 아닌 경우에만 정수로 변환
           if (starParam != null && !starParam.isEmpty()) {
               star = Integer.parseInt(starParam);
           }

           ReviewDTO review = new ReviewDTO();
           review.setReview_idx(review_idx);
           review.setTitle(title);
           review.setDetail(detail);
           review.setUser_id(user_id);
           review.setStar(star);
           

           ReviewDAO rdao = new ReviewDAO();
           Transfer transfer = new Transfer();
           transfer.setRedirect(true);
           if(rdao.updateReview(review)) {
              System.out.println("수정 됨");
           }
           else {
              
              
           }

        
         String queryString = String.format("?review_idx=%s&page=%s",review_idx+"",page);
         transfer.setPath(req.getContextPath()+"/reviewlist.rf"+queryString);
         return transfer;
      }

   }