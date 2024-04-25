package com.ec.app.user;

import org.apache.ibatis.session.SqlSession;

import com.ec.model.dao.UserDAO;
import com.ec.model.dto.UserDTO;
import com.ec.mybatis.SQLMapConfig;


public class UserInfoUpdateService {
	//비밀번호
	public Boolean updatePwFormService(String existing_pw, UserDTO inputDTO) {
		UserDAO udao = new UserDAO();
		SqlSession ss = SQLMapConfig.getFactory().openSession(false);
		
		//비밀번호가 같은지 확인
		if(existing_pw.equals(udao.getUserRowByID(ss, inputDTO.getUser_id()).getPw())) {
			//비밀번호 변경
			if(udao.changeUserRow_inPwForm(ss, inputDTO)) {
				//성공
				ss.commit();
				ss.close();
				return true;
			} else {
				//비밀번호 변경을 실패한 경우
				ss.rollback();
				ss.close();
				return false;
			}
		}
		
		//비밀번호가 기존과 아예 다른 경우
		ss.rollback();
		ss.close();
		return null;
	}
	
	//주소블럭
	public UserDTO updateAddrFormService(UserDTO inputDTO) {
		UserDAO udao = new UserDAO();
		UserDTO resdto;
		SqlSession ss = SQLMapConfig.getFactory().openSession(false);

		//값 변경
		if(udao.changeUserRow_inAddrForm(ss, inputDTO)) {
			//수정값 조회
			if(null != (resdto = udao.getUserRowByID(ss, inputDTO.getUser_id()))) {
				//성공
				ss.commit();
				ss.close();
				return resdto;
			}
		}
		
		//실패
		ss.rollback();
		ss.close();
		return null;
	}
	
	//연락처블럭
	public UserDTO updateContactsFormService(UserDTO inputDTO) {
		UserDAO udao = new UserDAO();
		UserDTO resdto;
		SqlSession ss = SQLMapConfig.getFactory().openSession(false);

		//값 변경
		if(udao.changeUserRow_inContactsForm(ss, inputDTO)) {
			//수정값 조회
			if(null != (resdto = udao.getUserRowByID(ss, inputDTO.getUser_id()))) {
				//성공
				ss.commit();
				ss.close();
				return resdto;
			}
		}
		
		//실패
		ss.rollback();
		ss.close();
		return null;
	}
	
	//기본정보블럭
	public UserDTO updateDefaultFormService(UserDTO inputDTO) {
		UserDAO udao = new UserDAO();
		UserDTO resdto;
		SqlSession ss = SQLMapConfig.getFactory().openSession(false);
		
		//값 변경
		if(udao.changeUserRow_inDefaultForm(ss, inputDTO)) {
			//수정값 조회
			if(null != (resdto = udao.getUserRowByID(ss, inputDTO.getUser_id()))) {
				//성공
				ss.commit();
				ss.close();
				return resdto;
			}
		}
		
		//실패
		ss.rollback();
		ss.close();
		return null;
	}
	
	//유저 키워드(user.user_etc)
	public String updateUserEtcService(UserDTO inputDTO) {
		UserDAO udao = new UserDAO();
		UserDTO tempdto;
		SqlSession ss = SQLMapConfig.getFactory().openSession(false);
		
		//값 변경
		if(udao.changeUserRow_userEtc(ss, inputDTO)) {
			//수정값 조회
			if(null != (tempdto = udao.getUserRowByID(ss, inputDTO.getUser_id()))) {
				//성공
				ss.commit();
				ss.close();
				return tempdto.getUser_etc();
			}
		}
		
		//실패
		ss.rollback();
		ss.close();
		return null;
	}
}
