package com.kodup.jobsearch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;


@Transactional
@Service
public class JobsearchBoardService {
	@Autowired
	PlatformTransactionManager manager;
	TransactionStatus status;
	
	@Autowired
	JobsearchBoardMapper mapper;
	
	public JobsearchBoardVo view(int sno) {
		JobsearchBoardVo jbVo=null;
		jbVo = mapper.view(sno);
		
		List<JobsearchHashVo> hashList = mapper.hashList(sno);
		jbVo.setHashtaglist(hashList);
		
		return jbVo;
	}
	
	public List<JobsearchBoardReplVo> replList(int sno) {
		List<JobsearchBoardReplVo> replList = null;
		replList = mapper.replList(sno);
		return replList;
	}
	
	public void thumbup(int sno) {
		mapper.thumbup(sno);
	}
	public void thumbdown(int sno) {
		mapper.thumbdown(sno);
	}
	
	public boolean jobsearchDeleteR(JobsearchBoardVo jbVo) {
		boolean b = true;
		
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		
		int cnt = mapper.jobsearchDeleteR(jbVo); 
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		return b;
	}
	public boolean jobsearchReplDeleteR(int repl_sno) {
		boolean b = true;
		
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		
		int cnt = mapper.jobsearchReplDeleteR(repl_sno); 
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		
		return b;
	}

	public boolean insertRepl(JobsearchBoardReplVo jbrVo) {
		
		boolean b = true;
		
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		int cnt = mapper.insertRepl(jbrVo);
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		
		return b;
	}
	
	public boolean insertInnerRepl(JobsearchBoardReplVo jbrVo) {
		boolean b = true;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		
		int cnt = mapper.insertInnerRepl(jbrVo);
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		return b;
	}
	
	public boolean ReplUpdateR(JobsearchBoardReplVo jbrVo) {
		boolean b = true;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		int cnt = mapper.ReplUpdateR(jbrVo);
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		return b;
		
	}	
	
	
	
	
}
