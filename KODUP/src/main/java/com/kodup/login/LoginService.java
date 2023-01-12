package com.kodup.login;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

@Service
@Transactional
public class LoginService {
	
	@Autowired
	LoginMapper loginMapper;
	
	@Autowired
	PlatformTransactionManager manager;
	
	TransactionStatus status;
	Object savePoint;
	String deleteId;
	MemberVo mVo;
	IndexBoardVo qbVo;
	
	//ID&PWD 체크후 로그인여부 판단
	public boolean login(MemberVo mVo) {
		boolean b = false; //true면 로그인 성공
		int cnt = 0;
		cnt = loginMapper.login(mVo);
		if(cnt > 0) b = true;
		
		return b;
	}
	
	//member테이블 id중복체크
	public boolean checkId(String id) {
		boolean b = false; //true면 id 중복
		int cnt = 0;
		cnt = loginMapper.checkId(id);
		if(cnt > 0) b = true;
		
		return b;
	}
	
	//member테이블 nickname 중복체크
	public boolean checkNickname(String nickname) {
		boolean b = false; //true면 nickname 중복
		int cnt = 0;
		cnt = loginMapper.checkNickname(nickname);
		if(cnt > 0) b = true;
		
		return b;
	}
	
	//member테이블 kakao회원 insert
	public boolean insertMemberKakao(MemberVo mVo) {
		boolean c = false; //true면 가입완료
		int cnt = 0;
		cnt = loginMapper.insertMemberKakao(mVo);
		status = manager.getTransaction(new DefaultTransactionDefinition());
		savePoint = status.createSavepoint();
		if(cnt > 0) {
			manager.commit(status);
			c = true;
		} else {
			status.rollbackToSavepoint(savePoint);
		}
		
		return c;
	}
	
	//member테이블 kodup회원 insert
	public boolean insertMember(MemberVo mVo) {
		boolean i = false; //true면 가입완료
		int cnt = 0;
		cnt = loginMapper.insertMember(mVo);
		status = manager.getTransaction(new DefaultTransactionDefinition());
		savePoint = status.createSavepoint();
		if(cnt > 0) {
			manager.commit(status);
			i = true;
		} else {
			status.rollbackToSavepoint(savePoint);
		}
		
		return i;
	}
	
	//member테이블 grade(회원등급) 가져오기
	public int checkGrade(String id) {
		int grade = loginMapper.checkGrade(id);
		return grade;
	}
	
	//chat테이블 id 중복체크
	public boolean checkChatId(String id) {
		boolean c = false;
		int cnt = 0;
		cnt = loginMapper.checkChatId(id);
		if(cnt > 0) c = true;
		
		return c;
	}
	
	//채팅방에 접속하면 chat테이블에 id INSERT
	public boolean chatInsert(String id) {
		boolean b = false;
		int cnt = 0;
		cnt = loginMapper.chatInsert(id);
		
		status = manager.getTransaction(new DefaultTransactionDefinition());
		savePoint = status.createSavepoint();
		if(cnt > 0) {
			manager.commit(status);
			b = true;
		} else {
			status.rollbackToSavepoint(savePoint);
		}
		
		return b;
	}
	
	//로그아웃시 chat테이블에서 id delete
	public void chatDelete(String id) {
		int cnt = 0;
		cnt = loginMapper.chatDelete(id);
		if(cnt > 0) System.out.println("채팅종료자: " + id + ", chat테이블에서 삭제");
		else        System.out.println("채팅종료자: " + id + ", chat테이블에서 삭제 실패");
	}
	
	//TOP WRITER
	public List<MemberVo> topWriter() {
		List<MemberVo> listTopWriter = loginMapper.topWriter();
		return listTopWriter;
	}
	
	//HOT TAG
	public List<CommonBoardVo> hotTag() {
		List<CommonBoardVo> listHotTag = loginMapper.hotTag();
		return listHotTag;
	}
	
	//QNA5
	public List<IndexBoardVo> qna5() {
		List<IndexBoardVo> qna5 = loginMapper.qna5();
		return qna5;
	}
	
	//FREETALKING5
	public List<IndexBoardVo> freetalking5() {
		List<IndexBoardVo> freetalking5 = loginMapper.freetalking5();
		return freetalking5;
	}
	
	//INFOSHARE5
	public List<IndexBoardVo> infoshare5() {
		List<IndexBoardVo> infoshare5 = loginMapper.infoshare5();
		return infoshare5;
	}
	
	//NOTIFICATION5
	public List<IndexBoardVo> notification5() {
		List<IndexBoardVo> notification5 = loginMapper.notification5();
		return notification5;
	}
	
	//WEEKLYBEST5
	public List<IndexBoardVo> weeklyBest5() {
		List<IndexBoardVo> weeklyBest5 = loginMapper.weeklyBest5();
		return weeklyBest5;
	}

}
