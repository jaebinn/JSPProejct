package com.kh.app.reply;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.action.Action;
import com.kh.action.Transfer;
import com.kh.model.dao.ReplyDAO;
import com.kh.model.dto.ReplyDTO;

public class ReplyWriteOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		long boardnum = Long.parseLong(req.getParameter("boardnum"));
		String replycontents = req.getParameter("replycontents");
		String userid = (String)req.getSession().getAttribute("loginUser");
		String page = req.getParameter("page");
		String keyword = req.getParameter("keyword");
		
		ReplyDTO reply = new ReplyDTO();
		reply.setBoardnum(boardnum);
		reply.setReplycontents(replycontents);
		reply.setUserid(userid);
		
		ReplyDAO rdao = new ReplyDAO();
//		Transfer transfer = new Transfer();
//		transfer.setRedirect(true);
//		transfer.setPath(req.getContextPath()+"/boardview.bo?boardnum=");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		out.print("<script>");
		if(rdao.insertReply(reply)) {
			out.print("alert('댓글 등록 성공!');");
		}
		else {
			out.print("alert('댓글 등록 실패!');");
		}
		//location.replace('/boardview.bo?boardnum=1&keyword=지우개&page=1')
		String format = String.format("location.replace('%s/boardview.bo?boardnum=%s&keyword=%s&page=%s')",
				req.getContextPath(),boardnum+"",keyword,page);
		out.print(format);
		out.print("</script>");
		
		return null;
	}
}






