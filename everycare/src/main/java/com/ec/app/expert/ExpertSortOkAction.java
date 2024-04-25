package com.ec.app.expert;

import java.io.BufferedReader;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ExpertDAO;
import com.ec.model.dto.ExpertDTO;
import com.google.gson.Gson;

public class ExpertSortOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String psortParam = req.getParameter("psort");
        int psort = (psortParam != null && !psortParam.isEmpty()) ? Integer.parseInt(psortParam) : 1;
 
        String pageParam = req.getParameter("page");
        int page = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;
        
	    ExpertDAO edao = new ExpertDAO();

	    long totalCnt = edao.getExpertCnt();
	    int pageSize = 4;
	    int pageCnt = 10;
	    int startPage = (page - 1) / pageCnt * pageCnt + 1;
	    int endPage = startPage + (pageCnt - 1);
	    int totalPage = (int) (totalCnt - 1) / pageSize + 1;
	    
	    endPage = endPage > totalPage ? totalPage : endPage;

	    int startRow = (page - 1) * pageSize;
	    
	    
	    // POST 요청의 본문에서 데이터 읽기
	    BufferedReader reader = req.getReader();
	    StringBuilder requestData = new StringBuilder();
	    String line;
	    while ((line = reader.readLine()) != null) {
	    	requestData.append(line);
	    }
	   	
		List<ExpertDTO> list = null;
		if(psort == 1) {
			list = edao.getExpertSortByRegister(startRow, pageSize);
		}
		else if(psort == 2) {
			list = edao.getExpertSortByLike(startRow, pageSize);
		}
		else if(psort == 3) {
			list = edao.getExpertSortByLowCost(startRow, pageSize);
		}
		else if(psort == 4) {
			list = edao.getExpertSortByHighCost(startRow, pageSize);
		}
		System.out.println(list);
		HttpSession session = req.getSession();
		session.setAttribute("psort", psort);
		
		 
		 Transfer transfer = new Transfer();
		 req.setAttribute("list", list); // 전문가 목록 데이터를 전달
		 req.setAttribute("totalCnt", totalCnt); // 전체 전문가 수 전달
		 req.setAttribute("totalPage", totalPage); // 전체 페이지 수 전달
		 req.setAttribute("startPage", startPage); // 시작 페이지 번호 전달
		 req.setAttribute("endPage", endPage); // 끝 페이지 번호 전달
		 req.setAttribute("page", page); // 현재 페이지 번호 전달
		 req.setAttribute("psort", psort);
	
		 transfer.setRedirect(false);
		 String queryString = String.format("?page=%d&psort=%d",page,psort);	
			
		 transfer.setPath("/app/expert/expertList.jsp"+queryString);
		 return transfer;
	}
}
