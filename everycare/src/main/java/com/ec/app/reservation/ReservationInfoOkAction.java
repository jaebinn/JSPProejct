package com.ec.app.reservation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ChatDAO;
import com.ec.model.dao.ExpertDAO;
import com.ec.model.dao.UserDAO;
import com.ec.model.dto.ChatDTO;
import com.ec.model.dto.ExpertDTO;
import com.ec.model.dto.UserDTO;

public class ReservationInfoOkAction implements Action{
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Long chat_idx = Long.parseLong(req.getParameter("chat_idx"));
		HttpSession session = req.getSession();
        String user_id = (String) session.getAttribute("loginUser");
        UserDAO udao = new UserDAO();
        UserDTO user = udao.getUserById(user_id);
		ChatDAO chatdao = new ChatDAO();
		ChatDTO chat = chatdao.getChatInfo(chat_idx); //채팅 정보 필드 가져오기(chat_idx)
		ExpertDAO edao = new ExpertDAO();
		String expert_name = chatdao.getExpertNameByID(chat_idx);
		System.out.println(expert_name);
		ExpertDTO expert = edao.getExpertInfoByChat(chat_idx); //전문가 정보 가져오기(chat_idx)
		long expert_idx = expert.getExpert_idx();
		String expert_phone = edao.getExpertPhone(expert); //전문가 연락처 가져오기 
		String availableTime = edao.getAvailableTime(expert_idx); // 전문가의 가능한 시간을 가져온다.
		
		String[] times = availableTime.split("~"); // "~"를 기준으로 문자열을 분할한다.
		String startTime = times[0].trim(); // 시작 시간을 추출하고 공백을 제거한다.
		String endTime = times[1].trim(); // 종료 시간을 추출하고 공백을 제거한다.

		// 추출된 시작 시간과 종료 시간을 출력한다.
		System.out.println("Start Time: " + startTime);
		System.out.println("End Time: " + endTime);
		Transfer transfer = new Transfer();
		if(chat != null) {
			req.setAttribute("chat", chat);			
			req.setAttribute("user", user);		
			req.setAttribute("expert", expert);		
			req.setAttribute("expert_name", expert_name);
			req.setAttribute("expert_phone", expert_phone);
			req.setAttribute("startTime", startTime);
			req.setAttribute("endTime", endTime);
		}
		transfer.setRedirect(false);
		transfer.setPath("/app/reservation/reservation.jsp");
		
		return transfer;
	}
}
