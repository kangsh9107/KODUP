package com.kodup.mantoman;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

@Transactional
@Service
public class MantomanService {
	
	@Autowired
	MantomanMapper mapper;
	
	@Autowired
	PlatformTransactionManager manager;
	
	TransactionStatus status;
	Object savePoint;
	
	public MantomanVo selectId(String sessionId) {
		MantomanVo mtmVo = mapper.selectId(sessionId);
		return mtmVo;
	}
	
	public List<MantomanVo> selectMentoList() {
		List<MantomanVo> list = mapper.selectMentoList();
		return list;
	}
	
	public List<MantomanVo> selectChatList(String id) {
		System.out.println("서비스실행");
		List<MantomanVo> list = mapper.selectChatList(id);
		System.out.println("서비스실행후");
		return list;
	}
	
	public boolean insertMantoman(MantomanVo mtmVo){
		boolean b = false;
		
		int cnt = 0;
		cnt =mapper.insertMantoman(mtmVo);
		
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
	
	public boolean updateTalk(MantomanVo mtmVo){
		boolean b = false;
		
		int cnt = 0;
		cnt = mapper.updateTalk(mtmVo);
		
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
	
}
