package com.kodup.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class QnaBoardService {
	@Autowired
	PlatformTransactionManager manager;
	TransactionStatus status;
	
	@Autowired
	QnaBoardMapper mapper;
	public QnaBoardVo view(int sno) {
		QnaBoardVo qbVo=null;
		qbVo = mapper.view(sno);
		
		List<QnaHashVo> hashList = mapper.hashList(sno);
		qbVo.setHashtaglist(hashList);
		
		return qbVo;
	}
}








