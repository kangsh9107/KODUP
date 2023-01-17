package com.kodup.infoshare;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface InfoshareBoardMapper {
	
	public InfoshareBoardVo view(int sno);
	public List<InfoshareHashVo> hashList(int sno);
	public List<InfoshareBoardReplVo> replList(int sno);
	public void thumbup(int sno);
	public void thumbdown(int sno);
	public int replCheck(InfoshareBoardVo ibVo);
	public int infoshareDeleteR(InfoshareBoardVo ibVo);
	public int infoshareReplDeleteR(int repl_sno);
	public int giveRewardPixel(InfoshareBoardVo ibVo);
	public int insertRepl(InfoshareBoardReplVo ibrVo);
	public int insertInnerRepl(InfoshareBoardReplVo ibrVo);
	public int ReplUpdateR(InfoshareBoardReplVo ibrVo);
}
