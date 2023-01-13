package com.kodup.mantoman;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MantomanMapper {
	public MantomanVo selectId(String sessionId);
	public List<MantomanVo> selectMentoList();
}
