package com.kodup.notification;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository
@Mapper
public interface NotificationBoardMapper {
	public NotificationBoardVo view(int sno);
	public List<NotificationHashVo> hashList(int sno);
	public List<NotificationBoardReplVo> replList(int sno);
	public void thumbup(int sno);
	public void thumbdown(int sno);
	public int replCheck(NotificationBoardVo nbVo);
	public int notificationDeleteR(NotificationBoardVo nbVo);
	public int notificationReplDeleteR(int repl_sno);
	public int giveRewardPixel(NotificationBoardVo nbVo);
	public int insertRepl(NotificationBoardReplVo nbrVo);
	public int insertInnerRepl(NotificationBoardReplVo nbrVo);
	public int ReplUpdateR(NotificationBoardReplVo nbrVo);
}
