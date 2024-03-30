package com.kh.app.board;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.action.Action;
import com.kh.action.Transfer;
import com.kh.model.dao.BoardDAO;
import com.kh.model.dao.FileDAO;
import com.kh.model.dto.BoardDTO;
import com.kh.model.dto.FileDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardUpdateOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String saveFolder = req.getServletContext().getRealPath("file");
		int size = (int)(1024*1024*1024*1.5);
		MultipartRequest multi = new MultipartRequest(req,saveFolder,size,"UTF-8",
				new DefaultFileRenamePolicy());
		//삭제해야 할 파일명들
		String updateCnt = multi.getParameter("updateCnt");
		String page = multi.getParameter("page");
		String keyword = multi.getParameter("keyword");
		long boardnum = Long.parseLong(multi.getParameter("boardnum"));
		String boardtitle = multi.getParameter("boardtitle");
		String boardcontents = multi.getParameter("boardcontents");
		String userid = multi.getParameter("userid");
		
		BoardDTO board = new BoardDTO();
		board.setBoardnum(boardnum);
		board.setBoardtitle(boardtitle);
		board.setBoardcontents(boardcontents);
		board.setUserid(userid);
		
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
		
		FileDAO fdao = new FileDAO();
		boolean flag = false;
		boolean fcheck = false;
		for(String name : fileNames) {
			flag = true;
			String orgname = multi.getOriginalFileName(name);
			String systemname = multi.getFilesystemName(name);
			//orgname이 null이라는 뜻은 실제 파일데이터는 날라오지 않았다는 뜻
			//기존 파일에서 변화 없이 그대로 뒀다는 뜻(새롭게 insert 하지 않아야 한다.)
			if(orgname == null){
				continue;
			}
			
			FileDTO fdto = new FileDTO();
			fdto.setBoardnum(boardnum);
			fdto.setOrgname(orgname);
			fdto.setSystemname(systemname);
			
			fcheck=fdao.insertFile(fdto);
			
			if(!fcheck) {
				break;
			}
		}
		//파일 업로드 했니?
		if(flag) {
			//DB삽입은 실패했니?
			if(!fcheck) {
				for(String name : fileNames) {
					String systemname = multi.getFilesystemName(name);
					//DB상에 있는 t_file 테이블에 올라갔던 내용들 삭제
					fdao.deleteFile(systemname);
					
					//실제 경로에 존재하는 파일을 자바의 객체로 가져옴
					File file = new File(saveFolder,systemname);
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
		
		BoardDAO bdao = new BoardDAO();
		Transfer transfer = new Transfer();
		transfer.setRedirect(true);
		if(bdao.updateBoard(board)) {
			
		}
		else {
			
		}
		String queryString = String.format("?boardnum=%s&keyword=%s&page=%s",boardnum+"",keyword,page);
		transfer.setPath(req.getContextPath()+"/boardview.bo"+queryString);
		return transfer;
	}
}












