package com.kodup.mantoman;

public class MantomanVo {

	String id;
	String nickname;
	String gender;
	String profile_img;
	int pixel;
	String grade;       //0: 일반회원, 1: 퍼스널멘토, 2: 플러스멘토, 3: 파트너멘토, 4: 게시판지기, 5: 관리자
	
	String chat_status;
	String introduce; //소개글
	String your_id;
	String doc;
	String last_talktime;
	String last_talk;
	int mantoman_pixel_reward;
	String requiredTime;
	String roomCode;
	
	public String getId() { return id; }
	public void setId(String id) { this.id = id; }
	public String getNickname() { return nickname; }
	public void setNickname(String nickname) { this.nickname = nickname; }
	public String getGender() { return gender; }
	public void setGender(String gender) { this.gender = gender; }
	public String getProfile_img() { return profile_img; }
	public void setProfile_img(String profile_img) { this.profile_img = profile_img; }
	public int getPixel() { return pixel; }
	public void setPixel(int pixel) { this.pixel = pixel; }
	public String getGrade() { return grade; }
	public void setGrade(String grade) { this.grade = grade; }
	
	public String getChat_status() { return chat_status; }
	public void setChat_status(String chat_status) { this.chat_status = chat_status; }
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
	
	public String getRequiredTime() { return requiredTime; }
	public void setRequiredTime(String requiredTime) { this.requiredTime = requiredTime; }
	public String getRoomCode() { return roomCode; }
	public void setRoomCode(String roomCode) { this.roomCode = roomCode; }
	
}
