package com.kodup.mypage;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

//인터페이스
@Repository
@Mapper
public interface MypageMapper {
	public MypageVo info(String id);
	public MypageVo info_update_complete(String id);
	public MypageQuitVo member_quit(String id);
}
