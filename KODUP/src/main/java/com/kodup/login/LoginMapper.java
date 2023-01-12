package com.kodup.login;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface LoginMapper {

	public int login(MemberVo mVo);
	public int checkId(String id);
	public int checkGrade(String id);
	public int chatInsert(String mento);
	public int checkChatId(String mento);
	public int chatDelete(String id);
	
	public List<MemberVo> topWriter();
	public List<CommonBoardVo> hotTag();
	public List<IndexBoardVo> qna5();
	public List<IndexBoardVo> freetalking5();
	public List<IndexBoardVo> infoshare5();
	public List<IndexBoardVo> notification5();
	public List<IndexBoardVo> weeklyBest5();
	
	public int checkNickname(String nickname);
	public int insertMemberKakao(MemberVo mVo);
	public int insertMember(MemberVo mVo);
}
