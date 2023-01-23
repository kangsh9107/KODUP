package com.kodup.common;

import java.util.Date;

import com.kodup.login.Time;

public class SelectBoardVo {

	int sno;
	String boardtype; //qna, infoshare, freetalking, mansearch, jobsearch, notification
	String id;
	String nickname;
	String nal;
	String subject;
	String doc;
	String hashtag;
	String profile_img;
	String horsehead;
	int viewcount;
	int thumbup;
	int thumbdown;
	int thumb;
	int countRepl;
	int board_delete; //0: 일반 글, 1: 작성자가 삭제한 글, 2: 관리자가 삭제한 글
	int qna_pixel_reward;
	int qna_status;
	int viewStatus;   //0: 안봤음, 1: 봤음
	
	public int getSno() { return sno; }
	public void setSno(int sno) { this.sno = sno; }
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
	public int getViewcount() { return viewcount; }
	public void setViewcount(int viewcount) { this.viewcount = viewcount; }
	public int getThumbup() { return thumbup; }
	public void setThumbup(int thumbup) { this.thumbup = thumbup; }
	public int getThumbdown() { return thumbdown; }
	public void setThumbdown(int thumbdown) { this.thumbdown = thumbdown; }
	public int getBoard_delete() { return board_delete; }
	public void setBoard_delete(int board_delete) { this.board_delete = board_delete; }
	public String getNickname() { return nickname; }
	public void setNickname(String nickname) { this.nickname = nickname; }
	public String getProfile_img() { return profile_img; }
	public void setProfile_img(String profile_img) { this.profile_img = profile_img; }
	public int getThumb() { return thumb; }
	public void setThumb(int thumb) { this.thumb = thumb; }
	public int getCountRepl() { return countRepl; }
	public void setCountRepl(int countRepl) { this.countRepl = countRepl; }
	public String getHorsehead() { return horsehead; }
	public void setHorsehead(String horsehead) { this.horsehead = horsehead; }
	public int getQna_pixel_reward() { return qna_pixel_reward; }
	public void setQna_pixel_reward(int qna_pixel_reward) { this.qna_pixel_reward = qna_pixel_reward; }
	public int getQna_status() { return qna_status; }
	public void setQna_status(int qna_status) { this.qna_status = qna_status; }
	public int getViewStatus() { return viewStatus; }
	public void setViewStatus(int viewStatus) { this.viewStatus = viewStatus; }
	
}
