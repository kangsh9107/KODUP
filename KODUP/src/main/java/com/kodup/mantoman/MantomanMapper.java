package com.kodup.mantoman;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MantomanMapper {
	public MantomanVo selectId(String sessionId);
}
