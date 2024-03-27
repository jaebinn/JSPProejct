package com.kh.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.model.dto.BoardDTO;
import com.kh.mybatis.SQLMapConfig;

public class BoardDAO {
	private SqlSession ss;
	
	public BoardDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}
	
	public long getBoardCnt() {
		return ss.selectOne("Board.getBoardCnt");
	}
	
	public long getBoardCnt(String keyword) {
		return ss.selectOne("Board.getBoardCntWithKey",keyword);
	}

	public List<BoardDTO> getList(int startRow, int pageSize) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		return ss.selectList("Board.getList",datas);
	}

	public List<BoardDTO> getList(int startRow, int pageSize, String keyword) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		datas.put("keyword",keyword);
		return ss.selectList("Board.getListWithKey",datas);
	}

	public boolean insertBoard(BoardDTO board) {
		return ss.insert("Board.insert",board) == 1;
	}

	public BoardDTO getBoardByNum(long boardnum) {
		return ss.selectOne("Board.get",boardnum);
	}

	public void updateReadCount(long boardnum) {
		ss.update("Board.updateReadCount",boardnum);
	}

	public boolean deleteBoard(long boardnum) {
		return ss.delete("Board.delete",boardnum) == 1;
	}
	
}







