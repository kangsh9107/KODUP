package com.kodup.qna;

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
public class QnaBoardService {
	@Autowired
	PlatformTransactionManager manager;
	TransactionStatus status;
	
	@Autowired
	QnaBoardMapper mapper;
	
	@Autowired
	CommonBoardMapper cbMapper;
	
	public QnaBoardVo view(int sno) {
		QnaBoardVo qbVo=null;
		qbVo = mapper.view(sno);
		
		cbMapper.viewcountUp(sno); //조회수 증가
		int viewcount = cbMapper.getViewcount(sno);
		qbVo.setViewcount(viewcount); //증가된 조회수 VIEW에서 즉시 반영
		
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
	
	public boolean giveRewardPixel(QnaBoardVo qbVo,QnaBoardReplVo qbrVo) {
		boolean b = true;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		int cnt = mapper.giveRewardPixel(qbVo);
		if(cnt<1) { b=false; }
		
		if(b) {
			if(qbVo.getQna_pixel_reward()!=0) {
				cnt = mapper.pixel_history(qbVo);
				if(cnt<1) {b=false;}
			}
			if(b){manager.commit(status);}
			else{status.rollbackToSavepoint(savePoint);}
		}else status.rollbackToSavepoint(savePoint);
		
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
	
	
	
	public boolean insertRepl2(QnaBoardReplVo qbrVo) {
		boolean b = true;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		int repl_sno=mapper.insertRepl2(qbrVo);//추가된 데이터의repl_sno를 int타입으로 가져옴
		int cnt = mapper.insertRepl3(repl_sno);//가져온 repl_sno를 repl_selected에 데이터 추가
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
		//insertInnerRepl2를 통해 입력된 대댓의 repl_sno를 찾고
		//그 repl_sno와 jsp에서 폼태그시리얼라이즈로가져온 repl_status를 qbrVo에담아 xml통해 입력
		//(repl_status:채택된댓글에 대댓글인경우 1이 입력될거고 아니면 0이입력)
		qbrVo.setRepl_sno(repl_sno);
		int cnt = mapper.insertInnerRepl3(qbrVo);//repl_selected 데이터 추가
		if(cnt<1) {	b=false; }
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		return b;
	}
	
	
	//채택이 완료된 sno글에 채택된 댓글에 대댓글을 단경우 해당sno의 채택된 repl_sno 개수를 셀렉트함.
	public int checkChaeTaek(int sno) {
		int ChaeTaekStatus=0;
		ChaeTaekStatus = mapper.checkChaeTaek(sno);
		
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








