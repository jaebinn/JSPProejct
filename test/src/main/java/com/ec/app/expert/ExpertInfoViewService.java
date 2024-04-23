package com.ec.app.expert;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ec.model.dao.ExpertDAO;
import com.ec.model.dao.Expert_career_listDAO;
import com.ec.model.dao.Expert_license_listDAO;
import com.ec.model.dao.UserDAO;
import com.ec.model.dto.ExpertCareerListDTO;
import com.ec.model.dto.ExpertCareerListUpdateDTO;
import com.ec.model.dto.ExpertLicenseListDTO;
import com.ec.model.dto.ExpertLicenseListUpdateDTO;
import com.ec.model.dto.ExpertOnlyDTO;
import com.ec.model.dto.UserDTO;
import com.ec.mybatis.SQLMapConfig;

public class ExpertInfoViewService {
	//전문가 마이페이지 불러오기
	// 현재 불러오는 데이터는 다음과 같음
	//  ExpertOnlyDTO - expert
	//  UserDTO - user
	//  ExpertCareerListDTO - expert_career_list
	//  ExpertLicenseListDTO - expert_license_list
	// 하나라도 조회 실패하면 때려치게 하기
	public ArrayList<Object> loadExpertInfoValueService(String user_id, Long expert_idx) {
		UserDAO udao = new UserDAO();
		ExpertDAO edao = new ExpertDAO();
		SqlSession ss = SQLMapConfig.getFactory().openSession(false);
		
		UserDTO udto;
		ExpertOnlyDTO eodto;
		List<ExpertCareerListDTO> careerListDTO;
		List<ExpertLicenseListDTO> licenseListDTO;
		
		//user테이블 정보 가져오기
		if(null != (udto = udao.getUserRowByID(ss, user_id))) {
			//expert테이블 정보 가져오기
			if(null != (eodto = edao.getExpertRowById(ss, user_id))) {
				//expert_career_list테이블 정보 가져오기
				if(null != (careerListDTO = new Expert_career_listDAO().getCareerList(ss, expert_idx))) {
					//expert_license_list 테이블 정보 가져오기
					if(null != (licenseListDTO = new Expert_license_listDAO().getLicenseList(ss, expert_idx))) {
						//성공
						ss.commit();
						ss.close();
						//받은 정보들을 담을 리스트 뽑기
						ArrayList<Object> resList = new ArrayList<>();
						resList.add(udto);
						resList.add(eodto);
						resList.add(careerListDTO);
						resList.add(licenseListDTO);
						return resList;
					}
				}
			}
		}
		
		//실패
		ss.rollback();
		ss.close();
		return null;
	}
	
	//업데이트 관련
	
	//main폼 업데이트
	//expertinfo.jsp 쪽 form 중에서 main만 Service를 거치게 해둠
	public boolean updateMainFormService(UserDTO udto, ExpertOnlyDTO eodto, boolean isPwUpdate) {
		UserDAO udao = new UserDAO();
		ExpertDAO edao = new ExpertDAO();
		SqlSession ss = SQLMapConfig.getFactory().openSession(false);
		
		//우선 user 수정
		if(isPwUpdate ? udao.updateMainFormIncludePW(ss, udto) : udao.updateMainForm(ss, udto)) {
			// expert 수정
			if(edao.updateMainForm(ss, eodto)) {
				//성공
				ss.commit();
				ss.close();
				return true;
			}
		}
		//실패
		ss.rollback();
		ss.close();
		return false;
	}
	
	
	//경력 업데이트
	public boolean updateCareerService(ArrayList<ExpertCareerListUpdateDTO> createList, 
			ArrayList<ExpertCareerListUpdateDTO> updateList, 
			ArrayList<ExpertCareerListUpdateDTO> deleteList) {
		Expert_career_listDAO edao = new Expert_career_listDAO();

		SqlSession ss = SQLMapConfig.getFactory().openSession(false);
		
		for(int i = 0; i < createList.size(); i++) {
			if(!edao.createCareer(ss, createList.get(i))) {
				ss.rollback();
				ss.close();
				return false;
			}
		}
		for(int i = 0; i < updateList.size(); i++) {
			if(updateList.get(i).getNew_career_name().equals("null")) {
				if(!edao.updateCareerButNotName(ss, updateList.get(i))) {
					ss.rollback();
					ss.close();
					return false;					
				}
			} else {
				if(!edao.updateCareer(ss, updateList.get(i))) {
					ss.rollback();
					ss.close();
					return false;
				}				
			}
		}
		for(int i = 0; i < deleteList.size(); i++) {
			if(!edao.deleteCareer(ss, deleteList.get(i))) {
				ss.rollback();
				ss.close();
				return false;
			}
		}
		
		ss.commit();
		ss.close();
		return true;
	}

	// 자격증 업데이트
	public boolean updateLicenseService(ArrayList<ExpertLicenseListUpdateDTO> createList,
			ArrayList<ExpertLicenseListUpdateDTO> updateList, 
			ArrayList<ExpertLicenseListUpdateDTO> deleteList) {
		Expert_license_listDAO edao = new Expert_license_listDAO();
		SqlSession ss = SQLMapConfig.getFactory().openSession(false);
		
		for(int i = 0; i < createList.size(); i++) {
			if(!edao.createLicense(ss, createList.get(i))) {
				ss.rollback();
				ss.close();
				return false;
			}
		}
		for(int i = 0; i < updateList.size(); i++) {
			if(updateList.get(i).getNew_license_name().equals("null")) {
				if(!edao.updateLicenseButNotName(ss, updateList.get(i))) {
					ss.rollback();
					ss.close();
					return false;					
				}
			} else {
				if(!edao.updateLicense(ss, updateList.get(i))) {
					ss.rollback();
					ss.close();
					return false;
				}				
			}
		}
		for(int i = 0; i < deleteList.size(); i++) {
			if(!edao.deleteLicense(ss, deleteList.get(i))) {
				ss.rollback();
				ss.close();
				return false;
			}
		}
		
		ss.commit();
		ss.close();
		return true;
	}
}
