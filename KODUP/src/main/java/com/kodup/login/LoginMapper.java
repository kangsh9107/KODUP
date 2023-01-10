package com.kodup.login;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface LoginMapper {

	public int login(MemberVo mVo);
	public int checkId(String id);
	public int checkGrade(String id);
	
}
