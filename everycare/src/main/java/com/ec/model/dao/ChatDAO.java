package com.ec.model.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ec.model.dto.ChatDTO;
import com.ec.model.dto.Chat_detailDTO;
import com.ec.model.dto.TempChatDTO;
import com.ec.mybatis.SQLMapConfig;

public class ChatDAO {
private SqlSession ss;
   
   public ChatDAO() {
      ss = SQLMapConfig.getFactory().openSession(true);
   }

   public boolean createChatRoom(ChatDTO chat) {
      return ss.insert("Chat.insert", chat) == 1;
   }

   public int getChatRoom_idx(ChatDTO chat) {
      return ss.selectOne("Chat.getIdx", chat);
   }

   public boolean insertchat_detail(Chat_detailDTO chat_detail) {
      return ss.insert("Chat.insertDetail",chat_detail) == 1;
   }

   public long checkChatRoom(ChatDTO chat) {
      return ss.selectOne("Chat.checkChatRoom", chat);
   }

   public List<ChatDTO> getChatList(String user_id) {
      return ss.selectList("Chat.getChatList", user_id);
   }

   public int getChatNotReadCnt(long chat_idx) {
      return ss.selectOne("Chat.getNotReadCnt", chat_idx);
   }

   public List<Chat_detailDTO> getChatDetail(long chat_idx) {
      return ss.selectList("Chat.getChatDetail", chat_idx);
   }

   public Chat_detailDTO getLastChat_detail(Chat_detailDTO chat) {
      return ss.selectOne("Chat.getLastChat_detail", chat);
   }

   public boolean UpdateIsRead(long chat_idx) {
      return ss.update("Chat.UpdateIsRead", chat_idx) == 1;
   }

   public List<TempChatDTO> getExpertChatList(long expert_idx) {
      return ss.selectList("Chat.getExpertChatList", expert_idx);
   }

   public boolean ExpertIsReadUpdate(long chat_idx) {
      return ss.update("Chat.expertIsReadUpdate", chat_idx) == 1;
   }

   public String getUserIdByChatIdx(String chat_idx) {
      return ss.selectOne("Chat.getUserIdByChatIdx", chat_idx);
   }

   public boolean sendReservation(long chat_idx) {
      return ss.insert("Chat.sendReservation", chat_idx) == 1;
   }

	public ChatDTO getChatInfo(Long chat_idx) {
		return ss.selectOne("Chat.getChatInfo", chat_idx);
	}

	public String getExpertNameByID(Long chat_idx) {
		return ss.selectOne("Chat.getExpertName",chat_idx);
	}
	public boolean openChatRoom(ChatDTO chat) {
	      return ss.insert("Chat.insert",chat) == 1;
	   }
	
}