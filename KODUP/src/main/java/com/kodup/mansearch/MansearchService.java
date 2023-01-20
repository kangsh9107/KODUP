package com.kodup.mansearch;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.kodup.board.PageVo;
import com.kodup.login.MemberVo;

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
		int totSize = mapper.totList(pVo);
		pVo.setTotSize(totSize);
		this.pVo = pVo;
		List<MansearchBoardVo> list = mapper.select(pVo);
		return list;
	}
	
	public List<MansearchBoardVo> review(int sno){
		List<MansearchBoardVo> list = mapper.review(sno);
		return list;
	}	
	
	public List<MansearchBoardVo> premiumlist(int sno, MemberVo mVo){
		List<MansearchBoardVo> premiumlist = mapper.premiumlist(sno);
		List<MansearchBoardVo> buylist = mapper.buylist(mVo);
		for(MansearchBoardVo l : premiumlist) {
			   for(MansearchBoardVo b : buylist) {
			      if(l.premium_review_sno == b.premium_review_sno) l.setStatus(1);
			   }
			}
		return premiumlist;
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
		savePoint = status.createSavepoint();
		
		System.out.println("mbVo.getSno : " + mbVo.getSno());

		int cnt = mapper.delete(mbVo);
		if(cnt < 1) {
			b = false;
		}	
		
		if(b) manager.commit(status);
		else status.rollbackToSavepoint(savePoint);
		
		return b;
	}
	public int corp_status(MansearchBoardVo mbVo) {
		int corp_status = mapper.corp_status(mbVo);

		return corp_status;
	}
	
	public PageVo getpVo() {
		return pVo;
	}
}
