package com.ec.app.expert;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ec.app.action.Action;
import com.ec.app.action.Transfer;
import com.ec.model.dao.ExpertDAO;
import com.ec.model.dto.ExpertDTO;

public class ExpertkeywordSortOkAction implements Action {
    @Override
    public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
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

        String selectedKeywords = req.getParameter("selectedKeywords");

        System.out.println(selectedKeywords);
        if (selectedKeywords != null && !selectedKeywords.isEmpty()) {
            List<ExpertDTO> list = edao.getExpertSortByKeyword(startRow, pageSize, selectedKeywords);

            System.out.println(list);
            Transfer transfer = new Transfer();
            if (list != null && !list.isEmpty()) {
                req.setAttribute("list", list); 
                req.setAttribute("totalCnt", totalCnt); // 전체 전문가 수 전달
	       		req.setAttribute("totalPage", totalPage); // 전체 페이지 수 전달
	       		req.setAttribute("startPage", startPage); // 시작 페이지 번호 전달
	       		req.setAttribute("endPage", endPage); // 끝 페이지 번호 전달
	       		req.setAttribute("page", page); // 현재 페이지 번호 전달
                transfer.setPath("/app/expert/expertList.jsp");
            } else {
                transfer.setPath("/app/expert/expertList.jsp");
            }
            transfer.setRedirect(false);

            return transfer;
        } else {
            Transfer transfer = new Transfer();
            transfer.setPath("/app/expert/expertList.jsp");
            transfer.setRedirect(false);
            return transfer;
        }
    }
}