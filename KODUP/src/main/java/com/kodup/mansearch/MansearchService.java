package com.kodup.mansearch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.kodup.board.BoardVo;
import com.kodup.board.PageVo;

@Service
@Transactional
public class MansearchService {
	BoardVo bVo;
	
	@Autowired
	MansearchMapper mapper;
	Object savePoint;
	
	@Autowired
	PlatformTransactionManager manager;
	TransactionStatus status;
	

	public List<MansearchBoardVo> select(PageVo pVo){
		List<MansearchBoardVo> list = mapper.select(pVo);
		return list;
	}
	
	public MansearchBoardVo view(int sno) {
		MansearchBoardVo mbVo = null;
		mbVo = mapper.view(sno);
		return mbVo;
	}
	
	public boolean boardinsert(MansearchBoardVo mbVo) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		savePoint = status.createSavepoint();
		int cnt = mapper.boardinsert(mbVo);
		boolean flag = true;
		if (cnt<1) {
			status.rollbackToSavepoint(savePoint);
			flag = false;
		}
		return flag;
	}
	
	public boolean mansearchinsert(MansearchBoardVo mbVo) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		savePoint = status.createSavepoint();
		int cnt = mapper.mansearchinsert(mbVo);
		boolean flag = true;
		if (cnt<1) {
			status.rollbackToSavepoint(savePoint);
			flag = false;
		}
		return flag;
	}
	
	public void corpinsert(MansearchBoardVo mbVo) {
		int cnt = mapper.corpinsert(mbVo);
		if (cnt > 0) {
			manager.commit(status);
		}else {
			status.rollbackToSavepoint(savePoint);
		}
	}
	
//	public void insertAttList(List<MansearchAttVo> attList) {
//		int cnt = mapper.insertAttList(attList);
//		if(cnt>0) {
//			manager.commit(status);
//		}else {
//			status.rollbackToSavepoint(savePoint);
//		}
//	}

}
