package com.kodup.mantoman;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Repository
@Mapper
public interface MantomanMapper {
	public MantomanVo selectId(String sessionId);
	public List<MantomanVo> selectMentoList();
	public int insertMantoman(MantomanVo mtmVo);
	public int insertMantoman2(MantomanVo mtmVo);
	public int updateChatStatus(String sessionId);
	public int updateTalk(MantomanVo mtmVo);
	public List<MantomanVo> selectChatList(String id);
	public int updateFile(MantomanAttVo mtmAttVo);
	public int chatPixelReward(MantomanVo mtmVo);
	public int chatPixelLog(MantomanVo mtmVo);
	public int chatPixelReward2(MantomanVo mtmVo);
	public int chatPixelLog2(MantomanVo mtmVo);
	public int updateChatStatus2(String id);
}
