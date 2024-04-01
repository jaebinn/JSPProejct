package com.kh.app.reply;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.action.Action;
import com.kh.action.Transfer;
import com.kh.model.dao.ReplyDAO;

public class ReplyDeleteOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		long replynum = Long.parseLong(req.getParameter("replynum"));
		long boardnum = Long.parseLong(req.getParameter("boardnum"));
		String keyword = req.getParameter("keyword");
		String page = req.getParameter("page");
		
		ReplyDAO rdao = new ReplyDAO();
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		out.print("<script>");
		if(rdao.deleteReply(replynum)) {
			out.print("alert('댓글 삭제 성공!');");
		}
		else {
			out.print("alert('댓글 삭제 실패!');");
		}
		//location.replace('/boardview.bo?boardnum=1&keyword=지우개&page=1')
		String format = String.format("location.replace('%s/boardview.bo?boardnum=%s&keyword=%s&page=%s')",
				req.getContextPath(),boardnum+"",keyword,page);
		out.print(format);
		out.print("</script>");
		return null;
	}
}
