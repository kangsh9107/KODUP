package com.kodup.profile;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ProfileMapper {

	ProfileVo selectProfile(String sessionId);

}
