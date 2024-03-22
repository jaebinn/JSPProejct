package test;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SQLMapConfig;

public class MyBatisTest {
	private static SqlSessionFactory factory;
	private static SqlSession ss;
	
	public static void main(String[] args) {
		factory = SQLMapConfig.getFactory();
		System.out.println(factory);
		ss = factory.openSession();
		System.out.println(ss);
		
		String time = ss.selectOne("Time.getTime");
		System.out.println(time);
	}
}








