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
	String join_date;
	int email_status;   //0: 비인증(글,댓글,추천X), 1: 인증신청, 2: 인증승인
	int mento_status;   //0: 비인증(멘토활동X),    1: 인증신청, 2: 인증승인
	int corp_status;    //0: 비인증(구인글X),      1: 인증신청, 2: 인증승인
	
	String introduce; //소개글
	
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
	public String getJoin_date() { return join_date; }
	public void setJoin_date(String join_date) { this.join_date = join_date; }
	public int getEmail_status() { return email_status; }
	public void setEmail_status(int email_status) { this.email_status = email_status; }
	public int getMento_status() { return mento_status; }
	public void setMento_status(int mento_status) { this.mento_status = mento_status; }
	public int getCorp_status() { return corp_status; }
	public void setCorp_status(int corp_status) { this.corp_status = corp_status; }
	
	public String getIntroduce() { return introduce; }
	public void setIntroduce(String introduce) { this.introduce = introduce; }
}
