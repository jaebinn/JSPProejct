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
	
	public BoardDTO findBoardByNum(int boardnum) {
		return ss.selectOne("Board.get",boardnum);
	}
	
	public boolean deleteBoardByNum(int boardnum) {
		return ss.delete("Board.delete",boardnum) == 1;
	}
	
	public boolean updateBoard(BoardDTO board) {
		return ss.update("Board.update",board) == 1;
	}
}











