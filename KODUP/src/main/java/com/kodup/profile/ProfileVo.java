package com.kodup.profile;

public class ProfileVo {
	String id;
	String nickname;
	String gender;
	String profile_img;
	String grade;       //0: 일반회원, 1: 퍼스널멘토, 2: 플러스멘토, 3: 파트너멘토, 4: 게시판지기, 5: 관리자
	String introduce; //소개글
	int sno;
	String boardtype;
	String nal;
	String subject;
	int repl_sno;
	String repl_nal;
	String repl_doc;
	
	public String getId() { return id; }
	public void setId(String id) { this.id = id; }
	public String getNickname() { return nickname; }
	public void setNickname(String nickname) { this.nickname = nickname; }
	public String getGender() { return gender; }
	public void setGender(String gender) { this.gender = gender; }
	public String getProfile_img() { return profile_img; }
	public void setProfile_img(String profile_img) { this.profile_img = profile_img; }
	public String getGrade() { return grade; }
	public void setGrade(String grade) { this.grade = grade; }
	public String getIntroduce() { return introduce; }
	public void setIntroduce(String introduce) { this.introduce = introduce; }
	public int getSno() { return sno; }
	public void setSno(int sno) { this.sno = sno; }
	public String getBoardtype() { return boardtype; }
	public void setBoardtype(String boardtype) { this.boardtype = boardtype;}
	public String getNal() { return nal; }
	public void setNal(String nal) { this.nal = nal; }
	public String getSubject() { return subject; }
	public void setSubject(String subject) { this.subject = subject; }
	public int getRepl_sno() { return repl_sno; }
	public void setRepl_sno(int repl_sno) { this.repl_sno = repl_sno; }
	public String getRepl_nal() { return repl_nal; }
	public void setRepl_nal(String repl_nal) { this.repl_nal = repl_nal; }
	public String getRepl_doc() { return repl_doc; }
	public void setRepl_doc(String repl_doc) { this.repl_doc = repl_doc; }
}
