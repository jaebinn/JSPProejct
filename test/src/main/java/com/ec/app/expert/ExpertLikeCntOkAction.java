package com.ec.app.expert;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ExpertDAO;
import com.ec.model.dao.Like_cntDAO;
import com.ec.model.dto.ExpertDTO;


public class ExpertLikeCntOkAction implements Action {
    @Override
    public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // 클라이언트로부터 전달된 데이터 받기
        String expertIdxParam = req.getParameter("expert_idx");
        Long totalCnt = Long.parseLong(req.getParameter("totalCnt"));
        boolean isLiked = Boolean.parseBoolean(req.getParameter("isLiked")); 
        
        System.out.println(totalCnt);
        System.out.println(isLiked);
        Long expert_idx = (expertIdxParam != null && !expertIdxParam.isEmpty()) ? Long.parseLong(expertIdxParam) : null;
        
        // 세션에서 현재 로그인한 사용자의 ID 가져오기
        HttpSession session = req.getSession();
        String user_id = (String) session.getAttribute("loginUser");
        System.out.println(user_id);
        System.out.println(expert_idx);
        
        String isLike = (isLiked) ? "O" : "X";
        System.out.println(isLike);
        
        Like_cntDAO ldao = new Like_cntDAO();
        ExpertDAO edao = new ExpertDAO();
        
        ExpertDTO expert = new ExpertDTO();
        
        expert.setTotalCnt(totalCnt);
        
        
        
        
        if (user_id != null && expert_idx != null) {
        	if (isLiked) {
                // 하트가 눌렸을 때
        		// 전문가테이블 totalCnt업데이트
        		ldao.updateTotalCnt(expert_idx, totalCnt);
        		if(!ldao.isExpertLike(user_id, expert_idx)) { //db에 저장이 안되어있다면
        			
        			ldao.updateIsLike(expert_idx, user_id, "O");
        		}
                // 세션에 하트가 눌렸음을 저장
                session.setAttribute("isLiked", true);
            } else {
            	// 하트가 눌리지 않았을 때
            	// 전문가테이블 totalCnt업데이트
            	ldao.updateTotalCnt(expert_idx, totalCnt); 
        		if(!ldao.isExpertLike(user_id, expert_idx)) { 
        			ldao.updateIsLike(expert_idx, user_id, "X");
        		}
                
                

            }
        }
        return null;
    }
}