package com.ec.app.expert;

import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ExpertDAO;
import com.ec.model.dto.ExpertDTO;

public class ExpertkeywordSortOkAction implements Action {
    @Override
    public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String pageParam = req.getParameter("page");
        int page = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;
        String selectedKeywords = req.getParameter("selectedKeywords");
        ExpertDAO edao = new ExpertDAO();

        Transfer transfer = new Transfer();

        if (selectedKeywords == null || selectedKeywords.isEmpty()) {
            // selectedKeywords가 null이거나 비어있을 때의 처리
            transfer.setPath("/expertsort.ep?psort=1");
            transfer.setRedirect(false);
            return transfer;
        }

        
        long totalCnt = edao.getExpertKeywordCnt(selectedKeywords);
        System.err.println(totalCnt);
        int pageSize = 4;
        int pageCnt = 10;
        int startPage = (page - 1) / pageCnt * pageCnt + 1;
        int endPage = startPage + (pageCnt - 1);
        int totalPage = (int) (totalCnt - 1) / pageSize + 1;

        endPage = endPage > totalPage ? totalPage : endPage;

        int startRow = (page - 1) * pageSize;
        
        System.out.println(selectedKeywords);
        
        List<ExpertDTO> list = edao.getExpertSortByKeyword(startRow, pageSize, selectedKeywords);

        System.out.println(list);

        if (list != null && !list.isEmpty()) {
            req.setAttribute("list", list); 
            req.setAttribute("totalCnt", totalCnt); // 전체 전문가 수 전달
	       	req.setAttribute("totalPage", totalPage); // 전체 페이지 수 전달
	       	req.setAttribute("startPage", startPage); // 시작 페이지 번호 전달
	       	req.setAttribute("endPage", endPage); // 끝 페이지 번호 전달
	       	req.setAttribute("page", page); // 현재 페이지 번호 전달
	       	req.setAttribute("keyword", selectedKeywords);
            transfer.setPath("/app/expert/expertSortList.jsp?page="+page+"&keyword="+selectedKeywords);
        } else {
            // 전문가가 없을 때의 처리
//            out.print("<script>");
//            out.print("alert('해당하는전문가가 없습니다.')");
//            out.print("</script>");
            transfer.setPath("/expertsort.ep?psort=1");
        }
        transfer.setRedirect(false);
        return transfer;
    }
}