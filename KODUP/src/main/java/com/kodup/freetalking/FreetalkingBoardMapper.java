package com.kodup.freetalking;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface FreetalkingBoardMapper {
	public FreetalkingBoardVo view(int sno);
	public List<FreetalkingHashVo> hashList(int sno);
	public List<FreetalkingBoardReplVo> replList(int sno);
	public void thumbup(int sno);
	public void thumbdown(int sno);
	public int replCheck(FreetalkingBoardVo fbVo);
	public int freetalkingDeleteR(FreetalkingBoardVo fbVo);
	public int freetalkingReplDeleteR(int repl_sno);
	public int giveRewardPixel(FreetalkingBoardVo fbVo);
	public int insertRepl(FreetalkingBoardReplVo fbrVo);
	public int insertRepl2(FreetalkingBoardReplVo fbrVo);
	public int insertRepl3(int repl_sno);
	public int insertInnerRepl(FreetalkingBoardReplVo fbrVo);
	public int insertInnerRepl2(FreetalkingBoardReplVo fbrVo);
	public int insertInnerRepl3(int repl_sno);
	public int ReplUpdateR(FreetalkingBoardReplVo fbrVo);
}
