package com.ec.model.dto;

public class Chat_detailDTO {
   private long chat_idx;
   private long chat_detail_num;
   private String type;
   private String contents;
   private String regdate;
   private String is_read;
   
   public long getChat_idx() {
      return chat_idx;
   }
   public void setChat_idx(long chat_idx) {
      this.chat_idx = chat_idx;
   }
   
   public long getChat_detail_num() {
      return chat_detail_num;
   }
   public void setChat_detail_num(long chat_detail_num) {
      this.chat_detail_num = chat_detail_num;
   }
   public String getType() {
      return type;
   }
   public void setType(String type) {
      this.type = type;
   }
   public String getContents() {
      return contents;
   }
   public void setContents(String contents) {
      this.contents = contents;
   }
   public String getRegdate() {
      return regdate;
   }
   public void setRegdate(String regdate) {
      this.regdate = regdate;
   }
   public String getIs_read() {
      return is_read;
   }
   public void setIs_read(String is_read) {
      this.is_read = is_read;
   }
   
   
}