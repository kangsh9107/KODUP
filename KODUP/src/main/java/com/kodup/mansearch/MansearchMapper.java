package com.kodup.mansearch;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kodup.board.PageVo;

@Repository
@Mapper
public interface MansearchMapper {
	public List<MansearchBoardVo> select(PageVo pVo);
	public MansearchBoardVo view(int sno);
	public int boardinsert(MansearchBoardVo mbVo);
	public int mansearchinsert(MansearchBoardVo mbVo);
	public int delete(MansearchBoardVo mbVo);	
}
