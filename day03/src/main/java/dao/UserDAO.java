package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.Cookie;

import dto.UserDTO;

public class UserDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public UserDAO() {
		conn = DBConnection.getConnection();
	}
	
	public boolean insertUser(UserDTO user) {
		String sql = "insert into user values(?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, user.getUserid());
			ps.setString(2, user.getUserpw());
			ps.setString(3, user.getUsername());
			
			int result = ps.executeUpdate();
			
			return result == 1;
		} catch (SQLException e) {
		}
		return false;
	}
	
	public UserDTO findUserById(String userid) {
		String sql = "select * from user where userid = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				UserDTO user = new UserDTO();
				user.setUserid(rs.getString("userid"));
				user.setUserpw(rs.getString("userpw"));
				user.setUsername(rs.getString("username"));
				
				return user;
			}
		} catch (SQLException e) {
		}
		return null;
	}
	
	
}







