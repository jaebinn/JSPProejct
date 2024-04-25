package com.ec.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ec.model.dto.U_boardDTO;
import com.ec.mybatis.SQLMapConfig;

public class U_boardDAO {
	private SqlSession ss;
	
	public U_boardDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}
	
	public long getBoardCnt() {
		return ss.selectOne("U_board.getU_boardCnt");
	}

	public List<U_boardDTO> getList(int startRow, int pageSize) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		return ss.selectList("U_board.getList",datas);
	}

	public boolean insertBoard(U_boardDTO u_board) {
		return ss.insert("U_board.insert",u_board) == 1;
	}

	public long getLastNum(String user_id) {
		return ss.selectOne("U_board.getLastNum",user_id);
	}

	public boolean deleteBoard(long board_idx) {
		return ss.delete("U_board.delete",board_idx) == 1;
	}

	public U_boardDTO getBoardByIdx(long board_idx) {
		return ss.selectOne("U_board.getboardbynum",board_idx);
	}

	public void updateReadCount(long board_idx) {
		ss.update("U_board.updateReadCount",board_idx);
	}

	public boolean updateBoard(U_boardDTO u_board) {
		return ss.update("U_board.update", u_board) == 1;
	}
}