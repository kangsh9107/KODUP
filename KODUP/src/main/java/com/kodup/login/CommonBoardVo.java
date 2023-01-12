package com.kodup.login;

public class CommonBoardVo {

	int sno;
	String id;
	String boardtype; //qna, infoshare, freetalking, mansearch, jobsearch, notification
	String nal;
	String subject;
	String doc;
	String hashtag;
	int viewcount;
	int thumbup;
	int thumbdown;
	int board_delete; //0: 일반 글, 1: 작성자가 삭제한 글, 2: 관리자가 삭제한 글
	
	public int getSno() { return sno; }
	public void setSno(int sno) { this.sno = sno; }
	public String getId() { return id; }
	public void setId(String id) { this.id = id; }
	public String getBoardtype() { return boardtype; }
	public void setBoardtype(String boardtype) { this.boardtype = boardtype; }
	public String getNal() { return nal; }
	public void setNal(String nal) { this.nal = nal; }
	public String getSubject() { return subject; }
	public void setSubject(String subject) { this.subject = subject; }
	public String getDoc() { return doc; }
	public void setDoc(String doc) { this.doc = doc; }
	public String getHashtag() { return hashtag; }
	public void setHashtag(String hashtag) { this.hashtag = hashtag; }
	public int getViewcount() { return viewcount; }
	public void setViewcount(int viewcount) { this.viewcount = viewcount; }
	public int getThumbup() { return thumbup; }
	public void setThumbup(int thumbup) { this.thumbup = thumbup; }
	public int getThumbdown() { return thumbdown; }
	public void setThumbdown(int thumbdown) { this.thumbdown = thumbdown; }
	public int getBoard_delete() { return board_delete; }
	public void setBoard_delete(int board_delete) { this.board_delete = board_delete; }
	
}
