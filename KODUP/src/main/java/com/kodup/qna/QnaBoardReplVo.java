package com.kodup.qna;

public class QnaBoardReplVo {
	int grp,seq,deep,repl_status,repl_sno,countinnerrepl;
	String repl_nal,repl_doc,profile_img,nickname;
	
	//countinnerrepl:댓글에 달려있는 대댓글의 수 ; 쿼리문 서브쿼리를통해 셀렉트함
	//qna.jsp에서 button id:repl_inner_display_onkey2 , c:if조건문걸기위해 필요
	
	public int getCountinnerrepl() {return countinnerrepl;}
	public void setCountinnerrepl(int countinnerrepl) {this.countinnerrepl = countinnerrepl;}
	//댓글테이블(repl)
	public int getRepl_sno() {	return repl_sno;}
	public void setRepl_sno(int repl_sno) {	this.repl_sno = repl_sno;}
	public int getGrp() {return grp;}
	public void setGrp(int grp) {this.grp = grp;}
	public int getSeq() {return seq;}
	public void setSeq(int seq) {this.seq = seq;}
	public int getDeep() {return deep;}
	public void setDeep(int deep) {this.deep = deep;}
	public String getRepl_nal() {return repl_nal;}
	public void setRepl_nal(String repl_nal) {this.repl_nal = repl_nal;}
	public String getRepl_doc() {return repl_doc;}
	public void setRepl_doc(String repl_doc) {this.repl_doc = repl_doc;}
	
	//멤버테이블(member)
	public String getProfile_img() {return profile_img;}
	public void setProfile_img(String profile_img) {this.profile_img = profile_img;}
	public String getNickname() {return nickname;}
	public void setNickname(String nickname) {this.nickname = nickname;}
	
	//댓글채택상태테이블(repl_selected)
	public int getRepl_status() {return repl_status;}
	public void setRepl_status(int repl_status) {this.repl_status = repl_status;}
	
}
