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
		
		
		int cnt = mapper.qnaDeleteR(qbVo); //sno에 해당하는 테이블의 board_status를 1로 바꿈
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		return b;
	}
	public boolean qnaReplDeleteR(int repl_sno) {
		boolean b = true;
		
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		
		int cnt = mapper.qnaReplDeleteR(repl_sno); //sno에 해당하는 테이블의 board_status를 1로 바꿈
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		
		return b;
	}
	
	public boolean replChaetaek(int repl_sno) {
		boolean b = true;
		
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		
		int cnt = mapper.replChaetaek(repl_sno); //sno에 해당하는 테이블의 board_status를 1로 바꿈
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		
		return b;
	}
}








