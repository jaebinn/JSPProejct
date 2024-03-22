package dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import dto.UserDTO;
import mybatis.SQLMapConfig;

public class UserDAO {
	
	private SqlSession ss;
	
	public UserDAO() {
		//매개변수로 true를 넘겨야 오토커밋 모드
		ss = SQLMapConfig.getFactory().openSession(true);
	}
	
	public boolean insertUser(UserDTO user) {
		//1. HashMap 이용
//		HashMap<String,String> datas = new HashMap<>();
//		datas.put("a", user.getUserid());
//		datas.put("b", user.getUserpw());
//		datas.put("c", user.getUsername());
//		
//		ss.insert("User.insert",datas);
		
		//2. 객체 이용
		return ss.insert("User.insert",user) == 1;
	}
	
	public UserDTO findUserById(String userid) {
		return ss.selectOne("User.select",userid);
	}
	
	
}







