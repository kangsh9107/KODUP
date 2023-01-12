package com.kodup.board;

public class BoardVo {
	int sno;
	String id;
	String boardtype;
	String nal;
	String subject;
	String doc;
	String hashtag;
	int viewcount;
	int thumbup;
	int thumbdown;
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBoardtype() {
		return boardtype;
	}
	public void setBoardtype(String boardtype) {
		this.boardtype = boardtype;
	}
	public String getNal() {
		return nal;
	}
	public void setNal(String nal) {
		this.nal = nal;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDoc() {
		return doc;
	}
	public void setDoc(String doc) {
		this.doc = doc;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	public int getThumbup() {
		return thumbup;
	}
	public void setThumbup(int thumbup) {
		this.thumbup = thumbup;
	}
	public int getThumbdown() {
		return thumbdown;
	}
	public void setThumbdown(int thumbdown) {
		this.thumbdown = thumbdown;
	}
	
}
