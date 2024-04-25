package com.ec.model.dto;

public class ChatDTO {
   private long chat_idx;
   private String user_id;
   private long expert_idx;
   
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