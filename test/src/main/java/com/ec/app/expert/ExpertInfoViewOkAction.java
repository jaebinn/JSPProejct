package com.ec.app.expert;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ExpertDAO;
import com.ec.model.dto.ExpertCareerListDTO;
import com.ec.model.dto.ExpertDTO;
import com.ec.model.dto.ExpertLicenseListDTO;
import com.ec.model.dto.ExpertOnlyDTO;
import com.ec.model.dto.Expert_file_indexesDTO;
import com.ec.model.dto.UserDTO;

public class ExpertInfoViewOkAction implements Action {

	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		//변수
		ExpertDAO edao = null;
		
		//전문가 로그인 세션
		//com.ec.app.user.UserLoginOkAction 기준으로
		// expert_idx 가 세션 키값
		// 그리고 int형으로 넣음ㅁ
		// 아마 Integer로 들어간거같음
		
		//접근 권한 검증
		String user_id = (String) req.getSession().getAttribute("loginUser");
		Long expert_idx = (Long) req.getSession().getAttribute("expertSession");
		
		System.out.println(expert_idx);
		
		//실패시 출력할 printer
		PrintWriter out;
		
		//분기
		// 비회원
		// 회원
		//  일반
		//  전문가
		
		if(user_id == null) {
			//비회원 - 권한 없음
			resp.setContentType("text/html;charset=utf-8");
			out = resp.getWriter();
			out.print("<script>");
			out.print("alert('비로그인유저는 접근할 수 없습니다');");
			out.print("location.replace('" + req.getContextPath() + "/');");
			out.print("</script>");
		} else if(expert_idx == null) {
			//일반회원 - 권한 없음
			resp.setContentType("text/html;charset=utf-8");
			out = resp.getWriter();
			out.print("<script>");
			out.print("alert('일반유저는 접근할 수 없습니다');");
			out.print("location.replace('" + req.getContextPath() + "/');");
			out.print("</script>");
		} else if(expert_idx != null) {
			//전문가회원
			//user_id와 expert_idx 값이 DB상에 존재하는지, 둘이 일치하는지 확인
			edao = new ExpertDAO();
			ExpertDTO checker = edao.expert_info(user_id);
			if(null != checker && Long.valueOf(expert_idx) == checker.getExpert_idx()) {
				//전문가회원이 정상적으로 접근
				// 데이터 조회
				List<Object> loadedData = new ExpertInfoViewService().loadExpertInfoValueService(user_id, expert_idx.longValue());
				// 파일은 별개로 불러온다
				String originalFileName = new ExpertDAO().getProfile(expert_idx);

				if(loadedData != null) {
					//attribute에 올리기
					req.setAttribute("userdto", (UserDTO)loadedData.get(0));
					req.setAttribute("expertonlydto", (ExpertOnlyDTO)loadedData.get(1));
					req.setAttribute("expertcl", (List<ExpertCareerListDTO>)loadedData.get(2));
					req.setAttribute("expertll", (List<ExpertLicenseListDTO>)loadedData.get(3));
					req.setAttribute("expertprofile", originalFileName);
					
					ArrayList<String> keywords = new ArrayList<>();
					
					for(String ye : ((ExpertOnlyDTO)loadedData.get(1)).getKeyword_list().split(",")) {
						keywords.add(ye);
					}
					
					req.setAttribute("expertkeywords", keywords);
					
					//페이지 로딩
					Transfer transfer = new Transfer();
					transfer.setPath("/app/expert/expertinfo.jsp");
					transfer.setRedirect(false);
					return transfer;
					
				} else {
					// 조회 실패
					resp.setContentType("text/html;charset=utf-8");
					out = resp.getWriter();
					out.print("<script>");
					out.print("alert('페이지 로딩을 실패했습니다');");
					out.print("location.replace('" + req.getContextPath() + "/');");
					out.print("</script>");
				}
				
			} else {
				// 비정상적 접근
				resp.setContentType("text/html;charset=utf-8");
				out = resp.getWriter();
				out.print("<script>");
				out.print("alert('비정상적인 접근입니다');");
				out.print("location.replace('" + req.getContextPath() + "/');");
				out.print("</script>");
			}
		}
		
		return null;
	}
	
}
