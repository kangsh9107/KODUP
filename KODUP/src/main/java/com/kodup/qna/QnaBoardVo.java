package com.kodup.qna;

import java.util.ArrayList;
import java.util.List;

public class QnaBoardVo {
	int sno,viewcount,thumbup,thumbdown;
	String id,boardtype, nal, subject,doc,nickname,profile_img;
	int qna_sno,qna_pixel_reward,board_delete;
	String qna_horsehead;
	
	//board_delete-삭제상태값 : 이 값에 따라 출력되는 페이지가 달라짐
	//0:일반글 , 1:작성자가삭제한글 , 2:관리자가삭제한글
	public int getBoard_delete() {return board_delete;}
	public void setBoard_delete(int board_delete) {	this.board_delete = board_delete;}
	
	
	//해시태그; sno 1개에 해시태그 여러개달릴 수 있는데 1로우로 한줄로 저장하고 자바단에서 샵# 단위로 데이터포맷?
	//아니면 sno에 맞는 해시태그 테이블을 만들어서 로우 1개에 해시태그 1개씩저장?
	List<QnaHashVo> hashtaglist = new ArrayList<QnaHashVo>();
	public List<QnaHashVo> getHashtaglist() {return hashtaglist;}
	public void setHashtaglist(List<QnaHashVo> hashtaglist) {this.hashtaglist = hashtaglist;}
	
	//게시판공통컬럼(board)
	public int getSno() {return sno;}
	public void setSno(int sno) {this.sno = sno;}
	public int getViewcount() {return viewcount;}
	public void setViewcount(int viewcount) {this.viewcount = viewcount;}
	public int getThumbup() {return thumbup;}
	public void setThumbup(int thumbup) {this.thumbup = thumbup;}
	public int getThumbdown() {return thumbdown;}
	public void setThumbdown(int thumbdown) {this.thumbdown = thumbdown;}
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}
	public String getBoardtype() {return boardtype;}
	public void setBoardtype(String boardtype) {this.boardtype = boardtype;}
	public String getNal() {return nal;}
	public void setNal(String nal) {this.nal = nal;}
	public String getSubject() {return subject;	}
	public void setSubject(String subject) {this.subject = subject;}
	public String getDoc() {return doc;}
	public void setDoc(String doc) {this.doc = doc;	}
	
	//qna게시판(QnA_board)
	public int getQna_sno() {return qna_sno;}
	public void setQna_sno(int qna_sno) {this.qna_sno = qna_sno;}
	public int getQna_pixel_reward() {return qna_pixel_reward;}
	public void setQna_pixel_reward(int qna_pixel_reward) {this.qna_pixel_reward = qna_pixel_reward;}
	public String getQna_horsehead() {return qna_horsehead;}
	public void setQna_horsehead(String qna_horsehead) {this.qna_horsehead = qna_horsehead;}

	//member테이블
	public String getNickname() {return nickname;}
	public void setNickname(String nickname) {this.nickname = nickname;}
	public String getProfile_img() {return profile_img;	}
	public void setProfile_img(String profile_img) {this.profile_img = profile_img;	}
}
