package com.ec.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.ec.model.dto.UserDTO;
import com.ec.mybatis.SQLMapConfig;

public class UserDAO {
	private SqlSession ss;
	
	public UserDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}
	
	public boolean insertUser(UserDTO user) {
		return ss.insert("User.insert",user) == 1;
	}

	public UserDTO getUserById(String userid) {
		return ss.selectOne("User.select",userid);
	}
	public UserDTO getUserByPw(String pw) {
		return ss.selectOne("User.select",pw);
	}
	public int deleteUser(String userid) {
		return ss.delete("User.delete-user",userid);
	}
	public int deleteExpert(String userid) {
		return ss.delete("User.delete-expert",userid);
	}

	public long getUserCnt() {
		return ss.selectOne("User.userCnt");
	}
	public int deletePayment(String userid) {
		return ss.delete("User.delete-payment",userid);
	}
	public int deleteChatDetail(String userid) {
		return ss.delete("User.delete-chat_detail",userid);
	}
	public UserDTO SelectExpert(String userid) {
		return ss.selectOne("User.select_expert", userid);
	}
	public int SelectExpertIdx(String userid) {
		return ss.selectOne("User.select_expert_idx", userid);
	}
}






