package com.ec.app.expert;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.app.action.Action;
import com.ec.app.action.Transfer;
import com.ec.model.dao.ExpertDAO;

public class ExpertLikeCntOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String expertIdxParam = req.getParameter("expert_idx");
		String likeCntParam = req.getParameter("like_cnt");
		
		// expert_idx와 like_cnt 파라미터가 null인지 확인
		if (expertIdxParam == null || likeCntParam == null) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "expert_idx 또는 like_cnt 파라미터가 누락되었습니다.");
			return null;
		}
		
		// expert_idx와 like_cnt 파라미터가 숫자인지 확인
		Long expertIdx;
		int likeCnt;
		try {
			expertIdx = Long.parseLong(expertIdxParam);
			likeCnt = Integer.parseInt(likeCntParam);
		} catch (NumberFormatException e) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "expert_idx 또는 like_cnt 파라미터가 올바른 숫자 형식이 아닙니다.");
			return null;
		}
		
		ExpertDAO edao = new ExpertDAO();
		
		// ExpertDAO가 null이 아닌지 확인
		if (edao == null) {
			resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "데이터 액세스 객체를 초기화할 수 없습니다.");
			return null;
		}
		
		// 좋아요 카운트 업데이트 성공 여부 확인
		boolean success = edao.updateLikeCount(expertIdx);
        
        if (success) {
            resp.setStatus(HttpServletResponse.SC_OK);
        } else {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
        
        return null;
	}
}
