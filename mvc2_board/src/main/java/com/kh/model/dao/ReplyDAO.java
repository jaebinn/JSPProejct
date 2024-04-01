package com.kh.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.model.dto.ReplyDTO;
import com.kh.mybatis.SQLMapConfig;

public class ReplyDAO {
	private SqlSession ss;
	
	public ReplyDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}
	
	public boolean insertReply(ReplyDTO reply) {
		return ss.insert("Reply.insert",reply) == 1;
	}

	public List<ReplyDTO> getReplies(long boardnum) {
		return ss.selectList("Reply.getReplies",boardnum);
	}

	public boolean deleteReply(long replynum) {
		return ss.delete("Reply.delete",replynum) == 1;
	}

	public boolean updateReply(ReplyDTO reply) {
		return ss.update("Reply.update",reply) == 1;
	}

	public Integer getReplyCnt(long boardnum) {
		return ss.selectOne("Reply.getReplyCnt",boardnum);
	}
}










