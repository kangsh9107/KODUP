package com.kodup.pixel;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.kodup.login.MemberVo;

@Service
@Transactional
public class PixelService {

	@Autowired
	PixelMapper mapper;
	Object savePoint;
	
	@Autowired
	PlatformTransactionManager manager;
	TransactionStatus status;
	
	public List<PixelPriceVo> select(){
		List<PixelPriceVo> list = mapper.select();
		return list;
	}
	
	public PixelBuyVo buylist(MemberVo mVo) {
		PixelBuyVo buyVo = null;
		buyVo = mapper.addlist(mVo);
		return buyVo;
	}
	
	public boolean addpixel(MemberVo mVo) {
		boolean b = true;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		savePoint = status.createSavepoint();
		int cnt = mapper.pixeladd(mVo);
		if(cnt<1) {
			b=false;
		}
		if(b) {
			manager.commit(status);
		}else {
			status.rollbackToSavepoint(savePoint);
		}
		return b;
	}
}
