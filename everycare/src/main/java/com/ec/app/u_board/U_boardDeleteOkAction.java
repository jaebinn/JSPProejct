package com.ec.app.u_board;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.U_FileDAO;
import com.ec.model.dao.U_boardDAO;
import com.ec.model.dao.U_replyDAO;
import com.ec.model.dto.U_FileDTO;

public class U_boardDeleteOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		long board_idx = Long.parseLong(req.getParameter("board_idx"));
		/* String keyword = req.getParameter("keyword"); */
		String temp = req.getParameter("page");
		int page = temp==null||temp.equals("") ? 1 : Integer.parseInt(temp);
		
		/* keyword = URLEncoder.encode(keyword,"UTF-8"); */
		
		U_boardDAO ubdao = new U_boardDAO();
		
		Transfer transfer = new Transfer();
		transfer.setRedirect(true);

		String saveFolder = req.getServletContext().getRealPath("file");
		U_FileDAO ufdao = new U_FileDAO();
		List<U_FileDTO> files = ufdao.getFiles(board_idx);
		
		// 파일 데이터 및 실제 파일 삭제
		for(U_FileDTO fdto : files) {
		    File file = new File(saveFolder, fdto.getSystem_name());
		    if(file.exists()) {
		        ufdao.deleteFile(fdto.getSystem_name()); // 데이터베이스에서 파일 데이터 삭제
		        file.delete(); // 실제 파일 시스템에서 파일 삭제
		    }
		}
		U_replyDAO urdao = new U_replyDAO();
		
		urdao.deleteReplyByBoard_idx(board_idx);

		// 게시글 데이터 삭제
		if(ubdao.deleteBoard(board_idx)) {
		    transfer.setPath(req.getContextPath()+"/u_boardlist.ub?page="+page);
		}
		else {			
			transfer.setPath(req.getContextPath()+"/u_boardview.ub?page="+page+"&board_idx="+board_idx);
		}
		
		return transfer;
	}
}
