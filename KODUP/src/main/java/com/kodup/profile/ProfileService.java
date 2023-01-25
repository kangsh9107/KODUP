package com.kodup.profile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class ProfileService {
	
	@Autowired
	ProfileMapper mapper;
	
	@Autowired
	PlatformTransactionManager manager;
	
	TransactionStatus status;
	Object savePoint;
	
	public ProfileVo selectProfile(String nickname) {
		ProfileVo pfVo = mapper.selectProfile(nickname);
		return pfVo;
	}

	public List<ProfileVo> selectMyArticle(String id) {
		List<ProfileVo> list = mapper.selectMyArticle(id);
		return list;
	}

	public List<ProfileVo> selectMyrepl(String id) {
		List<ProfileVo> list = mapper.selectMyrepl(id);
		return list;
	}

}
