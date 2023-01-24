package com.kodup.mypage;

import java.sql.Timestamp;

public class MypagePixelVo {
	int pixel; 				//총 픽셀
	
	int pixel_history_sno;  //픽셀이력 번호
	String id;				//id
	int pixel_log;			//픽셀로그 (700픽셀..etc)
	Timestamp history_date; //날짜
	String history_detail;  //상세내역
	
	int pixel_want_exchange;
	
	int pixel_exchange;
	
	
	
	public int getPixel_want_exchange() {
		return pixel_want_exchange;
	}

	public void setPixel_want_exchange(int pixel_want_exchange) {
		this.pixel_want_exchange = pixel_want_exchange;
	}

	public int getPixel_exchange() {
		return pixel_exchange;
	}

	public void setPixel_exchange(int pixel_exchange) {
		this.pixel_exchange = pixel_exchange;
	}

	public int getPixel() { return pixel; }

	public void setPixel(int pixel) { this.pixel = pixel; }

	public int getPixel_history_sno() { return pixel_history_sno; }

	public void setPixel_history_sno(int pixel_history_sno) {
		this.pixel_history_sno = pixel_history_sno;
	}

	public String getId() { return id; }

	public void setId(String id) { this.id = id; }

	public int getPixel_log() { return pixel_log; }

	public void setPixel_log(int pixel_log) { this.pixel_log = pixel_log; }

	public Timestamp getHistory_date() { return history_date; }

	public void setHistory_date(Timestamp history_date) {
		this.history_date = history_date;
	}

	public String getHistory_detail() {
		return history_detail;
	}

	public void setHistory_detail(String history_detail) {
		this.history_detail = history_detail;
	}

	
}
