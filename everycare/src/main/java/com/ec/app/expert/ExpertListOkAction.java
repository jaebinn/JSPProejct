package com.ec.app.expert;

import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ExpertDAO;
import com.ec.model.dto.ExpertDTO;
import com.ec.model.dto.Expert_file_indexesDTO;

public class ExpertListOkAction implements Action {
    @Override
    public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        
        ExpertDAO edao = new ExpertDAO();
        String temp = req.getParameter("page");
        int page = temp == null || temp.equals("") ? 1 : Integer.parseInt(temp);
        
        long totalCnt = edao.getExpertCnt();
        int pageSize = 4;
        int pageCnt = 10;
        int startPage = (page - 1) / pageCnt * pageCnt + 1;
        int endPage = startPage + (pageCnt - 1);
        int totalPage = (int) (totalCnt - 1) / pageSize + 1;
        endPage = endPage > totalPage ? totalPage : endPage;

        int startRow = (page - 1) * pageSize;
        
        List<ExpertDTO> list = edao.getList(startRow, pageSize);
        
        System.out.println(list);
        req.setAttribute("list", list);
        req.setAttribute("totalPage", totalPage);
        req.setAttribute("totalCnt", totalCnt);
        req.setAttribute("startPage", startPage);
        req.setAttribute("endPage", endPage);
        req.setAttribute("page", page);

        Transfer transfer = new Transfer();
        transfer.setRedirect(false);
        transfer.setPath("/app/expert/expertList.jsp");
        return transfer;
    }
}