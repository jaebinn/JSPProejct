package com.ec.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ec.model.dto.U_replyDTO;
import com.ec.mybatis.SQLMapConfig;

public class U_replyDAO {
	private SqlSession ss;
	
	public U_replyDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}

	public boolean insertReply(U_replyDTO u_reply) {
		return ss.insert("U_reply.insert",u_reply) == 1;
	}

	public boolean updateReply(U_replyDTO ureply) {
		return ss.update("U_reply.update", ureply) == 1;
	}

	public boolean deleteReply(long u_reply_idx) {
		return ss.delete("U_reply.delete", u_reply_idx) == 1;
	}

	public List<U_replyDTO> getReplies(long board_idx) {
		return ss.selectList("U_reply.getReplies", board_idx);
	}

	public Integer getReplyCnt(long board_idx) {
		return ss.selectOne("U_reply.getReplyCnt",board_idx);
	}

	public boolean deleteReplyByBoard_idx(long board_idx) {
		return ss.delete("U_reply.deleteReplyByBoard_idx", board_idx) == 1;
	}	
}
