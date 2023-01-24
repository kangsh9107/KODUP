package com.kodup.notification;

import java.util.ArrayList;
import java.util.List;


public class NotificationBoardVo {
	int sno,viewcount,thumbup,thumbdown;
	String id,boardtype, nal, subject,doc,nickname,profile_img;
	int notification_sno,board_delete;
	String notification_horsehead;
	List<NotificationHashVo> hashtaglist = new ArrayList<NotificationHashVo>();
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public int getNotification_sno() {
		return notification_sno;
	}
	public void setNotification_sno(int notification_sno) {
		this.notification_sno = notification_sno;
	}
	public int getBoard_delete() {
		return board_delete;
	}
	public void setBoard_delete(int board_delete) {
		this.board_delete = board_delete;
	}
	public String getNotification_horsehead() {
		return notification_horsehead;
	}
	public void setNotification_horsehead(String notification_horsehead) {
		this.notification_horsehead = notification_horsehead;
	}
	public List<NotificationHashVo> getHashtaglist() {
		return hashtaglist;
	}
	public void setHashtaglist(List<NotificationHashVo> hashtaglist) {
		this.hashtaglist = hashtaglist;
	}

	
	
}
