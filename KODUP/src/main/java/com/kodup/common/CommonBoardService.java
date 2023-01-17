package com.kodup.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

@Service
@Transactional
public class CommonBoardService {
	
	@Autowired
	CommonBoardMapper cbMapper;

	@Autowired
	PlatformTransactionManager manager;
	
	TransactionStatus status;
	Object savePoint;
	CommonBoardPageVo cbpVo;
	
	//Q&A LIST
	public List<SelectBoardVo> listQna(CommonBoardPageVo cbpVo) {
		int totSize = 0;
		String horsehead = cbpVo.getHorsehead();
		
		List<CommonBoardPageVo> listTemp = cbMapper.totList(cbpVo);
		for(CommonBoardPageVo l : listTemp) {
			if(horsehead.equals("")) {
				totSize += l.getTotSize();
			} else if(l.getHorsehead().equals(horsehead)) {
				totSize = l.getTotSize();
			}
		}
		cbpVo.setTotSize(totSize);
		this.cbpVo = cbpVo;
		List<SelectBoardVo> listQna = cbMapper.listQna(cbpVo);
		
		return listQna;
	}
	
	//Hash Tag 검색
	public List<SelectBoardVo> listHashtag(CommonBoardPageVo cbpVo) {
		int totSize = 0;
		String horsehead = cbpVo.getHorsehead();
		
		List<CommonBoardPageVo> listTemp = cbMapper.totListHashtag(cbpVo);
		for(CommonBoardPageVo l : listTemp) {
			if(horsehead.equals("")) {
				totSize += l.getTotSize();
			} else if(l.getHorsehead().equals(horsehead)) {
				totSize = l.getTotSize();
			}
		}
		cbpVo.setTotSize(totSize);
		this.cbpVo = cbpVo;
		List<SelectBoardVo> listHashtag = cbMapper.listHashtag(cbpVo);
		
		return listHashtag;
	}
	
	//INSERT
	public boolean insert(InsertBoardVo ibVo) {
		boolean b = false; //true면 board테이블 insert 성공
		int sno = 0;
		int cnt = cbMapper.insertBoard(ibVo);
		status = manager.getTransaction(new DefaultTransactionDefinition());
		savePoint = status.createSavepoint();
		if(cnt > 0) {
			manager.commit(status);
			b = true;
			sno = cbMapper.getSno(); //board테이블의 마지막 sno 가져옴
			ibVo.setSno(sno);
			
			boolean c = false; //true면 qna_board테이불 insert 성공
			int cnt2 = cbMapper.insertQnaBoard(ibVo);
			status = manager.getTransaction(new DefaultTransactionDefinition());
			savePoint = status.createSavepoint();
			if(cnt2 > 0) {
				manager.commit(status);
				c = true;
			} else {
				status.rollbackToSavepoint(savePoint);
				b = false;
			}
		} else {
			status.rollbackToSavepoint(savePoint);
		}
		
		return b;
	}

	public CommonBoardPageVo getCbpVo() { return cbpVo; }
	
}
