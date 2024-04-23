package com.ec.app.expert;

import java.io.BufferedReader;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dto.ExpertCareerListDTO;
import com.ec.model.dto.ExpertCareerListUpdateDTO;
import com.ec.model.dto.ExpertLicenseListUpdateDTO;
import com.ec.model.dto.UserDTO;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class ExpertInfoViewAjaxUpdateOkAction implements Action {

	@Override
	public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//한글 깨짐을 방지하기 위한 인코딩 설정
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		//로그인검증 등
		String loginUser = (String)req.getSession().getAttribute("loginUser");
		Integer expert_idx = (Integer) req.getSession().getAttribute("expertSession");
		
		//JSON 관련은 com.ms.test.ajax.Test_AjaxController 참조
		StringBuilder sb = new StringBuilder();
		BufferedReader reader = req.getReader();
		String line;
		while((line = reader.readLine()) != null) {
			sb.append(line);
		}
		String raw = sb.toString();
		System.out.println(raw);

		JsonObject jsonObj = (JsonObject) JsonParser.parseString(raw);
		
		String recordname = jsonObj.get("recordname").getAsString();
		boolean isCreateEmpty = jsonObj.get("isCreateEmpty").getAsBoolean();
		boolean isUpdateEmpty = jsonObj.get("isUpdateEmpty").getAsBoolean();
		boolean isDeleteEmpty = jsonObj.get("isDeleteEmpty").getAsBoolean();
		
		if(recordname.equals("career")) {
			ArrayList<ExpertCareerListUpdateDTO> createList = new ArrayList<>();
			ArrayList<ExpertCareerListUpdateDTO> updateList = new ArrayList<>();
			ArrayList<ExpertCareerListUpdateDTO> deleteList = new ArrayList<>();
			
			if(!isCreateEmpty) {
				JsonArray jsonCreateArr = (JsonArray) jsonObj.get("createRecord");
				for(int i = 0; i < jsonCreateArr.size(); i++) {
					ExpertCareerListUpdateDTO dto = new ExpertCareerListUpdateDTO();
					dto.setExpert_idx(Long.valueOf(expert_idx));
					dto.setCareer_name(((JsonObject) jsonCreateArr.get(i)).get("existName").getAsString());
					dto.setStart_time(Date.valueOf(((JsonObject) jsonCreateArr.get(i)).get("startTime").getAsString()));
					dto.setEnd_time(Date.valueOf(((JsonObject) jsonCreateArr.get(i)).get("endTime").getAsString()));
					createList.add(dto);
				}	
			}
			if(!isUpdateEmpty) {
				JsonArray jsonUpdateArr = (JsonArray) jsonObj.get("updateRecord");
				for(int i = 0; i < jsonUpdateArr.size(); i++) {
					ExpertCareerListUpdateDTO dto = new ExpertCareerListUpdateDTO();
					dto.setExpert_idx(Long.valueOf(expert_idx));
					dto.setCareer_name(((JsonObject) jsonUpdateArr.get(i)).get("existName").getAsString());
					dto.setNew_career_name(((JsonObject) jsonUpdateArr.get(i)).get("modifiedName").getAsString());
					dto.setStart_time(Date.valueOf(((JsonObject) jsonUpdateArr.get(i)).get("startTime").getAsString()));
					dto.setEnd_time(Date.valueOf(((JsonObject) jsonUpdateArr.get(i)).get("endTime").getAsString()));
					updateList.add(dto);
				}
			}
			if(!isDeleteEmpty) {
				JsonArray jsonDeleteArr = (JsonArray) jsonObj.get("deleteRecord");
				for(int i = 0; i < jsonDeleteArr.size(); i++) {
					ExpertCareerListUpdateDTO dto = new ExpertCareerListUpdateDTO();
					dto.setExpert_idx(Long.valueOf(expert_idx));
					dto.setCareer_name(((JsonObject) jsonDeleteArr.get(i)).get("existName").getAsString());
					deleteList.add(dto);
				}
			}
			
			//테스트
			for(int i = 0; i < createList.size(); i++) {
				System.out.println(createList.get(i).toString());
			}
			for(int i = 0; i < updateList.size(); i++) {
				System.out.println(updateList.get(i).toString());
			}
			for(int i = 0; i < deleteList.size(); i++) {
				System.out.println(deleteList.get(i).toString());
			}
			
			//DB실패
			if(!new ExpertInfoViewService().updateCareerService(createList, updateList, deleteList)) {
				resp.getWriter().print("isSuccess:false,reason:dbfail");
				return null;
			}
			
			//DB까지 성공
			resp.getWriter().print("isSuccess:true");
			return null;
			
		} else if(recordname.equals("license")) {
			ArrayList<ExpertLicenseListUpdateDTO> createList = new ArrayList<>();
			ArrayList<ExpertLicenseListUpdateDTO> updateList = new ArrayList<>();
			ArrayList<ExpertLicenseListUpdateDTO> deleteList = new ArrayList<>();
			
			if(!isCreateEmpty) {
				JsonArray jsonCreateArr = (JsonArray) jsonObj.get("createRecord");
				for(int i = 0; i < jsonCreateArr.size(); i++) {
					ExpertLicenseListUpdateDTO dto = new ExpertLicenseListUpdateDTO();
					dto.setExpert_idx(Long.valueOf(expert_idx));
					dto.setLicense_name(((JsonObject) jsonCreateArr.get(i)).get("existName").getAsString());
					dto.setAcquire_date(Date.valueOf(((JsonObject) jsonCreateArr.get(i)).get("startTime").getAsString()));
					createList.add(dto);
				}	
			}
			if(!isUpdateEmpty) {
				JsonArray jsonUpdateArr = (JsonArray) jsonObj.get("updateRecord");
				for(int i = 0; i < jsonUpdateArr.size(); i++) {
					ExpertLicenseListUpdateDTO dto = new ExpertLicenseListUpdateDTO();
					dto.setExpert_idx(Long.valueOf(expert_idx));
					dto.setLicense_name(((JsonObject) jsonUpdateArr.get(i)).get("existName").getAsString());
					dto.setNew_license_name(((JsonObject) jsonUpdateArr.get(i)).get("modifiedName").getAsString());
					dto.setAcquire_date(Date.valueOf(((JsonObject) jsonUpdateArr.get(i)).get("startTime").getAsString()));
					updateList.add(dto);
				}
			}
			if(!isDeleteEmpty) {
				JsonArray jsonDeleteArr = (JsonArray) jsonObj.get("deleteRecord");
				for(int i = 0; i < jsonDeleteArr.size(); i++) {
					ExpertLicenseListUpdateDTO dto = new ExpertLicenseListUpdateDTO();
					dto.setExpert_idx(Long.valueOf(expert_idx));
					dto.setLicense_name(((JsonObject) jsonDeleteArr.get(i)).get("existName").getAsString());
					deleteList.add(dto);
				}
			}
			
			//DB실패
			if(!new ExpertInfoViewService().updateLicenseService(createList, updateList, deleteList)) {
				resp.getWriter().print("isSuccess:false,reason:dbfail");
				return null;
			}
			
			//DB까지 성공
			resp.getWriter().print("isSuccess:true");
			return null;
			
		}
		
		resp.getWriter().print("isSuccess:false,reason:empty");
		return null;
		
	}

}
