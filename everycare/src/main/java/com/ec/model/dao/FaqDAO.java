package com.ec.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ec.model.dto.FaqDTO;
import com.ec.mybatis.SQLMapConfig;


public class FaqDAO {
	private SqlSession ss;
	
	public FaqDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}
	
	public long getBoardCnt() {
		return ss.selectOne("Faq.getFaqCnt");
	}

	public List<FaqDTO> getList(int startRow, int pageSize) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		return ss.selectList("Faq.getList",datas);
	}


//	public BoardDTO getBoardByNum(long boardnum) {
//		return ss.selectOne("Board.get",boardnum);
//	}

}







