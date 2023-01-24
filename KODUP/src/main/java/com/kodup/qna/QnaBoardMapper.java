package com.kodup.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface QnaBoardMapper {
	public QnaBoardVo view(int sno);
	public List<QnaHashVo> hashList(int sno);
	public List<QnaBoardReplVo> replList(int sno);
	public void thumbup(int sno);
	public void thumbdown(int sno);
	public int replCheck(QnaBoardVo qbVo);
	public int qnaDeleteR(QnaBoardVo qbVo);
	public int qnaReplDeleteR(int repl_sno);
	public int replChaetaek(QnaBoardReplVo qbrVo);
	public int giveRewardPixel(QnaBoardVo qbVo);
	public int pixel_history(QnaBoardVo qbVo);
	public int insertRepl(QnaBoardReplVo qbrVo);
	public int insertRepl2(QnaBoardReplVo qbrVo);
	public int insertRepl3(int repl_sno);
	public int insertInnerRepl(QnaBoardReplVo qbrVo);
	public int insertInnerRepl2(QnaBoardReplVo qbrVo);
	public int insertInnerRepl3(QnaBoardReplVo qbrVo);
	public int checkChaeTaek(int sno);
	public int ReplUpdateR(QnaBoardReplVo qbrVo);

}