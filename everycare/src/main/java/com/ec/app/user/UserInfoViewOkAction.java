package com.ec.app.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.UserDAO;
import com.ec.model.dto.UserDTO;

public class UserInfoViewOkAction implements Action {
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//공통으로 쓸 지역변수 선언
		UserDAO udao = new UserDAO();
		UserDTO udto = null;
				
		//로그인 체크/값 가져오기
		String loginUser = (String) req.getSession().getAttribute("loginUser");
		if(null == (udto = udao.getUserById(loginUser))) {
			//로그인검증 실패시 오류창으로 전송
			// 일단 지금은 인덱스로 보냄
			Transfer transfer = new Transfer();
			transfer.setPath(req.getContextPath() + "/index.jsp");
			transfer.setRedirect(true);
			return transfer;
		}
		
		//로그인검증 성공시 값 적재 후 userinfo.jsp로 전송
		req.setAttribute("userdto", udto);
		
		//키워드(사용자 특이사항)의 경우 List로 변환해 넣는다
		//다만 user_etc가 비어있는 경우 List에 값을 넣지는 않음
		List<String> list = new ArrayList<>();
		if(!udto.getUser_etc().isBlank()) {
			for(String keyword: udto.getUser_etc().split(",")) {
				list.add(keyword);
			}			
		}
		req.setAttribute("keywordsList", list);
		
		Transfer transfer = new Transfer();
		transfer.setPath("/app/user/userinfo.jsp");
		transfer.setRedirect(false);
		
		return transfer;
	}
}
