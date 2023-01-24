package com.kodup.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


//인터페이스
@Repository
@Mapper
public interface MypageMapper {
	public MypageVo info(String id); 
	public int mypage_memberinfo_update_complete(MypageVo mpVo);
	public int mypage_memberinfo_quit_real(MypageVo mpVo);
	
	
	public int pixel_exchange(String id);
	public List<MypagePixelVo> pixel(PageVo pVo);
	public int pixel_have(String id);
	public List<MypagePixelVo> pixel_get(PageVo pVo);
	public List<MypagePixelVo> pixel_use(PageVo pVo);
	public int totList(PageVo pVo);
	public List<MypagePixelVo> select(PageVo pVo);
	
	public int mypage_pixel_exchange_result(MypagePixelVo mppv);
	public int mypage_pixel_exchange_history(MypagePixelVo mppv);
	public int mypage_pixel_exchange_status(MypagePixelVo mppv);
	
	public int mypage_mentor_certification_step1(MypageCertiVo mpcv);
	public int mypage_mentor_certification_step2(MypageCertiVo mpcv);
	
	public int update(MypageVo mpVo);
	public int updateR(MypageVo mpVo);
	public int attUpdate(MypageVo mpVo);
	public int attDelete(String[] delFiles);
}
