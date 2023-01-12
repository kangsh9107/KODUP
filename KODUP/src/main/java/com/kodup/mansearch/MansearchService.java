package com.kodup.mansearch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;

import com.kodup.board.BoardVo;
import com.kodup.board.PageVo;

@Service
@Transactional
public class MansearchService {
	BoardVo bVo;
	
	@Autowired
	MansearchMapper mapper;
	Object savePoint;
	
	@Autowired
	PlatformTransactionManager manager;
	TransactionStatus status;
	

	public List<MansearchBoardVo> select(PageVo pVo){
		List<MansearchBoardVo> list = mapper.select(pVo);
		return list;
	}
	
	public MansearchBoardVo view(int sno) {
		MansearchBoardVo mbVo = null;
		mbVo = mapper.view(sno);
		return mbVo;
	}

}
