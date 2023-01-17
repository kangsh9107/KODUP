package com.kodup.jobsearch;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository
@Mapper
public interface JobsearchBoardMapper {
	public JobsearchBoardVo view(int sno);
	public List<JobsearchHashVo> hashList(int sno);
	public List<JobsearchBoardReplVo> replList(int sno);
	public void thumbup(int sno);
	public void thumbdown(int sno);
	public int replCheck(JobsearchBoardVo jbVo);
	public int jobsearchDeleteR(JobsearchBoardVo jbVo);
	public int jobsearchReplDeleteR(int repl_sno);
	public int giveRewardPixel(JobsearchBoardVo jbVo);
	public int insertRepl(JobsearchBoardReplVo jbrVo);
	public int insertInnerRepl(JobsearchBoardReplVo jbrVo);
	public int ReplUpdateR(JobsearchBoardReplVo jbrVo);
}
