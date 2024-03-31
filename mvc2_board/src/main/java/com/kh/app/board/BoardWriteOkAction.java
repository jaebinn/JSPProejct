package com.kh.app.board;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;

import javax.servlet.http.Cookie;
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

public class BoardWriteOkAction implements Action {
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//cos : http://www.servlets.com
		
		//파일이 실제로 저장될 경로
		String saveFolder = req.getServletContext().getRealPath("file");
		System.out.println(saveFolder);
		
		//저장될 파일의 최대 크기(1.5GB)
		int size = (int)(1024*1024*1024*1.5);
		
		//cos 이용 / DefaultFileRenamePolicy()는 똑같은 파일명이 올라 간다면 
		//파일명뒤에 숫자 붙히는 것.
		MultipartRequest multi = new MultipartRequest(req, saveFolder, size,
				"UTF-8", new DefaultFileRenamePolicy());
		
		//						input[type=file]의 name 속성값들
		Enumeration<?> temp = multi.getFileNames(); //multi.getFileNames()가 타입이 Enumeration(열거형)이기 때문에
		ArrayList<String> fileNames = new ArrayList<String>();
		while(temp.hasMoreElements()) {
			fileNames.add((String)temp.nextElement());
		}
		//fileNames 리스트에는 모든 input[type=file]의 name들이 추가되어 있다.
		//비어있는 input[type=file] name도 추가되어 있으므로
		int len = fileNames.size();
		//비어있는 그 name 하나 삭제
		fileNames.remove("file"+(len-1));
		
		Collections.reverse(fileNames);
		
		//req객체가 multi객체에 속해버렸기 때문에 multi를 사용한 순간부터 multi로 변경 
		String boardtitle = multi.getParameter("boardtitle");
		String boardcontents = multi.getParameter("boardcontents");
		String userid = multi.getParameter("userid");
		
		BoardDTO board = new BoardDTO();
		board.setBoardtitle(boardtitle);
		board.setBoardcontents(boardcontents);
		board.setUserid(userid);
		
		System.out.println(board.getBoardtitle());
		System.out.println(board.getBoardcontents());
		System.out.println(board.getUserid());
		
		BoardDAO bdao = new BoardDAO();
		Transfer transfer = new Transfer();
		transfer.setRedirect(true);
		
		//파일 데이터 삽입 성공 여부
		boolean fcheck = false;
		//게시글을 쓸 때 파일을 업로드 했었는지 여부
		boolean flag = false;
		if(bdao.insertBoard(board)) {
			long boardnum = bdao.getLastNum(userid);
			FileDAO fdao = new FileDAO();
			
			for(String name : fileNames) {
				flag = true;
				String orgname = multi.getOriginalFileName(name);
				String systemname = multi.getFilesystemName(name);
				
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
					bdao.deleteBoard(boardnum);
					//실패 페이지로 이동
				}
			}
			
			//get
			transfer.setPath(req.getContextPath()+"/boardview.bo?boardnum="+boardnum);
			
		}
		else {
			//list
			Cookie cookie = new Cookie("w","f");
			cookie.setPath("/");
			cookie.setMaxAge(1);
			resp.addCookie(cookie);
			transfer.setPath(req.getContextPath()+"/boardlist.bo");
		}
		return transfer;
	}
}









