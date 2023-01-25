package com.kodup.mypage;

public class MypageCertiVo {

	String id;
	
	//이메일인증은 member 테이블에 있어서 생략

	//계좌인증
	String bank_name;       //은행명
	String account_holder;  //예금주
	String account; 	    //계좌번호

	
	//멘토 경력증명
	String career_certificate;   //경력증명서

	
	//기업인증
	String corp_license;   //사업자 등록증
	String corp_logo;	   //회사 로고
	String corp_name;      //회사명
	String corp_phone;     //회사 연락처
	String corp_email;     //회사 이메일

	String manager_name;    //담당자 이름
	String manager_phone;   //담당자 번호
	String manager_email;   //담당자 이메일
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getAccount_holder() {
		return account_holder;
	}
	public void setAccount_holder(String account_holder) {
		this.account_holder = account_holder;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getCareer_certificate() {
		return career_certificate;
	}
	public void setCareer_certificate(String career_certificate) {
		this.career_certificate = career_certificate;
	}
	public String getCorp_license() {
		return corp_license;
	}
	public void setCorp_license(String corp_license) {
		this.corp_license = corp_license;
	}
	public String getCorp_logo() {
		return corp_logo;
	}
	public void setCorp_logo(String corp_logo) {
		this.corp_logo = corp_logo;
	}
	public String getCorp_name() {
		return corp_name;
	}
	public void setCorp_name(String corp_name) {
		this.corp_name = corp_name;
	}
	public String getCorp_phone() {
		return corp_phone;
	}
	public void setCorp_phone(String corp_phone) {
		this.corp_phone = corp_phone;
	}
	public String getCorp_email() {
		return corp_email;
	}
	public void setCorp_email(String corp_email) {
		this.corp_email = corp_email;
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	public String getManager_phone() {
		return manager_phone;
	}
	public void setManager_phone(String manager_phone) {
		this.manager_phone = manager_phone;
	}
	public String getManager_email() {
		return manager_email;
	}
	public void setManager_email(String manager_email) {
		this.manager_email = manager_email;
	}
	
	
	
}
