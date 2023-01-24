package com.kodup.common;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CommonBoardMapper {

	public List<CommonBoardPageVo> totList(CommonBoardPageVo cbpVo);
	public List<CommonBoardPageVo> totListInfoshare(CommonBoardPageVo cbpVo);
	public List<CommonBoardPageVo> totListFreetalking(CommonBoardPageVo cbpVo);
	public List<CommonBoardPageVo> totListJobsearch(CommonBoardPageVo cbpVo);
	public List<CommonBoardPageVo> totListNotification(CommonBoardPageVo cbpVo);
	public List<SelectBoardVo> listQna(CommonBoardPageVo cbpVo);
	public List<SelectBoardVo> listInfoshare(CommonBoardPageVo cbpVo);
	public List<SelectBoardVo> listFreetalking(CommonBoardPageVo cbpVo);
	public List<SelectBoardVo> listJobsearch(CommonBoardPageVo cbpVo);
	public List<SelectBoardVo> listNotification(CommonBoardPageVo cbpVo);
	public List<CommonBoardPageVo> totListHashtag(CommonBoardPageVo cbpVo);
	public List<SelectBoardVo> listHashtag(CommonBoardPageVo cbpVo);
	public List<SelectBoardVo> listView(CommonBoardPageVo cbpVo);
	
	public int insertBoard(InsertBoardVo ibVo);
	public int getSno();
	public int insertQnaBoard(InsertBoardVo ibVo);
	public int insertView(CommonBoardPageVo cbpVo);
	public int checkView(CommonBoardPageVo cbpVo);
	public int checkPixel(InsertBoardVo ibVo);
	public int updatePixel(InsertBoardVo ibVo);
	public int insertHistory(InsertBoardVo ibVo);
	
	public int updateBoard(InsertBoardVo ibVo);
	public int updateQnaBoard(InsertBoardVo ibVo);
	public void viewcountUp(int sno);
	public int getViewcount(int sno);
	
}
