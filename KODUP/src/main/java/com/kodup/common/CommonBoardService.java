package com.kodup.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.kodup.qna.QnaBoardVo;

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
			if(horsehead.equals("")) totSize += l.getTotSize();
			else if(l.getHorsehead().equals(horsehead)) totSize = l.getTotSize();
		}
		cbpVo.setTotSize(totSize);
		this.cbpVo = cbpVo;
		List<SelectBoardVo> listQna = cbMapper.listQna(cbpVo); //조건에 맞는 전체 리스트
		List<SelectBoardVo> view = cbMapper.listView(cbpVo);   //조건에 맞는 해당 아이디가 본 글 리스트
		for(SelectBoardVo l : listQna) { //봤던 글 viewStatus 1로 변경
			for(SelectBoardVo v : view) {
				if(l.sno == v.sno) l.setViewStatus(1);
			}
		}
		
		return listQna;
	}
	
	//Hash Tag 검색
	public List<SelectBoardVo> listHashtag(CommonBoardPageVo cbpVo) {
		int totSize = 0;
		String horsehead = cbpVo.getHorsehead();
		List<CommonBoardPageVo> listTemp = cbMapper.totListHashtag(cbpVo);
		for(CommonBoardPageVo l : listTemp) {
			if(horsehead.equals("")) totSize += l.getTotSize();
			else if(l.getHorsehead().equals(horsehead)) totSize = l.getTotSize();
		}
		cbpVo.setTotSize(totSize);
		this.cbpVo = cbpVo;
		List<SelectBoardVo> listHashtag = cbMapper.listHashtag(cbpVo);
		List<SelectBoardVo> view = cbMapper.listView(cbpVo);
		for(SelectBoardVo l : listHashtag) { //봤던 글 viewStatus 1로 변경
			for(SelectBoardVo v : view) {
				if(l.sno == v.sno) l.setViewStatus(1);
			}
		}
		
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
			
			boolean c = false; //true면 qna_board테이블 insert 성공
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
	
	//UPDATE
	public boolean update(InsertBoardVo ibVo) {
		boolean b = false; //true면 board테이블 update 성공
		int sno = 0;
		int cnt = cbMapper.updateBoard(ibVo);
		status = manager.getTransaction(new DefaultTransactionDefinition());
		savePoint = status.createSavepoint();
		if(cnt > 0) {
			manager.commit(status);
			b = true;
			sno = cbMapper.getSno(); //board테이블의 마지막 sno 가져옴
			ibVo.setSno(sno);
			
			boolean c = false; //true면 qna_board테이블 update 성공
			int cnt2 = cbMapper.updateQnaBoard(ibVo);
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
	
	//봤던글 표시
	public void insertView(CommonBoardPageVo cbpVo) {
		boolean b = checkView(cbpVo);
		if( !b ) {
			int cnt = cbMapper.insertView(cbpVo);
			status = manager.getTransaction(new DefaultTransactionDefinition());
			savePoint = status.createSavepoint();
			if(cnt > 0) manager.commit(status);
			else status.rollbackToSavepoint(savePoint);
		}
	}
	
	//봤던글인지 체크
	public boolean checkView(CommonBoardPageVo cbpVo) {
		boolean b = false; //false면 아직 안봤다
		int cnt = cbMapper.checkView(cbpVo);
		if(cnt > 0) b = true;
		return b;
	}

	public CommonBoardPageVo getCbpVo() { return cbpVo; }
	
}
