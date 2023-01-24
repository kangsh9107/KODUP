package com.kodup.profile;

public class ProfileVo {
	String id;
	String nickname;
	String gender;
	String profile_img;
	String grade;       //0: 일반회원, 1: 퍼스널멘토, 2: 플러스멘토, 3: 파트너멘토, 4: 게시판지기, 5: 관리자
	String introduce; //소개글
	
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
	
}
