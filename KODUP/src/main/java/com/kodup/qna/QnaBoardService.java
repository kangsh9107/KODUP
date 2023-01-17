package com.kodup.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

@Transactional
@Service
public class QnaBoardService {
	@Autowired
	PlatformTransactionManager manager;
	TransactionStatus status;
	
	@Autowired
	QnaBoardMapper mapper;
	
	public QnaBoardVo view(int sno) {
		QnaBoardVo qbVo=null;
		qbVo = mapper.view(sno);
		
		List<QnaHashVo> hashList = mapper.hashList(sno);
		qbVo.setHashtaglist(hashList);
		
		return qbVo;
	}
	
	public List<QnaBoardReplVo> replList(int sno) {
		List<QnaBoardReplVo> replList = null;
		replList = mapper.replList(sno);
		return replList;
	}
	
	public void thumbup(int sno) {
		mapper.thumbup(sno);
	}
	public void thumbdown(int sno) {
		mapper.thumbdown(sno);
	}
	
	public boolean qnaDeleteR(QnaBoardVo qbVo) {
		boolean b = true;
		
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		
		int cnt = mapper.qnaDeleteR(qbVo); 
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		return b;
	}
	public boolean qnaReplDeleteR(int repl_sno) {
		boolean b = true;
		
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		
		int cnt = mapper.qnaReplDeleteR(repl_sno); 
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		
		return b;
	}
	
	public boolean replChaetaek(QnaBoardReplVo qbrVo) {
		boolean b = true;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		
		int cnt = mapper.replChaetaek(qbrVo); 
		if(cnt<1) {	b=false;}
		
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		
		return b;
	}
	
	public boolean giveRewardPixel(QnaBoardVo qbVo) {
		boolean b = true;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		int cnt = mapper.giveRewardPixel(qbVo);
		if(cnt<1) { b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		return b;
	}
	
	public boolean insertRepl(QnaBoardReplVo qbrVo) {
		
		boolean b = true;
		
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		int cnt = mapper.insertRepl(qbrVo);
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		
		return b;
	}
	/*
	public void insertRepl_selected(QnaBoardReplVo qbrVo) {
		String repl_sno = mapper.
	}
	*/
	
	
	public boolean insertRepl2(QnaBoardReplVo qbrVo) {
		boolean b = true;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		int repl_sno=mapper.insertRepl2(qbrVo);//추가된 데이터의repl_sno를 string타입으로 가져옴
		int cnt = mapper.insertRepl3(repl_sno);//가져온 repl_sno를 repl_selected테이블에추가
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		return b;
	}
	public boolean insertInnerRepl(QnaBoardReplVo qbrVo) {
		boolean b = true;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		
		int cnt = mapper.insertInnerRepl(qbrVo);
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		return b;
	}
	
	public boolean insertInnerRepl2(QnaBoardReplVo qbrVo) {
		boolean b = true;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		int repl_sno=mapper.insertInnerRepl2(qbrVo);//추가된 데이터의repl_sno를 int타입으로 가져옴
		int cnt = mapper.insertInnerRepl3(repl_sno);//가져온 repl_sno를 repl_selected테이블에 추가
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		return b;
	}
	
	public int checkChaeTaek(int sno) {
		int ChaeTaekStatus=0;
		ChaeTaekStatus = mapper.checkChaeTaek(sno);
		System.out.println("채택스테이터스 서비스단:"+ChaeTaekStatus);
		
		return ChaeTaekStatus;
	}
	
	public boolean ReplUpdateR(QnaBoardReplVo qbrVo) {
		boolean b = true;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		int cnt = mapper.ReplUpdateR(qbrVo);
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		return b;
		
	}
}








