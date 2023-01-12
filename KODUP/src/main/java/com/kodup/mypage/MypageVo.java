package com.kodup.mypage;

public class MypageVo {
	String id = "";
	String email = "";
	String nickname = "";
	String gender = "";
	int age;
	String profile_img = "";
	//int grade;
	
	
	
	
	
	public String getId() { return id;}
	public void setId(String id) { this.id = id;}
	public String getNickname() { return nickname;}
	public void setNickname(String nickname) {this.nickname = nickname; }
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }
	public String getGender() { return gender; }
	public void setGender(String gender) { this.gender = gender; }
	public int getAge() { return age; }
	public void setAge(int age) { this.age = age; }
	public String getProfile_img() { return profile_img; }
	public void setProfile_img(String profile_img) { this.profile_img = profile_img; }
}
