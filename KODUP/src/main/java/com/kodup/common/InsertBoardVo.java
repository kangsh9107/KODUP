package com.kodup.common;

import java.util.Date;

import com.kodup.login.Time;

public class InsertBoardVo {
	
	String qna_horsehead;
	int qna_pixel_reward;
	int pixel;
	int sno;
	String horsehead;
	String id;
	String boardtype;
	String nal;
	String subject;
	String doc;
	String hashtag;
	
	public String getQna_horsehead() { return qna_horsehead; }
	public void setQna_horsehead(String qna_horsehead) { this.qna_horsehead = qna_horsehead; }
	public int getQna_pixel_reward() { return qna_pixel_reward; }
	public void setQna_pixel_reward(int qna_pixel_reward) { this.qna_pixel_reward = qna_pixel_reward; }
	public int getSno() { return sno; }
	public void setSno(int sno) { this.sno = sno; }
	public String getHorsehead() { return horsehead; }
	public void setHorsehead(String horsehead) { this.horsehead = horsehead; }
	public String getId() { return id; }
	public void setId(String id) { this.id = id; }
	public String getBoardtype() { return boardtype; }
	public void setBoardtype(String boardtype) { this.boardtype = boardtype; }
	public String getNal() { return nal; }
	public void setNal(Date nal) { this.nal = Time.calculateTime(nal); } //time계산
	public String getSubject() { return subject; }
	public void setSubject(String subject) { this.subject = subject; }
	public String getDoc() { return doc; }
	public void setDoc(String doc) { this.doc = doc; }
	public String getHashtag() { return hashtag; }
	public void setHashtag(String hashtag) { this.hashtag = hashtag; }
	public int getPixel() { return pixel; }
	public void setPixel(int pixel) { this.pixel = pixel; }

}
