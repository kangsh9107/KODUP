package com.kodup.mantoman;

public class MantomanVo {

	String id;
	String pwd;
	String email;
	String nickname;
	String gender;
	int age;
	String profile_img;
	int account_type;   //0: 일반회원, 1: 카카오회원
	int ban_status;
	int pixel;
	String grade;       //0: 일반회원, 1: 퍼스널멘토, 2: 플러스멘토, 3: 파트너멘토, 4: 게시판지기, 5: 관리자
	int mento_status;   //0: 비인증(멘토활동X),    1: 인증신청, 2: 인증승인
	
	String introduce; //소개글
	String your_id;
	String doc;
	String last_talktime;
	String last_talk;
	int mantoman_pixel_reward;
	String roomCode;
	
	public String getId() { return id; }
	public void setId(String id) { this.id = id; }
	public String getPwd() { return pwd; }
	public void setPwd(String pwd) { this.pwd = pwd; }
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }
	public String getNickname() { return nickname; }
	public void setNickname(String nickname) { this.nickname = nickname; }
	public String getGender() { return gender; }
	public void setGender(String gender) { this.gender = gender; }
	public int getAge() { return age; }
	public void setAge(int age) { this.age = age; }
	public String getProfile_img() { return profile_img; }
	public void setProfile_img(String profile_img) { this.profile_img = profile_img; }
	public int getAccount_type() { return account_type; }
	public void setAccount_type(int account_type) { this.account_type = account_type; }
	public int getBan_status() { return ban_status; }
	public void setBan_status(int ban_status) { this.ban_status = ban_status; }
	public int getPixel() { return pixel; }
	public void setPixel(int pixel) { this.pixel = pixel; }
	public String getGrade() { return grade; }
	public void setGrade(String grade) { this.grade = grade; }
	public int getMento_status() { return mento_status; }
	public void setMento_status(int mento_status) { this.mento_status = mento_status; }
	
	public String getIntroduce() { return introduce; }
	public void setIntroduce(String introduce) { this.introduce = introduce; }
	public String getYour_id() { return your_id; }
	public void setYour_id(String your_id) { this.your_id = your_id; }
	public String getDoc() { return doc; }
	public void setDoc(String doc) { this.doc = doc; }
	public String getLast_talktime() { return last_talktime; }
	public void setLast_talktime(String last_talktime) { this.last_talktime = last_talktime; }
	
	public String getLast_talk() { return last_talk; }
	public void setLast_talk(String last_talk) { this.last_talk = last_talk; }
	public int getMantoman_pixel_reward() { return mantoman_pixel_reward; }
	public void setMantoman_pixel_reward(int mantoman_pixel_reward) { this.mantoman_pixel_reward = mantoman_pixel_reward; }
	public String getRoomCode() { return roomCode; }
	public void setRoomCode(String roomCode) { this.roomCode = roomCode; }
	
}
