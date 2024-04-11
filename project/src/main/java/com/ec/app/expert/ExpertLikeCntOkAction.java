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
		
		Long expert_idx = (expertIdxParam != null && !expertIdxParam.isEmpty()) ? Long.parseLong(expertIdxParam) : null;
		int like_cnt = (likeCntParam != null && !likeCntParam.isEmpty()) ? Integer.parseInt(likeCntParam) : null;
		
		System.out.println(expert_idx);
		ExpertDAO edao = new ExpertDAO();
		
		// 좋아요 카운트 업데이트 성공 여부 확인
		boolean success = edao.updateLikeCount(expert_idx, like_cnt);
        System.out.println(success);
        if (success) {
            resp.setStatus(HttpServletResponse.SC_OK);
        } else {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }

        return null;
	}
}
