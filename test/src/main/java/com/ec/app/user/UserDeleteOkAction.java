package com.ec.app.user;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.UserDAO;
import com.ec.model.dto.UserDTO;
import com.ec.model.dao.U_boardDAO;
import com.ec.model.dao.U_FileDAO;
import com.ec.model.dto.U_FileDTO;




public class UserDeleteOkAction implements Action {
	
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8");
		String userid = req.getParameter("user_id");
		System.out.println("=============================");
		System.out.println("유저 아이디 ::"+userid);
		String userpw = req.getParameter("pw");
		System.out.println("=============================");
		System.out.println("유저 비밀번호 ::"+userpw);
		HttpSession session = req.getSession();
		// ---------------------------------------------------------------
		

		U_boardDAO bdao = new U_boardDAO();
		U_FileDTO fdto = new U_FileDTO();
		U_FileDAO fdao = new U_FileDAO();
		Transfer transfer = new Transfer();
		transfer.setRedirect(true);
		//파일 폴더 1개로 병합
		String saveFolder = req.getServletContext().getRealPath("file"); 

		// -------------------------------------------------------------------

		PrintWriter out = resp.getWriter();
		UserDAO udao = new UserDAO();
		// 일반 유저인지 전문가 유저인지 판별
		UserDTO temp = udao.getUserById(userid);
		Long Expert_idx = udao.SelectExpertIdx(userid);
		
		System.out.println("Expert_idx ::"+Expert_idx);
		
		fdto.setSystem_name(fdao.getUFiles(Expert_idx));
		if(Expert_idx == null || Expert_idx ==0) {
			System.out.println("일반유저 입니다.");
			System.out.println("전문가 정보가 없습니다.");
			System.out.println("Expert_idx ::"+Expert_idx);
		}
		else {
			String file_ename = ""+(fdao.getUFiles(Expert_idx));
			System.out.println("file_ename ::"+file_ename);
		}
		
//아이디/비밀번호를 입력하지 않은경우===============================================================
		if (userid.equals("") || userpw.equals("")) {

			out.print("<script>");
			out.print("alert('아이디/비밀번호를 입력하세요 ');");

			out.print("location.replace('" + req.getContextPath() + "./user-delete.jsp')");
			out.print("</script>");
//			Transfer transfer = new Transfer();
			
			
//===============================================================================================
		} 
		
		
			
		//일반유저 정보삭제 시작
			if (Expert_idx==null ||Expert_idx==0) {
				System.out.println("=============================");
				System.out.println("일반유저 정보삭제 로직 시작");
				Long board_idx = udao.SelectboardIdx(userid);
				
				System.out.println("board_idx ::"+board_idx);
//				List<U_FileDTO> files = fdao.getFiles(board_idx);
				if(board_idx == null) {
					//Long RE_idx = udao.selectReviewExpertIdx(userid);
					
					Long RE_idx = (Long)session.getAttribute("expertSession");								//Long board_idx = (Long)session.getAttribute("expertSession");
					
					System.out.println("해당 유저와 관련된 board_idx 를 찾을 수 없습니다.");
					udao.deleteReview(userid);
					System.out.println("리뷰 삭제 완료");
					udao.deleteReviewIdx(RE_idx);
					udao.deleteUser(userid);
					udao.deleteExpert(userid);

					session.removeAttribute("loginUser");
					
					session.setAttribute("loginUser", null);
					out.print("<script>");
					out.print("alert('회원 탈퇴 처리가 완료되었습니다.');");
					out.print("location.replace('" + req.getContextPath() + "./index.jsp')");
					out.print("</script>");
					System.out.println("=============================");
					System.out.println("(게시글 없는)일반유저 정보 삭제 완료.");
//					transfer.setRedirect(false);
//					transfer.setPath("/index.jsp");
					
					
				}
				else{
					List<U_FileDTO> files = fdao.getFiles(board_idx);
					for(U_FileDTO fdto1 : files) {
						File file_e = new File(saveFolder, ((U_FileDTO) fdto1).getSystem_name());
						if(!file_e.exists()) {
							System.out.println("게시판 파일(이)가 없습니다.");
						}
						if(file_e.exists()) {
							
							file_e.delete();
							System.out.println("일반유저의 게시판 파일 삭제 완료");
						}
						else {
							System.out.println("파일 삭제 실패 / 파일이 없습니다");
						}
					}
					// 리뷰 지우는 로직 --------------------------------------------------
					udao.deleteReview(userid);
					Long RE_idx = (Long)session.getAttribute("expertSession");	
					udao.deleteReviewIdx(RE_idx);	
					
					//리뷰 로직 끝---------------------------------------------------------------------------
					
				udao.deleteUser(userid);
				
				udao.deleteExpert(userid);
				session.removeAttribute("loginUser");
				
				session.setAttribute("loginUser", null);
				out.print("<script>");
				out.print("alert('회원 탈퇴 처리가 완료되었습니다.');");

				out.print("location.replace('" + req.getContextPath() + "./index.jsp')");
				out.print("</script>");
				System.out.println("=============================");
				System.out.println("(게시판 파일이 있는)일반유저 정보 삭제 완료.");
//				transfer.setRedirect(false);
//				transfer.setPath("/index.jsp");
				
				}
			} 
			//일반유저 로직 끝
			
			
			
			if (temp == null) {
				out.print("<script>");
				out.print("alert('아이디 / 비밀번호가 일치하지 않습니다. ');");
				
				out.print("location.replace('" + req.getContextPath() + "./user-delete.jsp')");
				out.print("</script>");
			} 
			//전문가유저 로직 시작
			System.out.println("전문가 번호 :: "+Expert_idx);
			if (temp.getPw().equals(userpw)) {
				System.out.println("전문가 번호 :: "+Expert_idx);
				if(!(Expert_idx == null)) {
				
				System.out.println("전문가 번호 :: "+Expert_idx);


				fdto.setSystem_name(fdao.getUFiles(Expert_idx));
				Long board_idx = udao.SelectboardIdx(userid);
//				List<U_FileDTO> files = fdao.getFiles(board_idx);
				
				
				if(board_idx == null || board_idx == 0) {
					try {
						System.out.println("board_idx가 존재하지 않습니다");
//					List<U_FileDTO> files = fdao.getFiles(board_idx);
						System.out.println(fdto.getSystem_name());
						File file_u = new File(saveFolder, fdto.getSystem_name());  //null point
						
						
							file_u.delete();
							System.out.println("file_u 삭제");
							System.out.println("게시판의 파일을 찾을 수 없어 프로필 파일만 삭제했습니다.");
						
						// 리뷰 지우는 로직 ------------------------------------------------
						udao.deleteReview(userid);
						Long RE_idx = (Long)session.getAttribute("expertSession");	
						udao.deleteReviewIdx(RE_idx);
						//리뷰 로직 끝----------------------------------------------------------------------------
						udao.deleteUser(userid);

						udao.deleteExpert(userid);
//					
						session.removeAttribute("loginUser");
						
						session.setAttribute("loginUser", null);
						out.print("<script>");
						out.print("alert('회원 탈퇴 처리가 완료되었습니다.');");
						session.removeAttribute("loginUser");

						session.setAttribute("loginUser", null);
						out.print("location.replace('" + req.getContextPath() + "./index.jsp')");
						out.print("</script>");
						System.out.println("(게시판 정보가 없는)전문가 유저 정보 삭제 완료.");

						
						if(file_u == null || !file_u.exists()) {
							System.out.println("전문가 유저가 올린 파일(이)가 존재하지 않습니다");
							List<U_FileDTO> files = fdao.getFiles(board_idx);
						if(files.equals(null) || files == null) {
							System.out.println("files 가 존재하지 않습니다");
						}
						
						 if(!(files==null)) {
							for(U_FileDTO fdto1 : files) {
								File file_e = new File(saveFolder, ((U_FileDTO) fdto1).getSystem_name());
								if(!file_e.exists()) {
									System.out.println("file(이)가 없습니다.");
								}
								if(file_e.exists()) {
									
									file_e.delete();
									System.out.println("파일 삭제 완료");
								}
								else {
									System.out.println("파일 삭제 실패 / 파일이 없습니다");
								}
							}
							file_u.delete();
							System.out.println("file_u 삭제");
							System.out.println("게시판의 파일을 찾을 수 없어 프로필 파일만 삭제했습니다.");
						}
						}
						// 리뷰 지우는 로직 ------------------------------------------------
						udao.deleteReview(userid);
						
						udao.deleteReviewIdx(RE_idx);
						//리뷰 로직 끝----------------------------------------------------------------------------
						udao.deleteUser(userid);

						udao.deleteExpert(userid);
//					
						session.removeAttribute("loginUser");
						
						session.setAttribute("loginUser", null);
						out.print("<script>");
						out.print("alert('회원 탈퇴 처리가 완료되었습니다.');");
						out.print("location.replace('" + req.getContextPath() + "./index.jsp')");
						out.print("</script>");
						System.out.println("전문가 유저 정보 삭제 완료.");
//					transfer.setRedirect(false);
//					transfer.setPath("/index.jsp");
					} catch (Exception e) {
						e.printStackTrace();
					}
					
				}
				else {
				System.out.println("board_idx ::"+board_idx);
				List<U_FileDTO> files1 = fdao.getFiles(board_idx);
				fdto.setSystem_name(fdao.getUFiles(Expert_idx));
					for(U_FileDTO fdto1 : files1) {
						File file_e = new File(saveFolder, ((U_FileDTO) fdto1).getSystem_name());
						if(!file_e.exists()) {
							System.out.println("file(이)가 없습니다.");
						}
						if(file_e.exists()) {
							
							file_e.delete();
						}
					}
				System.out.println("files ::"+files1);
				fdto.setSystem_name(fdao.getUFiles(Expert_idx)); //find 1
				
				File file_u = new File(saveFolder, fdto.getSystem_name());
				if(file_u == null|| !file_u.exists()) {
					System.out.println("file_u ::"+file_u);
					System.out.println("file_u 가 없습니다.");
				}

				System.out.println("유저의 파일을 불러왔는가?(프로필 파일) "+file_u);

				
					System.out.println("=============================");
					System.out.println("전문가 유저 정보 삭제 로직 시작");
					// ----------------------------------------

					

						System.out.println("=============================");

						System.out.println("=============================");
						System.out.println("(file_u)경로 안의 파일이름 ::"+file_u);

						System.out.println("(file_u)파일 존재 여부 ::"+file_u.exists());

						System.out.println("(file_u)파일 삭제 여부 ::"+file_u.delete());

						

						if(file_u.exists()) {
							file_u.delete();
							System.out.println("file_u 삭제");
						}
						// 리뷰 지우는 로직-----------------------------------------
						udao.deleteReview(userid);
						Long RE_idx = (Long)session.getAttribute("expertSession");	
						udao.deleteReviewIdx(RE_idx);
						//리뷰 로직 끝------------------------------------------------------------------
						udao.deleteUser(userid);

						udao.deleteExpert(userid);

						session.removeAttribute("loginUser");
						
						session.setAttribute("loginUser", null);
						out.print("<script>");
						out.print("alert('회원 탈퇴 처리가 완료되었습니다.');");
						out.print("location.replace('" + req.getContextPath() + "./index.jsp')");
						out.print("</script>");
						
						System.out.println("전문가 유저 정보 삭제 완료.");
//						transfer.setRedirect(false);
//						transfer.setPath("/index.jsp");
						
						}
				
				// ---------------------------------------

			}}  if (!temp.getPw().equals(userpw) || !temp.getUser_id().equals(userid)) {
				req.getSession().setAttribute("loginUser", userid);
				out.print("<script>");
				out.print("alert('아이디/비밀번호를 다시 확인해주세요 ');");

				out.print("location.replace('" + req.getContextPath() + "./user-delete.jsp')");
				out.print("</script>");
			}
		
		return null;

	}
}
