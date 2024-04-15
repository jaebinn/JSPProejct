package com.ec.app.expert;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.model.dao.ExpertDAO;
import com.ec.model.dto.ExpertCareerListDTO;
import com.ec.model.dto.ExpertDTO;
import com.ec.model.dto.ExpertLicenseListDTO;
import com.ec.action.Action;
import com.ec.action.Transfer;

public class ExpertAddOkAction implements Action{

	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8");
		
		ExpertDTO expertdto = new ExpertDTO();
		ExpertCareerListDTO expertcarrerdto = new ExpertCareerListDTO();
		ExpertLicenseListDTO expertlicensedto = new ExpertLicenseListDTO();
		
		// 전문가테이블의 들어갈 정보들 파라미터 수집
		
		expertdto.setUser_id(req.getParameter("e_id_value"));
		expertdto.setResume(req.getParameter("resume_value"));
		
		Boolean boo = true;
		if(req.getParameter("is_drivable_yes") == "is_drivable_no") {
			expertdto.setIs_drivable(!boo);
		} else {
			expertdto.setIs_drivable(boo);
		}
	
		expertdto.setLocation(req.getParameter("location_value"));
		
//		String keywordH[] = req.getParameterValues("keywordH");
		expertdto.setKeyword_list(req.getParameter("keywordH"));
//		System.out.println("확인!"+keywordH[0]);
//		
//		
//		for(int l = 0; l < keywordH.length; l++) {
//			if(keywordH[l] != null && keywordH[l] != "") {
//				expertdto.setKeyword_list(keywordH[l]);
//			}
//		}
		
		expertdto.setAvailable_time(req.getParameter("available_time_value"));
		expertdto.setCost(Integer.parseInt(req.getParameter("cost_value")));
		expertdto.setAccount(req.getParameter("account_value"));
		
		// 전문가의 경력과 자격증을 제외한것부터 저장
		ExpertDAO edao = new ExpertDAO();
		edao.insertExpert(expertdto);
		
		// 저장해야 expert_idx가 생성됨 이걸 경력테이블과 자격증 테이블에 넣어줘야함
		Long expert_idx = edao.expert_info(expertdto.getUser_id()).getExpert_idx();
		
		
		// 전문가의 경력테이블에 들어갈 정보들 파라미터 수집
		String career_name[] = req.getParameterValues("career_name");
		String start_time[] = req.getParameterValues("start_time");
		String end_time[] = req.getParameterValues("end_time");
		
		// start_time과 end_time이 String으로 받았지만 sql.date로 변환해서 넣어야함
		
		for(int i = 0; i < career_name.length; i++) {
			if(career_name[i] != null && career_name[i] != "" && 
				start_time[i] != null && start_time[i] != "" &&
				end_time[i] != null && end_time[i] != "") {
				expertcarrerdto.setExpert_idx(expert_idx);
				expertcarrerdto.setCareer_name(career_name[i]);
				
				// start_time[]배열의 첫번째 요소 가져오기
				String start_timeStr = start_time[i];
				String end_timeStr = end_time[i];
				// java.util.Date로 파싱
				SimpleDateFormat dateFormat_start_timeStr = new SimpleDateFormat("yyyyMMdd");
				SimpleDateFormat dateFormat_end_timeStr = new SimpleDateFormat("yyyyMMdd");
				try {
					// start_time
					java.util.Date Util_start_time = dateFormat_start_timeStr.parse(start_timeStr);
					java.sql.Date Sql_start_time = new java.sql.Date(Util_start_time.getTime());
					expertcarrerdto.setStart_time(Sql_start_time);
					// end_time
					java.util.Date Util_end_time = dateFormat_end_timeStr.parse(end_timeStr);
					java.sql.Date Sql_end_time = new java.sql.Date(Util_end_time.getTime());
					expertcarrerdto.setEnd_time(Sql_end_time);
				} catch (ParseException e) {
					System.out.println("경력기간 파싱 과정에서 타입 미스매치오류"+e);
					e.printStackTrace();
				}
				edao.insertExpert_career_list(expertcarrerdto);
			}
		}
		// 전문가의 라이센스테이블에 들어갈 정보들 파라미터 수집
		String license_name[] = req.getParameterValues("license_name");
		String acquire_date[] = req.getParameterValues("acquire_date");
		for(int j = 0; j < license_name.length; j++) {
			if(license_name[j] != null && license_name[j] != "" &&
				acquire_date[j] != null && acquire_date[j] != "") {
				expertlicensedto.setExpert_idx(expert_idx);
				expertlicensedto.setLicense_name(license_name[j]);
				
				// acquire_date[] 배열의 첫번째 요소 가져오기
				String acquire_dateStr = acquire_date[j];
				// java.util.Date로 파싱
				SimpleDateFormat dateFormat_acquire_dateStr = new SimpleDateFormat("yyyyMMdd");
				
				try {
					java.util.Date Util_acquire_date = dateFormat_acquire_dateStr.parse(acquire_dateStr);
					java.sql.Date Sql_acquire_date = new java.sql.Date(Util_acquire_date.getTime());
					expertlicensedto.setAcquire_date(Sql_acquire_date);
				} catch (ParseException e) {
					System.out.println("자격증 취득일자 파싱 과정에서 타입 미스매치오류"+e);
					e.printStackTrace();
				}
				edao.insertExpert_license_list(expertlicensedto);
			}
		}
			
		Transfer transfer = new Transfer();
		transfer.setRedirect(true);
		transfer.setPath(req.getContextPath()+"/");
		
		return transfer;
	}
}




