package com.kodup.mansearch;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kodup.board.PageVo;
import com.kodup.login.MemberVo;
import com.kodup.pixel.PixelHistoryVo;

@Repository
@Mapper
public interface MansearchMapper {
	public int totList(PageVo pVo);
	public List<MansearchBoardVo> select(PageVo pVo);
	public MansearchBoardVo review(int premium_review_sno);
	public List<MansearchBoardVo> premiumlist(int sno);
	public List<MansearchBoardVo> buylist(MemberVo mVo);	
	public MansearchBoardVo view(int sno);
	public int buylistinsert(MansearchBoardVo mbVo);
	public int boardinsert(MansearchBoardVo mbVo);
	public int mansearchinsert(MansearchBoardVo mbVo);
	public int boardupdate(MansearchBoardVo mbVo);
	public int mansearchupdate(MansearchBoardVo mbVo);	
	public int delete(MansearchBoardVo mbVo);	
	public int corp_status(MansearchBoardVo mbVo);
	public int readpixel(String buyer_id);
	public int writepixel(MansearchBoardVo mbVo);
	public int readlog(String buyer_id);
	public int writelog(MansearchBoardVo mbVo);
	public int reviewinsert(MansearchBoardVo mbVo);	
	public String certification(MansearchBoardVo mbVo);

}
