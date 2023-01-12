package com.kodup.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;


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
	
	
	public boolean mypage_memberinfo_update_complete(MypageVo mpVo) {
		boolean b=true;

		status = manager.getTransaction(new DefaultTransactionDefinition());
		this.savePoint = status.createSavepoint();
		
        int cnt = mypageMapper.mypage_memberinfo_update_complete(mpVo);
        if (cnt > 0) {
			manager.commit(status);

		} else { b=false;
			status.rollbackToSavepoint(savePoint);
		}
        return b;
      }

	
	public MypageVo info(String id) {
		mpVo = new MypageVo();
		mpVo = mypageMapper.info(id);
		
		
		return mpVo;
	}
	
	
	
	
	/*
	public boolean mypage_memberinfo_update_complete(MypageVo mpVo) {
		boolean b=true;

		status = manager.getTransaction(new DefaultTransactionDefinition());
		this.savePoint = status.createSavepoint();
		
        int cnt = mypageMapper.mypage_memberinfo_update_complete(mpVo);
        if (attCnt < 1) {
        	b= false;
         }else if(mpVo.getProfile_img().size()>0) {
        	 int attCnt = mypageMapper.attUpdate(mpVo);
        	 if (attCnt <1)
        		 b= false;
         }
			manager.commit(status);

		} else if (mpVo. getAttList().size()>0){ b=false;
			status.rollbackToSavepoint(savePoint);
		}
        return b;
      }
	*/
	
	public MypageQuitVo member_quit(String id) {
		mqVo = new MypageQuitVo();
		mqVo = mypageMapper.member_quit(id);
		
		return mqVo;
	}
	

}
