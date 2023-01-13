package com.kodup.mypage;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

//인터페이스
@Repository
@Mapper
public interface MypageMapper {
	public MypageVo info(String id); //select
	public int mypage_memberinfo_update_complete(MypageVo mpVo);
	public MypageQuitVo member_quit(String id);
	
	public int update(MypageVo mpVo);
	public int attUpdate(MypageVo mpVo);
	public int attDelete(String[] delFiles);
}
