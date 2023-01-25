package com.kodup.infoshare;

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
public class InfoshareBoardService {
	@Autowired
	PlatformTransactionManager manager;
	TransactionStatus status;
	
	@Autowired
	InfoshareBoardMapper mapper;
	
	@Autowired
	CommonBoardMapper cbMapper;
	
	public InfoshareBoardVo view(int sno) {
		InfoshareBoardVo ibVo=null;
		ibVo = mapper.view(sno);
		
		cbMapper.viewcountUp(sno); //조회수 증가
		int viewcount = cbMapper.getViewcount(sno);
		ibVo.setViewcount(viewcount); //증가된 조회수 VIEW에서 즉시 반영
		
		List<InfoshareHashVo> hashList = mapper.hashList(sno);
		ibVo.setHashtaglist(hashList);
		
		return ibVo;
	}
	
	public List<InfoshareBoardReplVo> replList(int sno) {
		List<InfoshareBoardReplVo> replList = null;
		replList = mapper.replList(sno);
		return replList;
	}
	
	public void thumbup(int sno) {
		mapper.thumbup(sno);
	}
	public void thumbdown(int sno) {
		mapper.thumbdown(sno);
	}
	
	public boolean infoshareDeleteR(InfoshareBoardVo ibVo) {
		boolean b = true;
		
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		
		int cnt = mapper.infoshareDeleteR(ibVo); 
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		return b;
	}
	public boolean infoshareReplDeleteR(int repl_sno) {
		boolean b = true;
		
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		
		int cnt = mapper.infoshareReplDeleteR(repl_sno); 
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		
		return b;
	}

	public boolean insertRepl(InfoshareBoardReplVo ibrVo) {
		
		boolean b = true;
		
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		int cnt = mapper.insertRepl(ibrVo);
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		
		return b;
	}
	
	public boolean insertInnerRepl(InfoshareBoardReplVo ibrVo) {
		boolean b = true;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		
		int cnt = mapper.insertInnerRepl(ibrVo);
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		return b;
	}
	
	public boolean ReplUpdateR(InfoshareBoardReplVo ibrVo) {
		boolean b = true;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		int cnt = mapper.ReplUpdateR(ibrVo);
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		return b;
		
	}	
	
	
}
