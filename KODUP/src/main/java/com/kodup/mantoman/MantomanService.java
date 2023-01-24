package com.kodup.mantoman;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.kodup.profile.ProfileVo;

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
		System.out.println("roomCode 확인 : " + mtmVo.getRoomCode());
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
	
	public boolean insertMantoman2(MantomanVo mtmVo){
		boolean b = false;
		
		int cnt = 0;
		System.out.println("roomCode 확인 : " + mtmVo.getRoomCode());
		cnt =mapper.insertMantoman2(mtmVo);
		
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
	
	public boolean updateChatStatus(String sessionId) {
		boolean b = false;
		
		int cnt = 0;
		cnt = mapper.updateChatStatus(sessionId);
		
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
	
	public void updateFile(MantomanAttVo mtmAttVo){
		status = manager.getTransaction(new DefaultTransactionDefinition());
		savePoint = status.createSavepoint();
		int cnt = mapper.updateFile(mtmAttVo);
		
		if(cnt>0) {
			manager.commit(status);
		}else {
			status.rollbackToSavepoint(savePoint);
		}
	}
	
	public boolean chatPixelReward(MantomanVo mtmVo){
		boolean b = false;
		System.out.println("여기도 들어옴");
		int cnt = 0;
		cnt = mapper.chatPixelReward(mtmVo);
		
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
	
	public boolean chatPixelLog(MantomanVo mtmVo){
		boolean b = false;
		
		int cnt = 0;
		System.out.println("roomCode 확인 : " + mtmVo.getRoomCode());
		cnt =mapper.chatPixelLog(mtmVo);
		
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
	
	public boolean chatPixelReward2(MantomanVo mtmVo){
		boolean b = false;
		System.out.println("여기도 들어옴");
		int cnt = 0;
		cnt = mapper.chatPixelReward2(mtmVo);
		
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
	
	public boolean chatPixelLog2(MantomanVo mtmVo){
		boolean b = false;
		
		int cnt = 0;
		System.out.println("roomCode 확인 : " + mtmVo.getRoomCode());
		cnt =mapper.chatPixelLog2(mtmVo);
		
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

	public boolean updateChatStatus2(String id) {
boolean b = false;
		
		int cnt = 0;
		cnt = mapper.updateChatStatus2(id);
		
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

//	public ProfileVo selectProfile(String sessionId) {
//		MantomanVo mtmVo = mapper.selectId(sessionId);
//		return mtmVo;
//	}
}
