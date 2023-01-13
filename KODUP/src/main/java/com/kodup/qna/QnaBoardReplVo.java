package com.kodup.qna;

public class QnaBoardReplVo {
	int repl_sno,sno,grp,seq,deep,repl_status,countinnerrepl,repl_delete;
	String id,repl_nal,repl_doc,profile_img,nickname,sessionid;
	
	
	
	public String getId() {	return id;	}
	public void setId(String id) {	this.id = id;	}
	//qnaboardmapper.xml 에서 insertRepl의 파라미터 타입 QnaBoardReplVo로 한번에 받아서 처리할려고 그냥추가함,시간부족
	public String getSessionid() {	return sessionid;}
	public void setSessionid(String sessionid) {	this.sessionid = sessionid;}
	
	public int getSno() {	return sno;}
	public void setSno(int sno) {	this.sno = sno;	}
	//repl_delete-댓글삭제상태값 : 이 값에 따라 출력되는 페이지가 달라짐
	//0:일반글 , 1:작성자가삭제한댓글 , 2:관리자가삭제한댓글
	public int getRepl_delete() {return repl_delete;}
	public void setRepl_delete(int repl_delete) {this.repl_delete = repl_delete;}
	
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
