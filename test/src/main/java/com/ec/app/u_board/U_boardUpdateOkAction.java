package com.ec.app.u_board;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.U_FileDAO;
import com.ec.model.dao.U_boardDAO;
import com.ec.model.dto.U_FileDTO;
import com.ec.model.dto.U_boardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class U_boardUpdateOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String saveFolder = req.getServletContext().getRealPath("file");
		int size = (int)(1024*1024*1024*1.5);
		
		MultipartRequest multi = new MultipartRequest(req,saveFolder,size,"UTF-8",new DefaultFileRenamePolicy());
		//삭제해야 할 파일명들
		String updateCnt = multi.getParameter("updateCnt");
		System.out.println("updateCnt:"+updateCnt);
		String page = multi.getParameter("page");
		/* String keyword = multi.getParameter("keyword"); */
		long board_idx = Long.parseLong(multi.getParameter("board_idx"));
		String title = multi.getParameter("title");
		String contents = multi.getParameter("contents");
		String user_id = multi.getParameter("user_id");
		
		U_boardDTO u_board = new U_boardDTO();
		u_board.setBoard_idx(board_idx);
		u_board.setTitle(title);
		u_board.setContents(contents);
		u_board.setUser_id(user_id);
		
		//input[type=file] 의 name들
		Enumeration<?> temp = multi.getFileNames();
		ArrayList<String> fileNames = new ArrayList<String>();
		while(temp.hasMoreElements()) {
			fileNames.add((String)temp.nextElement());
		}
		//fileNames 리스트에는 모든 input[type=file]의 name들이 거꾸로 추가되어 있다.
		int len = fileNames.size();
		Collections.reverse(fileNames);
		System.out.println("filenames : "+fileNames);
		
		U_FileDAO fdao = new U_FileDAO();
		boolean flag = false;
		boolean fcheck = false;
		for(String name : fileNames) {
			flag = true;
			String original_name = multi.getOriginalFileName(name);
			String system_name = multi.getFilesystemName(name);
			//orgname이 null이라는 뜻은 실제 파일데이터는 날라오지 않았다는 뜻
			//기존 파일에서 변화 없이 그대로 뒀다는 뜻(새롭게 insert 하지 않아야 한다.)
			if(original_name == null){
				continue;
			}
			
			U_FileDTO ufdto = new U_FileDTO();
			ufdto.setBoard_idx(board_idx);
			ufdto.setOriginal_name(original_name);
			ufdto.setSystem_name(system_name);
			
			fcheck=fdao.insertFile(ufdto);
			
			if(!fcheck) {
				break;
			}
		}
		//파일 업로드 했니?
		if(flag) {
			//DB삽입은 실패했니?
			if(!fcheck) {
				for(String name : fileNames) {
					String system_name = multi.getFilesystemName(name);
					//DB상에 있는 t_file 테이블에 올라갔던 내용들 삭제
					fdao.deleteFile(system_name);
					
					//실제 경로에 존재하는 파일을 자바의 객체로 가져옴
					File file = new File(saveFolder,system_name);
					//파일이 존재한다면
					if(file.exists()) {
						//삭제
						file.delete();
					}
				}
				//실패 페이지로 이동
			}
		}
		
		//수정 혹은 삭제된 기존 파일들을 지우기 위한 로직
		String[] deleteFiles = updateCnt.split("\\\\");
		for(String name : deleteFiles) {
			File file = new File(saveFolder,name);
			if(file.exists()) {
				file.delete();
				fdao.deleteFile(name);
			}
		}
		
		U_boardDAO ubdao = new U_boardDAO();
		Transfer transfer = new Transfer();
		transfer.setRedirect(true);
		if(ubdao.updateBoard(u_board)) {
			
		}
		else {
			
		}
		String queryString = String.format("?board_idx=%s&page=%s",board_idx+"",page);
		transfer.setPath(req.getContextPath()+"/u_boardview.ub"+queryString);
		return transfer;
	}
}
