package com.ec.app.u_board;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;

import javax.servlet.http.Cookie;
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

public class U_boardWriteOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//cos : http://www.servlets.com
		
				//파일이 실제로 저장될 경로
				String saveFolder = req.getServletContext().getRealPath("file");
				
				//저장될 파일의 최대 크기(1.5GB)
				int size = (int)(1024*1024*1024*1.5);
				
				//cos 이용
				MultipartRequest multi = new MultipartRequest(req, saveFolder, size,
						"UTF-8", new DefaultFileRenamePolicy());
				
				//						input[type=file]의 name 속성값들
				Enumeration<?> temp = multi.getFileNames();
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
				
				String title = multi.getParameter("title");
				String contents = multi.getParameter("contents");
				String user_id = multi.getParameter("user_id");
				
				U_boardDTO u_board = new U_boardDTO();
				u_board.setTitle(title);
				u_board.setContents(contents);
				u_board.setUser_id(user_id);
				
				U_boardDAO ubdao = new U_boardDAO();
				Transfer transfer = new Transfer();
				transfer.setRedirect(true);
				
				//파일 데이터 삽입 성공 여부
				boolean fcheck = false;
				//게시글을 쓸 때 파일을 업로드 했었는지 여부
				boolean flag = false;
				if(ubdao.insertBoard(u_board)) {
					long board_idx = ubdao.getLastNum(user_id);
					U_FileDAO ufdao = new U_FileDAO();
					
					for(String name : fileNames) {
						flag = true;
						String original_name = multi.getOriginalFileName(name);
						String system_name = multi.getFilesystemName(name);
						
						U_FileDTO ufdto = new U_FileDTO();
						ufdto.setBoard_idx(board_idx);
						ufdto.setOriginal_name(original_name);
						ufdto.setSystem_name(system_name);
						
						fcheck = ufdao.insertFile(ufdto);
						
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
								ufdao.deleteFile(system_name);
								
								//실제 경로에 존재하는 파일을 자바의 객체로 가져옴
								File file = new File(saveFolder,system_name);
								//파일이 존재한다면
								if(file.exists()) {
									//삭제
									file.delete();
								}
							}
							ubdao.deleteBoard(board_idx);
							//실패 페이지로 이동
						}
					}
					
					//get
					transfer.setPath(req.getContextPath()+"/u_boardview.ub?board_idx="+board_idx);
					
				}
				else {
					//list
					Cookie cookie = new Cookie("w","f");
					cookie.setPath("/");
					cookie.setMaxAge(1);
					resp.addCookie(cookie);
					transfer.setPath(req.getContextPath()+"/u_boardlist.ub");
				}
				return transfer;
	}
}
