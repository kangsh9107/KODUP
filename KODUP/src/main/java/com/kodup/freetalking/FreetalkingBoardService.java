package com.kodup.freetalking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.kodup.common.CommonBoardMapper;

@Transactional
@Service
public class FreetalkingBoardService {
	@Autowired
	PlatformTransactionManager manager;
	TransactionStatus status;
	
	@Autowired
	FreetalkingBoardMapper mapper;
	
	@Autowired
	CommonBoardMapper cbMapper;
	
	public FreetalkingBoardVo view(int sno) {
		FreetalkingBoardVo fbVo=null;
		fbVo = mapper.view(sno);
		
		cbMapper.viewcountUp(sno); //조회수 증가
		int viewcount = cbMapper.getViewcount(sno);
		fbVo.setViewcount(viewcount); //증가된 조회수 VIEW에서 즉시 반영
		
		List<FreetalkingHashVo> hashList = mapper.hashList(sno);
		fbVo.setHashtaglist(hashList);
		
		return fbVo;
	}
	
	public List<FreetalkingBoardReplVo> replList(int sno) {
		List<FreetalkingBoardReplVo> replList = null;
		replList = mapper.replList(sno);
		return replList;
	}
	
	public void thumbup(int sno) {
		mapper.thumbup(sno);
	}
	public void thumbdown(int sno) {
		mapper.thumbdown(sno);
	}
	
	public boolean freetalkingDeleteR(FreetalkingBoardVo fbVo) {
		boolean b = true;
		
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		
		int cnt = mapper.freetalkingDeleteR(fbVo); 
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		return b;
	}
	public boolean freetalkingReplDeleteR(int repl_sno) {
		boolean b = true;
		
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		
		int cnt = mapper.freetalkingReplDeleteR(repl_sno); 
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		
		return b;
	}

	public boolean insertRepl(FreetalkingBoardReplVo fbrVo) {
		
		boolean b = true;
		
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		int cnt = mapper.insertRepl(fbrVo);
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		
		return b;
	}

	public boolean insertInnerRepl(FreetalkingBoardReplVo fbrVo) {
		boolean b = true;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		
		int cnt = mapper.insertInnerRepl(fbrVo);
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		return b;
	}
	

	

	
	public boolean ReplUpdateR(FreetalkingBoardReplVo fbrVo) {
		boolean b = true;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		int cnt = mapper.ReplUpdateR(fbrVo);
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		return b;
		
	}
	
	
}
