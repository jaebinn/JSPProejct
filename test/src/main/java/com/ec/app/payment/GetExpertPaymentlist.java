package com.ec.app.payment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.model.dao.PaymentDAO;
import com.ec.model.dto.PaymentDTO;
import com.ec.action.Action;
import com.ec.action.Transfer;

public class GetExpertPaymentlist implements Action {

   @Override
   public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      String temp = req.getParameter("page");
      // 사용자 매칭내역 페이지이기 때문에 로그인이 되었다고 가정(로그인 세션 존재)
      Long expert_idx = ((Long) req.getSession().getAttribute("expertSession")).longValue();   
      System.out.println("ㅎㅇ");
//      String serviceDay = req.getParameter("serviceDay");
//      String startTime = req.getParameter("startTime");
//      String endTime = req.getParameter("endTime");
//      String user_request = req.getParameter("user_request");
//      String expert_name = req.getParameter("expert_name");
//      String select_keyword = req.getParameter("select_keyword");
//      String pay = req.getParameter("pay");
//      
//      System.out.println(serviceDay);
//      System.out.println(startTime);
//      System.out.println(endTime);
//      System.out.println(user_request);
//      System.out.println(expert_name);
//      System.out.println(select_keyword);
//      System.out.println(pay);
      
      int page = temp == null || temp.equals("") ? 1 : Integer.parseInt(temp);
      
      System.out.println("페이지 파라미터 : "+page);
      
      PaymentDAO pdao = new PaymentDAO();
      
      // 전체 게시글의 개수
      Long totalCnt = pdao.getPaymentListCnt(expert_idx);
      System.out.println(totalCnt);
      
      // 한 페이지에서 보여줄 게시글의 개수
      int pageSize = 5;
      
      // 페이징 처리 시 아래에 나올 페이지 번호의 개수
      int pageCnt = 10;
      
      // 아래쪽 페이징 처리 부분에 보여질 첫 번째 페이지 번호
      int startPage = (page-1)/pageCnt*pageCnt+1;
      
      // 아래쪽 페이징 처리 부분에 보여질 마지막 페이지 번호
      int endPage = startPage + (pageCnt-1);
      
      // 전체 게시글의 개수를 기반으로 한 띄워질 수 있는 가장 마지막 페이지(실제로 존재할 수 있는 가장 마지막 페이지) 번호
      int totalPage = (int) Math.ceil((double) totalCnt / pageSize);
      
      // 가장 마지막 페이지 번호(totalPage)보다 단순한 연산으로 구해진 engPage가 더 큰 경우가 있다.
      // (허구의 페이지 번호가 존재할 수 있다)그 때는 endPage를 가장 마지막 페이지 번호(totalPage)로 바꾸어 주어야 한다
      endPage = endPage > totalPage ? totalPage : endPage;
      
      int startRow = (page-1)*pageSize;
      

      // startRow와 pageSize는 int이나 세션으로 받은 userid도 매개변수로 보내주기위해 String으로
      // 보내줌 mybatis에서 자동처리가능
      
      List<PaymentDTO> list = pdao.getPaymentList(startRow,pageSize,expert_idx);
      System.out.println(list);
      System.out.println("list size : " + list.size());      
      
      req.setAttribute("list", list);
      req.setAttribute("totalPage", totalPage);
      req.setAttribute("totalCnt", totalCnt);
      req.setAttribute("startPage", startPage);
      req.setAttribute("endPage", endPage);
      req.setAttribute("page", page);

      Transfer transfer = new Transfer();
      transfer.setRedirect(false);
      transfer.setPath("/app/payment/expertPaymentList.jsp");
      
      return transfer;
   }
}
