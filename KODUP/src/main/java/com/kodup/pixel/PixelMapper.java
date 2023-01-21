package com.kodup.pixel;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kodup.login.MemberVo;

@Repository
@Mapper
public interface PixelMapper {
	public List<PixelPriceVo> select();
	public int addlist(PixelBuyVo buyVo);
	public int addpixel(MemberVo mVo);
	public int buylog(PixelHistoryVo hVo);
}