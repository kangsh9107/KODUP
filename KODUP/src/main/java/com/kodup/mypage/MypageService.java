package com.kodup.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MypageService {
	@Autowired
	MypageMapper mypageMapper;

	@Autowired
	PlatformTransactionManager manager;
	
	TransactionStatus status;
	MypageVo mpVo;
	MypageQuitVo mqVo;
	Object savePoint;
	
	public MypageVo info(String id) {
		mpVo = new MypageVo();
		mpVo = mypageMapper.info(id);
		
		
		return mpVo;
	}
	
	
	public MypageVo info_update_complete(String id) {
		mpVo = new MypageVo();
		mpVo = mypageMapper.info_update_complete(id);
		System.out.println("수정완료버튼..서비스..연결됨...");
		System.out.println("mpVo");
		return mpVo;
	}
	
	
	public MypageQuitVo member_quit(String id) {
		mqVo = new MypageQuitVo();
		mqVo = mypageMapper.member_quit(id);
		
		return mqVo;
	}
	

}
