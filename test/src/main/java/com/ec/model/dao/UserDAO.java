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
	public boolean deleteUser(String userid) {
		return ss.delete("User.delete-user",userid)==1;
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
	public Long SelectExpertIdx(String userid) {
		return ss.selectOne("User.select_expert_idx", userid);
	}
	public Long SelectboardIdx(String userid) {
		return ss.selectOne("User.select_board_idx",userid);
	}
	public boolean deleteReview(String userid) {
		return ss.delete("User.delete_review",userid) == 1;
	}
	public boolean deleteReviewIdx(Long expertIdx) {
		return ss.delete("User.delete_review_idx",expertIdx) == 1;
		//
	}
	public String selectReviewUser(String userid) {
		return ss.selectOne("User.select_review_user",userid);
	}
	
	
	//트랜잭션
	// 서비스 클래스에서 SqlSession을 받아 사용함
	
	//Userinfo.jsp 수정
	
	//select - id값 문자열로 레코드 하나 가져오기
	public UserDTO getUserRowByID(SqlSession tsss, String user_id) {
		return tsss.selectOne("User.select", user_id);
	}
	
	//update - default block 수정
	public boolean changeUserRow_inDefaultForm(SqlSession tsss, UserDTO userdto) {
		return 1 == tsss.update("User.update_DefaultBlock", userdto);
	}
	
	//update - contacts block 수정
	public boolean changeUserRow_inContactsForm(SqlSession tsss, UserDTO userdto) {
		return 1 == tsss.update("User.update_ContactsBlock", userdto);
	}
	
	//update - addr block 수정
	public boolean changeUserRow_inAddrForm(SqlSession tsss, UserDTO userdto) {
		return 1 == tsss.update("User.update_AddrBlock", userdto);
	}
	
	//update - pw block 수정(password 수정)
	public boolean changeUserRow_inPwForm(SqlSession tsss, UserDTO userdto) {
		return 1 == tsss.update("User.update_PasswordBlock", userdto);
	}
	
	//update - user.user_etc 수정(키워드 수정)
	public boolean changeUserRow_userEtc(SqlSession tsss, UserDTO userdto) {
		return 1 == tsss.update("User.update_UserEtc", userdto);
	}

	//Expertinfo.jsp 수정
	
	//update - main block 수정
	public boolean updateMainForm(SqlSession tsss, UserDTO udto) {
		return 1 == tsss.update("User.updateMain", udto);
	}
	//update - main block + pw 수정
	public boolean updateMainFormIncludePW(SqlSession tsss, UserDTO udto) {
		return 1 == tsss.update("User.updateMainPlusPW", udto);
	}
	//update - contacts block 수정
	public boolean updateContactsForm(UserDTO udto) {
		return 1 == ss.update("User.updateContacts", udto);
	}
	
	
}






