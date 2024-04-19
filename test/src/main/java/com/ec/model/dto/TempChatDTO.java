package com.ec.model.dto;

public class TempChatDTO {
   private long chat_idx;
   private String user_id;
   private long expert_idx;
   private String user_name;
   private int notReadCnt;
   
   public String getUser_name() {
      return user_name;
   }
   public void setUser_name(String user_name) {
      this.user_name = user_name;
   }
   public int getNotReadCnt() {
      return notReadCnt;
   }
   public void setNotReadCnt(int notReadCnt) {
      this.notReadCnt = notReadCnt;
   }
   public long getChat_idx() {
      return chat_idx;
   }
   public void setChat_idx(long chat_idx) {
      this.chat_idx = chat_idx;
   }
   public String getUser_id() {
      return user_id;
   }
   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }
   public long getExpert_idx() {
      return expert_idx;
   }
   public void setExpert_idx(long expert_idx) {
      this.expert_idx = expert_idx;
   }
}