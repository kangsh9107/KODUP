package com.kodup.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;

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

}
