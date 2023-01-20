package com.kodup.mansearch;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kodup.board.PageVo;
import com.kodup.login.MemberVo;

@Repository
@Mapper
public interface MansearchMapper {
	public int totList(PageVo pVo);
	public List<MansearchBoardVo> select(PageVo pVo);
	public List<MansearchBoardVo> review(int sno);
	public List<MansearchBoardVo> premiumlist(int sno);
	public List<MansearchBoardVo> buylist(MemberVo mVo);	
	public MansearchBoardVo view(int sno);
	public int boardinsert(MansearchBoardVo mbVo);
	public int mansearchinsert(MansearchBoardVo mbVo);
	public int boardupdate(MansearchBoardVo mbVo);
	public int mansearchupdate(MansearchBoardVo mbVo);	
	public int delete(MansearchBoardVo mbVo);	
	public int corp_status(MansearchBoardVo mbVo);
}
