package com.kodup.mypage;

import java.io.File;
import java.util.List;

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
   MypagePixelVo mppv;
   Object savePoint;
   PageVo pVo;
   
   
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
   
   
      
      
      /*
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
         
      } else {
         status.rollbackToSavepoint(savePoint);
         delFile = new String[1];
         delFile[0] = mpVo.getProfile_img();
         fileDelete(delFile);
      }
       */
   
   /*
   public void certi_fileDelete(String[] delFile) {
      
      File file = new File(MypageController.path + f);
      if (file.exists())
         file.delete();
      }
   */
   
   
   
   
   public boolean update(MypageVo mpVo) {
      boolean b = true;

      status = manager.getTransaction(new DefaultTransactionDefinition());
      savePoint = status.createSavepoint(); //롤백을위해
      int cnt = mypageMapper.update(mpVo); // 내용 업데이트
      if (cnt < 1) b = false;
      return b;
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
   
   
   //픽셀, 픽셀이력 조회
   public List<MypagePixelVo> pixel(PageVo pVo) {
      int totSize = mypageMapper.totList(pVo);
      pVo.setTotSize(totSize);
      this.pVo = pVo;

      //mppv = new MypagePixelVo();
      List<MypagePixelVo> list = mypageMapper.pixel(pVo);
      
      return list;
   }


   
   public int pixel_have (String id) {

      int pixel_have = mypageMapper.pixel_have(id);
      
      return pixel_have;
   }

   
   
   
   public PageVo getpVo() {
      return pVo;
   }
   
   
   public List<MypagePixelVo> pixel_get(PageVo pVo){
      int totSize = mypageMapper.totListGet(pVo);
      pVo.setTotSize(totSize);
      this.pVo = pVo;
      
      mppv = new MypagePixelVo();
      List<MypagePixelVo> list = mypageMapper.pixel_get(pVo);
      
      return list;
   }
   
   
   public List<MypagePixelVo> pixel_use(PageVo pVo){
      int totSize = mypageMapper.totListUse(pVo);
      pVo.setTotSize(totSize);
      this.pVo = pVo;
      
      mppv = new MypagePixelVo();
      List<MypagePixelVo> list = mypageMapper.pixel_use(pVo);
      
      return list;
   }
   
   
   
   //픽셀 환전신청 버튼 클릭 시
   public boolean mypage_pixel_exchange(MypagePixelVo mppv) {
      boolean b = true;
      int cnt = 0;
      System.out.println(mppv.getId());
      cnt = mypageMapper.mypage_pixel_exchange_result(mppv);
      
      if(cnt > 0) {
         int cnt2 = 0;
         cnt2 = mypageMapper.mypage_pixel_exchange_history(mppv);
         
         if(cnt2 > 0) {
            int cnt3 = 0;
            cnt3 = mypageMapper.mypage_pixel_exchange_status(mppv);
            
            if (cnt3 < 1) {
               b = false;
            }
            
         } else {
            b = false;
         }
         
      } else {
         b = false;
      }
      
      return b;
   }
   
   
//인증페이지
   
   //멘토인증
   public boolean mypage_mentor_certification(MypageCertiVo mpcv) {

      boolean b = true;
      int cnt=0;
      
      status = manager.getTransaction(new DefaultTransactionDefinition());
      savePoint = status.createSavepoint(); //롤백을위해
      cnt = mypageMapper.mypage_mentor_certification_step1(mpcv); // 내용 업데이트
      
      if (cnt > 0) {
         int cnt2 =0;
         cnt2 = mypageMapper.mypage_mentor_certification_step2(mpcv);
         
         if (cnt2 > 0) {
            int cnt3 =0;
            cnt3 = mypageMapper.mypage_mentor_certification_step3(mpcv);
            
         } else {
            b = false;
         }
      } else { 
         b = false;
      }
      
         
      if (b) {
         manager.commit(status);
         
      } else {
         status.rollbackToSavepoint(savePoint);
      }

      return b;
   }
   
   
   /*
    public boolean mypage_mentor_certification(MypageCertiVo mpcv) {

      boolean b = true;
      int cnt=0;
      
      status = manager.getTransaction(new DefaultTransactionDefinition());
      savePoint = status.createSavepoint(); //롤백을위해
      cnt = mypageMapper.mypage_mentor_certification_step1(mpcv); // 내용 업데이트
      
      if (cnt > 0) {
         int cnt2 =0;
         cnt2 = mypageMapper.mypage_mentor_certification_step2(mpcv);
         
         if (cnt2 < 1) {
            b = false;
         }
         
      } else { 
         b = false;
      }
      
         
      if (b) {
         manager.commit(status);
         
      } else {
         status.rollbackToSavepoint(savePoint);
      }

      return b;
   }
    */
   
   
   
   //기업인증 1.기업 인증 여부 확인
   public int select_corp_status(String sessionId) {
      int a = 0;
      a = mypageMapper.select_corp_status(sessionId);
      
      return a;
   }
   
   //기업인증 2-1. 기업인증 status가 0일 때 실행되는 insert 쿼리
   public boolean insert_corp(MypageCertiVo mpcv) {
      boolean b = true;
      
      status = manager.getTransaction(new DefaultTransactionDefinition());
      savePoint = status.createSavepoint(); //롤백을위해
      
      int cnt = mypageMapper.insert_corp(mpcv); // 내용 업데이트
      if (cnt < 1) b = false;
      else {
         cnt = mypageMapper.change_corp_status(mpcv);
         if(cnt < 1) b = false;
         
         if(b) manager.commit(status);
         else status.rollbackToSavepoint(savePoint);
      }
      
      return b;
   }
      
         
   //기업인증 2-2. insert 쿼리 정상 입력 시 실행되는 update 쿼리 (기업인증 status 변경)
   //기업인증 2-3. status가 1이거나 2일 때 실행되는 update쿼리
   /*public boolean update_corp(MypageCertiVo mpcv) {
      boolean b = true;
      
      status = manager.getTransaction(new DefaultTransactionDefinition());
      savePoint = status.createSavepoint(); //롤백을위해
      
      int cnt = mypageMapper.update_corp(mpcv); // 내용 업데이트
      if (cnt < 1)b = false;
      
      if(b) manager.commit(status);
      else status.rollbackToSavepoint(savePoint);
      
      
      return b;
   }*/
         
   
   
   /*public int update_corp(MypageCertiVo mpcv) {
      int a = 0;
      a = mypageMapper.update_corp(mpcv);
      
      System.out.println(a);
      
      return a;
   }
   */
}