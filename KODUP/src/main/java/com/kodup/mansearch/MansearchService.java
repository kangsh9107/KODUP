package com.kodup.mansearch;

import java.io.File;
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
	MansearchBoardVo mbVo;
	PageVo pVo;
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
	
	public boolean boardupdate(MansearchBoardVo mbVo) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		savePoint = status.createSavepoint();
		int cnt = mapper.boardupdate(mbVo);
		boolean flag = true;
		if (cnt<1) {
			status.rollbackToSavepoint(savePoint);
			flag = false;
		}
		return flag;
	}
	
	public boolean mansearchupdate(MansearchBoardVo mbVo) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		savePoint = status.createSavepoint();
		int cnt = mapper.mansearchupdate(mbVo);
		boolean flag = true;
		if (cnt<1) {
			status.rollbackToSavepoint(savePoint);
			flag = false;
		}
		return flag;
	}	
	

	
	public boolean delete(MansearchBoardVo mbVo) {
		boolean b = true;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		System.out.println("mbVo.getSno : " + mbVo.getSno());

		int cnt = mapper.delete(mbVo);
		if(cnt < 1) {
			b = false;
		}	
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		return b;
	}
	
	public void fileDelete(String delFile) {
		File file = new File(MansearchFileUploadController.path + delFile);
		if (file.exists()) file.delete();
	}
	
	public PageVo getpVo() {
		return pVo;
	}
}
