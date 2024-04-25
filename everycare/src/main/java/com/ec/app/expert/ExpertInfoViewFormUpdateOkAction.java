package com.ec.app.expert;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ExpertDAO;
import com.ec.model.dao.UserDAO;
import com.ec.model.dto.ExpertOnlyDTO;
import com.ec.model.dto.Expert_file_indexesDTO;
import com.ec.model.dto.UserDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ExpertInfoViewFormUpdateOkAction implements Action {
	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//폼으로 온 수정 요청은 처리 > 리다이렉트로 처리
		// 수정된 값을 가져오는것은 ExpertInfoViewOkAction서 처리
		
		//로그인검증
		String loginUser = (String) req.getSession().getAttribute("loginUser");
		Integer expert_idx = (Integer) req.getSession().getAttribute("expertSession");
		//일단 냅둠
		
		switch(req.getParameter("formname")) {
		case "main":
			//입력값 검증
			boolean isPwUpdated = true;
			if(req.getParameter("user-existing-pw").isBlank()) {
				isPwUpdated = false;
			};
			
			//dto에 적재
			UserDTO mudto = new UserDTO();
			ExpertOnlyDTO meodto = new ExpertOnlyDTO();
			mudto.setUser_id(loginUser);
			meodto.setUser_id(loginUser);
			mudto.setName(req.getParameter("user-name"));
			mudto.setGender(req.getParameter("real-user-sex"));
			mudto.setAge(req.getParameter("user-age"));
			meodto.setIs_drivable(req.getParameter("expert-drivable").equals("Y") ? true : false);
			meodto.setAccount(req.getParameter("expert-account"));
			meodto.setCost(Integer.parseInt(req.getParameter("expert-cost")));
			
			if(isPwUpdated) {
				mudto.setPw(req.getParameter("user-modified-pw"));
			}
			
			//service 호출 - 성공여부 분기
			if(new ExpertInfoViewService().updateMainFormService(mudto, meodto, isPwUpdated)) {
				//성공
				resp.setContentType("text/html;charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.print("<script>");
				out.print("alert('정보가 수정되었습니다');");
				out.print("location.replace('" + req.getContextPath() + "/expertinfo.ep');");
				out.print("</script>");
				return null;
			}
			//실패시 switch 탈출 - 그 후 처리
			break;
		case "contacts":
			//dto에 적재
			UserDTO cudto = new UserDTO();
			cudto.setUser_id(loginUser);
			cudto.setTel_mobile(req.getParameter("user-tel-mobile"));
			cudto.setTel_sub(req.getParameter("user-tel-sub"));
			cudto.setEmail(req.getParameter("user-email"));
			cudto.setZipcode(req.getParameter("user-zipcode"));
			cudto.setAddr(req.getParameter("user-addr"));
			cudto.setAddr_detail(req.getParameter("user-addr-detail"));
			cudto.setAddr_etc(req.getParameter("user-addr-etc"));
			
			//service 호출 - 성공여부 분기
			//임마는 한군데에만 넣으면 되니 그냥 바로 DAO를 호출
			if(new UserDAO().updateContactsForm(cudto)) {
				//성공
				resp.setContentType("text/html;charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.print("<script>");
				out.print("alert('정보가 수정되었습니다');");
				out.print("location.replace('" + req.getContextPath() + "/expertinfo.ep');");
				out.print("</script>");
				return null;
			}
			//실패시 switch 탈출 - 그 후 처리
			break;
		case "resume":
			//dto에 적재
			ExpertOnlyDTO reodto = new ExpertOnlyDTO();
			reodto.setUser_id(loginUser);
			reodto.setResume(req.getParameter("expert-resume"));
			
			//service 호출 - 성공여부 분기
			//임마는 한군데에만 넣으면 되니 그냥 바로 DAO를 호출
			if(new ExpertDAO().updateResumeForm(reodto)) {
				//성공
				resp.setContentType("text/html;charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.print("<script>");
				out.print("alert('정보가 수정되었습니다');");
				out.print("location.replace('" + req.getContextPath() + "/expertinfo.ep');");
				out.print("</script>");
				return null;
			}
			//실패시 switch 탈출 - 그 후 처리
			break;
		case "etcinfo":
			//dto에 적재
			ExpertOnlyDTO eeodto = new ExpertOnlyDTO();
			eeodto.setUser_id(loginUser);
			eeodto.setLocation(req.getParameter("expert-location"));
			eeodto.setAvailable_time(req.getParameter("expert-available-time"));
			
			//service 호출 - 성공여부 분기
			//임마는 한군데에만 넣으면 되니 그냥 바로 DAO를 호출
			if(new ExpertDAO().updateEtcinfoForm(eeodto)) {
				//성공
				resp.setContentType("text/html;charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.print("<script>");
				out.print("alert('정보가 수정되었습니다');");
				out.print("location.replace('" + req.getContextPath() + "/expertinfo.ep');");
				out.print("</script>");
				return null;
			}
			//실패시 switch 탈출 - 그 후 처리
			break;
		case "keywords":
			//dto에 적재
			ExpertOnlyDTO eodto = new ExpertOnlyDTO();
			eodto.setExpert_idx(Long.valueOf(expert_idx));
			eodto.setKeyword_list(req.getParameter("keywordlist"));
			
			//바로 DAO 호출
			if(new ExpertDAO().updateKeywordList(eodto)) {
				//성공
				resp.setContentType("text/html;charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.print("<script>");
				out.print("alert('정보가 수정되었습니다');");
				out.print("location.replace('" + req.getContextPath() + "/expertinfo.ep');");
				out.print("</script>");
				return null;
			}
			break;
		default:
			//전송값이 없거나 식별자(name=formname)이 잘못됨
			break;
		}

		//실패
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print("<script>");
		out.print("alert('수정을 실패했습니다');");
		out.print("location.replace('" + req.getContextPath() + "/expertinfo.ep');");
		out.print("</script>");
		return null;
	}
}
