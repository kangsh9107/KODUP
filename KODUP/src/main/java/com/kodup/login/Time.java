package com.kodup.login;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Time {
	
	private static class TIME_MAXIMUM {
		public static final int SEC = 60;
		public static final int MIN = 60;
		public static final int HOUR = 24;
		public static final int DAY = 30;
		public static final int MONTH = 12;
	}
	
	public static String calculateTime(Date nal) {
		long curTime = System.currentTimeMillis();
		long regTime = nal.getTime() - 32400000; //9시간 계산 오류 수정
		long diffTime = (curTime - regTime) / 1000;
		String msg = null;
		if     ( diffTime <  TIME_MAXIMUM.SEC)                        msg = diffTime + "초 전";
		else if((diffTime /= TIME_MAXIMUM.SEC)  < TIME_MAXIMUM.MIN)   msg = diffTime + "분 전";
		else if((diffTime /= TIME_MAXIMUM.MIN)  < TIME_MAXIMUM.HOUR)  msg = diffTime + "시간 전";
		else if((diffTime /= TIME_MAXIMUM.HOUR) < TIME_MAXIMUM.DAY)   msg = diffTime + "일 전";
		else if((diffTime /= TIME_MAXIMUM.DAY)  < TIME_MAXIMUM.MONTH) msg = diffTime + "개월 전";
		else {
			SimpleDateFormat sdf = new SimpleDateFormat( "yyyy");
			String curYear = sdf.format(curTime);
			String passYear = sdf.format(nal);
			int diffYear = Integer.parseInt(curYear) - Integer.parseInt(passYear);
			msg = diffYear + "년 전";
		}
		return msg;
	}
	
}
