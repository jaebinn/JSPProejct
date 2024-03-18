package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private static Connection conn;
	
	public static Connection getConnection() {
		if(conn == null) {
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/gb";
				String user = "root";
				String password = "1234";
		
				conn = DriverManager.getConnection(url, user, password);
			}
			catch(Exception e){
				System.out.println("DB 연결 실패 : "+e);
			}
		}
		return conn;
	}
}
