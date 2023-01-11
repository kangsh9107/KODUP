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
}
