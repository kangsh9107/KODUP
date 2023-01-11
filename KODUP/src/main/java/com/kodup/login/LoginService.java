package com.kodup.login;

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
	MemberVo mVo;
	Object savePoint;
	String deleteId;
	
	public boolean login(MemberVo mVo) {
		boolean b = false;
		
		int cnt = 0;
		cnt = loginMapper.login(mVo);
		if(cnt > 0) b = true;
		
		return b;
	}
	
	public boolean checkId(String id) {
		boolean b = false;
		
		int cnt = 0;
		cnt = loginMapper.checkId(id);
		if(cnt > 0) b = true;
		
		return b;
	}
	
	public int checkGrade(String id) {
		int grade = 0;
		
		grade = loginMapper.checkGrade(id);
		
		return grade;
	}
	
	//채팅방에 접속하면 chat테이블에 INSERT
	public boolean chatInsert(String id) {
		boolean b = false;
		int cnt = 0;
		cnt = loginMapper.chatInsert(id);
		
		status = manager.getTransaction(new DefaultTransactionDefinition());
		savePoint = status.createSavepoint();
		if(cnt > 0) {
			manager.commit(status);
			b = true;
			System.out.println("인서트완료");
		} else {
			status.rollbackToSavepoint(savePoint);
		}
		
		return b;
	}
	
	public boolean checkChatId(String id) {
		boolean c = true;
		int cnt = 0;
		cnt = loginMapper.checkChatId(id);
		if(cnt > 0) c = false;
		
		return c;
	}
	
	//살려줘
	public void chatDelete(String id) {
		int cnt = 0;
		cnt = loginMapper.chatDelete(id);
		if(cnt > 0) System.out.println("채팅종료자: " + id + ", chat테이블에서 삭제");
		else        System.out.println("채팅종료자: " + id + ", chat테이블에서 삭제 실패");
	}

}
