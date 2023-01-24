package com.kodup.infoshare;

import java.util.ArrayList;
import java.util.List;

public class InfoshareBoardVo {
	int sno,viewcount,thumbup,thumbdown;
	String id,boardtype, nal, subject,doc,nickname,profile_img;
	int infoshare_sno,board_delete;
	String infoshare_horsehead;
	List<InfoshareHashVo> hashtaglist = new ArrayList<InfoshareHashVo>();
	 
	public int getSno() {return sno;}
	public void setSno(int sno) {this.sno = sno;}
	public int getViewcount() {return viewcount;}
	public void setViewcount(int viewcount) {this.viewcount = viewcount;}
	public int getThumbup() {return thumbup;}
	public void setThumbup(int thumbup) {this.thumbup = thumbup;}
	public int getThumbdown() {return thumbdown;}
	public void setThumbdown(int thumbdown) {this.thumbdown = thumbdown;}
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}
	public String getBoardtype() {return boardtype;}
	public void setBoardtype(String boardtype) {this.boardtype = boardtype;}
	public String getNal() {return nal;}
	public void setNal(String nal) {this.nal = nal;}
	public String getSubject() {return subject;}
	public void setSubject(String subject) {this.subject = subject;}
	public String getDoc() {return doc;}
	public void setDoc(String doc) {this.doc = doc;}
	public String getNickname() {return nickname;}
	public void setNickname(String nickname) {this.nickname = nickname;}
	public String getProfile_img() {return profile_img;}
	public void setProfile_img(String profile_img) {this.profile_img = profile_img;}
	public int getBoard_delete() {return board_delete;}
	public void setBoard_delete(int board_delete) {this.board_delete = board_delete;}
	public int getInfoshare_sno() {return infoshare_sno;}
	public void setInfoshare_sno(int infoshare_sno) {	this.infoshare_sno = infoshare_sno;	}
	public String getInfoshare_horsehead() {return infoshare_horsehead;	}
	public void setInfoshare_horsehead(String infoshare_horsehead) {this.infoshare_horsehead = infoshare_horsehead;}
	public List<InfoshareHashVo> getHashtaglist() {	return hashtaglist;}
	public void setHashtaglist(List<InfoshareHashVo> hashtaglist) {	this.hashtaglist = hashtaglist;	}
	
}
