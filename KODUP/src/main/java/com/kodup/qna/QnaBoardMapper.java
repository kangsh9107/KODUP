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
	public int qnaReplDeleteR(int sno);
}