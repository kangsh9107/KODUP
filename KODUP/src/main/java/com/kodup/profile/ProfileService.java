package com.kodup.profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;

import com.kodup.mantoman.MantomanMapper;
import com.kodup.mantoman.MantomanVo;

@Transactional
@Service
public class ProfileService {
	
	@Autowired
	ProfileMapper mapper;
	
	@Autowired
	PlatformTransactionManager manager;
	
	TransactionStatus status;
	Object savePoint;
	
	public ProfileVo selectProfile(String sessionId) {
		ProfileVo pfVo = mapper.selectProfile(sessionId);
		return pfVo;
	}

}
