package com.kodup.pixel;

public class PixelHistoryVo {
	int pixel_history_sno;
	String id;
	String writer_id;
	String buyer_id;
	int pr_mansearch_sno;
	int pixel_log;
	String history_date;
	
	
	
	public int getPr_mansearch_sno() {
		return pr_mansearch_sno;
	}
	public void setPr_mansearch_sno(int pr_mansearch_sno) {
		this.pr_mansearch_sno = pr_mansearch_sno;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public int getPixel_history_sno() {
		return pixel_history_sno;
	}
	public void setPixel_history_sno(int pixel_history_sno) {
		this.pixel_history_sno = pixel_history_sno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPixel_log() {
		return pixel_log;
	}
	public void setPixel_log(int pixel_log) {
		this.pixel_log = pixel_log;
	}
	public String getHistory_date() {
		return history_date;
	}
	public void setHistory_date(String history_date) {
		this.history_date = history_date;
	}		
}
