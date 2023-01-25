package com.kodup.login;

import java.util.Date;

public class IndexBoardVo {

	int sno;
	String boardtype;
	String nal;
	String subject;
	String thumb;
	String profile_img;
	String nickname;
	String countRepl;
	int board_delete;
	
	public int getSno() { return sno; }
	public void setSno(int sno) { this.sno = sno; }
	public String getBoardtype() { return boardtype; }
	public void setBoardtype(String boardtype) { this.boardtype = boardtype; }
	public String getNal() { return nal; }
	public void setNal(Date nal) { this.nal = Time.calculateTime(nal); } //time계산
	public String getSubject() { return subject; }
	public void setSubject(String subject) { this.subject = subject; }
	public String getThumb() { return thumb; }
	public void setThumb(String thumb) { this.thumb = thumb; }
	public String getProfile_img() { return profile_img; }
	public void setProfile_img(String profile_img) { this.profile_img = profile_img; }
	public String getNickname() { return nickname; }
	public void setNickname(String nickname) { this.nickname = nickname; }
	public String getCountRepl() { return countRepl; }
	public void setCountRepl(String countRepl) { this.countRepl = countRepl; }
	public int getBoard_delete() { return board_delete; }
	public void setBoard_delete(int board_delete) { this.board_delete = board_delete; }
	
}
