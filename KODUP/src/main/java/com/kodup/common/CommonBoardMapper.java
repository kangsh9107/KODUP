package com.kodup.common;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CommonBoardMapper {

	public List<CommonBoardPageVo> totList(CommonBoardPageVo cbpVo);
	public List<SelectBoardVo> listQna(CommonBoardPageVo cbpVo);
	public List<CommonBoardPageVo> totListHashtag(CommonBoardPageVo cbpVo);
	public List<SelectBoardVo> listHashtag(CommonBoardPageVo cbpVo);
	
	public int insertBoard(InsertBoardVo ibVo);
	public int getSno();
	public int insertQnaBoard(InsertBoardVo ibVo);
	
}
