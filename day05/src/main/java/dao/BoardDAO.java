package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.BoardDTO;
import mybatis.SQLMapConfig;

public class BoardDAO {
	private SqlSession ss;
	
	public BoardDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}
	
	public boolean insertBoard(BoardDTO board) {
		return ss.insert("Board.insert",board) == 1;
	}
	
	public List<BoardDTO> getList(){
		return ss.selectList("Board.getList");
	}
}
