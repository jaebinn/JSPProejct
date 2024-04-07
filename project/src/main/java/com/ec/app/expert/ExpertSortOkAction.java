package com.ec.app.expert;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ec.app.action.Action;
import com.ec.app.action.Transfer;
import com.ec.model.dao.ExpertDAO;
import com.ec.model.dto.ExpertDTO;

public class ExpertSortOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int psort = Integer.parseInt(req.getParameter("psort"));
		String temp = req.getParameter("page");
	    int page = temp == null || temp.equals("") ? 1 : Integer.parseInt(temp);
	    ExpertDAO edao = new ExpertDAO();

	    long totalCnt = edao.getExpertCnt();
	    int pageSize = 4;
	    int pageCnt = 10;
	    int startPage = (page - 1) / pageCnt * pageCnt + 1;
	    int endPage = startPage + (pageCnt - 1);
	    int totalPage = (int) (totalCnt - 1) / pageSize + 1;
	    
	    endPage = endPage > totalPage ? totalPage : endPage;

	    int startRow = (page - 1) * pageSize;
		
		List<ExpertDTO> list = null;
		if(psort == 1) {
			list = edao.getExpertSortByLike(startRow, pageSize);
		}
		else if(psort == 2) {
			list = edao.getExpertSortByLowCost(startRow, pageSize);
		}
		else if(psort == 3) {
			list = edao.getExpertSortByHighCost(startRow, pageSize);
		}
		HttpSession session = req.getSession();
		session.setAttribute("psort", psort);
		
		Transfer transfer = new Transfer();
	    transfer.setRedirect(false);
	    transfer.setPath("/app/expert/expertList.jsp");
	    req.setAttribute("list", list); // 전문가 목록 데이터를 전달
	    req.setAttribute("totalCnt", totalCnt); // 전체 전문가 수 전달
	    req.setAttribute("totalPage", totalPage); // 전체 페이지 수 전달
	    req.setAttribute("startPage", startPage); // 시작 페이지 번호 전달
	    req.setAttribute("endPage", endPage); // 끝 페이지 번호 전달
	    req.setAttribute("page", page); // 현재 페이지 번호 전달

	    return transfer;
	}
}
