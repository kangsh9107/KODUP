package com.kodup.mypage;

import java.io.File;

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
	MypagePixelVo mPixelVo;
	MypageQuitVo mqVo;
	Object savePoint;
	
	
	public MypageVo info(String id) {
		mpVo = new MypageVo();
		mpVo = mypageMapper.info(id);
		
		
		return mpVo;
	}
	

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


	
	public boolean updateR(MypageVo mpVo, String[] delFile) {
//		System.out.println("service.update");
//		System.out.println(mpVo.getId());

		boolean b = true;

		status = manager.getTransaction(new DefaultTransactionDefinition());
		savePoint = status.createSavepoint(); //롤백을위해
		int cnt = mypageMapper.updateR(mpVo); // 내용 업데이트
		if (cnt < 1) b = false;
		
		if (b) {
			manager.commit(status);
			fileDelete(delFile); // 파일 삭제
			/*
			if (delFile != null && delFile.length > 0) {
				// 첨부 파일 데이터 삭제
				cnt = mypageMapper.attDelete(delFile);
				if (cnt > 0) {
					
				} else {
					b = false;
				}
			}
			*/
		} else {
			status.rollbackToSavepoint(savePoint);
			delFile = new String[1];
			delFile[0] = mpVo.getProfile_img();
			fileDelete(delFile);
		}

		return b;
	}
	
	
	public boolean update(MypageVo mpVo) {
		boolean b = true;

		status = manager.getTransaction(new DefaultTransactionDefinition());
		savePoint = status.createSavepoint(); //롤백을위해
		int cnt = mypageMapper.update(mpVo); // 내용 업데이트
		if (cnt < 1) b = false;
		return b;
	}
	
	
	public void fileDelete(String[] delFile) {
		/*
		for(int i=0; i<delFile.length; i++) {
			f = delFile[i];
		}
		*/
		if( !delFile[0].equals("default.png") ) {
			for (String f : delFile) {
				File file = new File(MypageController.path + f);
				if (file.exists())
					file.delete();
			}
		}
	}
	
	
	public boolean mypage_memberinfo_quit_real(MypageVo mpVo) {
		System.out.println("서비스까지 값이 전달됨. 삭제될 아이디" + mpVo.id);
		boolean b = true;
		
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		int cnt = mypageMapper.mypage_memberinfo_quit_real(mpVo);
		
		System.out.println("회원탈퇴 :" + cnt);
		
		if( cnt < 1) b= false;
		
		if(b)
			manager.commit(status);
		else
			status.rollbackToSavepoint(savePoint);
		
		return b;
	}
	
	
	//픽셀 조회
	public MypagePixelVo pixel(String id) {
		
		mPixelVo = new MypagePixelVo();
		mPixelVo = mypageMapper.pixel(id);
		
		return mPixelVo;
	}
	
}
