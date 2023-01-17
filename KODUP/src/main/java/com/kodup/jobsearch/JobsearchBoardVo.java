package com.kodup.jobsearch;

import java.util.ArrayList;
import java.util.List;


public class JobsearchBoardVo {
	int sno,viewcount,thumbup,thumbdown;
	String id,boardtype, nal, subject,doc,nickname,profile_img;
	int jobsearch_sno,board_delete;
	String jobsearch_horsehead;
	List<JobsearchHashVo> hashtaglist = new ArrayList<JobsearchHashVo>();
	
	
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
	public int getJobsearch_sno() {return jobsearch_sno;}
	public void setJobsearch_sno(int jobsearch_sno) {this.jobsearch_sno = jobsearch_sno;}
	public int getBoard_delete() {return board_delete;}
	public void setBoard_delete(int board_delete) {this.board_delete = board_delete;}
	public String getJobsearch_horsehead() {return jobsearch_horsehead;}
	public void setJobsearch_horsehead(String jobsearch_horsehead) {this.jobsearch_horsehead = jobsearch_horsehead;}
	public List<JobsearchHashVo> getHashtaglist() {return hashtaglist;}
	public void setHashtaglist(List<JobsearchHashVo> hashtaglist) {this.hashtaglist = hashtaglist;}
	
	
	
	
}
