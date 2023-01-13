package com.kodup.mantoman;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class MantomanService {
	
	@Autowired
	MantomanMapper mapper;
	
	public MantomanVo selectId(String sessionId) {
		MantomanVo mtmVo = mapper.selectId(sessionId);
		return mtmVo;
	}
	
	public List<MantomanVo> selectMentoList() {
		List<MantomanVo> list = mapper.selectMentoList();
		return list;
	}
}
