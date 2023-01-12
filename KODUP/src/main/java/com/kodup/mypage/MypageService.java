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
	
	/* 이한나
	public boolean mypage_memberinfo_update_complete(MypageVo mpVo, String[] delFile) {
		System.out.println("service.update");
		System.out.println(mpVo.getId());

		boolean b = true;

		status = manager.getTransaction(new DefaultTransactionDefinition());
		savePoint = status.createSavepoint();
		int cnt = mypageMapper.update(mpVo); // 내용 업데이트
		if (cnt < 1) {
			b = false;
		} else if (mpVo.getAttFile().size() > 0) {
			int attCnt = mypageMapper.attUpdate(mpVo); // 첨부파일 추가
			if (attCnt < 1)
				b = false;
		}

		if (b) {
			manager.commit(status);
			if (delFile != null && delFile.length > 0) {
				// 첨부 파일 데이터 삭제
				cnt = mypageMapper.attDelete(delFile);
				if (cnt > 0) {
					fileDelete(delFile); // 파일 삭제
				} else {
					b = false;
				}
			}
		} else {
			status.rollbackToSavepoint(savePoint);
			delFile = new String[bVo.getAttList().size()];
			for (int i = 0; i < bVo.getAttList().size(); i++) {
				delFile[i] = bVo.getAttList().get(i).getSysFile();
			}
			fileDelete(delFile);
		}

		return b;
	}
	이한나 */
	
	/* 파일 업로드....수정..
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
