package com.kodup.profile;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ProfileMapper {
	ProfileVo selectProfile(String nickname);
	List<ProfileVo> selectMyArticle(String id);
	List<ProfileVo> selectMyrepl(String id);
	int selectMansearchSno(int sno);
}
