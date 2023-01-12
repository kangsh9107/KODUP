package com.kodup.mansearch;

public class MansearchBoardVo {
	int mansearch_sno;
	int sno;
	String work_start;
	int pay;
	String corp_location;
	String position;
	String job_type;
	String required_career;
	String education_level;
	String work_type;
	String deadline;
	String main_task;
	String sub_task;
	String required_skill;
	String pay_date;
	// 다중 JOIN을 위한 필드	
	String boardtype;
	String corp_name;
	String corp_logo;
	String subject;
	String doc;
	String manager_name;
	String manager_phone;
	String manager_email;
	
	// 마감일을 구하기 위한 필드
	String deadlinecount;
	
	public String getDeadlinecount() {
		return deadlinecount;
	}
	public void setDeadlinecount(String deadlinecount) {
		this.deadlinecount = deadlinecount;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public String getDoc() {
		return doc;
	}
	public void setDoc(String doc) {
		this.doc = doc;
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
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public String getMain_task() {
		return main_task;
	}
	public void setMain_task(String main_task) {
		this.main_task = main_task;
	}
	public String getSub_task() {
		return sub_task;
	}
	public void setSub_task(String sub_task) {
		this.sub_task = sub_task;
	}
	public String getRequired_skill() {
		return required_skill;
	}
	public void setRequired_skill(String required_skill) {
		this.required_skill = required_skill;
	}
	public String getBoardtype() {
		return boardtype;
	}
	public void setBoardtype(String boardtype) {
		this.boardtype = boardtype;
	}
	public String getCorp_name() {
		return corp_name;
	}
	public void setCorp_name(String corp_name) {
		this.corp_name = corp_name;
	}
	public String getCorp_logo() {
		return corp_logo;
	}
	public void setCorp_logo(String corp_logo) {
		this.corp_logo = corp_logo;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getMansearch_sno() {
		return mansearch_sno;
	}
	public void setMansearch_sno(int mansearch_sno) {
		this.mansearch_sno = mansearch_sno;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getWork_start() {
		return work_start;
	}
	public void setWork_start(String work_start) {
		this.work_start = work_start;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public String getCorp_location() {
		return corp_location;
	}
	public void setCorp_location(String corp_location) {
		this.corp_location = corp_location;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getJob_type() {
		return job_type;
	}
	public void setJob_type(String job_type) {
		this.job_type = job_type;
	}
	public String getRequired_career() {
		return required_career;
	}
	public void setRequired_career(String required_career) {
		this.required_career = required_career;
	}
	public String getEducation_level() {
		return education_level;
	}
	public void setEducation_level(String education_level) {
		this.education_level = education_level;
	}
	public String getWork_type() {
		return work_type;
	}
	public void setWork_type(String work_type) {
		this.work_type = work_type;
	}
}
