package com.ec.app.expert;

import java.io.BufferedReader;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.app.action.Action;
import com.ec.app.action.Transfer;
import com.ec.model.dao.ExpertDAO;
import com.ec.model.dto.ExpertDTO;
import com.google.gson.Gson;

public class ExpertkeywordSortOkAction implements Action{
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
	    
	    
	    // POST 요청의 본문에서 데이터 읽기
	    BufferedReader reader = req.getReader();
	    StringBuilder requestData = new StringBuilder();
	    String line;
	    while ((line = reader.readLine()) != null) {
	    	requestData.append(line);
	    }
		Gson gson = new Gson();
		String jsonString = requestData.toString();
		SelectionData selectionData = gson.fromJson(jsonString, SelectionData.class);
		List<String> selectedSpheres = selectionData.getSpheres();
		    
		String temp="";
		for(String sphere : selectedSpheres) {
			temp += sphere+',';
		}
		if(temp.length() > 0 && temp.charAt(temp.length() - 1) == ',') {
		    temp = temp.substring(0, temp.length() - 1); //마지막 ,자르기
		}
		System.out.println(temp);
		
		Transfer transfer = new Transfer();
		transfer.setRedirect(false);
		
		System.out.println(Arrays.asList(temp.split(","))); //[학습시터, 등하원도우미]
		String[] keywords = temp.split(",");

		System.out.println(keywords[1]); //학습시터
		List<ExpertDTO> list = edao.getExpertSortByKeyword(keywords);
		
		PrintWriter out = resp.getWriter();
		
		if(list != null) {
			req.setAttribute("list", list); // 전문가 목록 데이터를 전달
			req.setAttribute("totalCnt", totalCnt); // 전체 전문가 수 전달
			req.setAttribute("totalPage", totalPage); // 전체 페이지 수 전달
			req.setAttribute("startPage", startPage); // 시작 페이지 번호 전달
			req.setAttribute("endPage", endPage); // 끝 페이지 번호 전달
			req.setAttribute("page", page); // 현재 페이지 번호 전달
			
			transfer.setPath("/app/expert/expertList.jsp");			
		}
		else {
			out.print("<script>");
		    out.print("alert('해당하는 전문가가 없습니다.');");
		    out.print("location.replace('/app/expert/expertList.jsp');");
		    out.print("</script>");
		}
			
		return transfer;

	}
}
