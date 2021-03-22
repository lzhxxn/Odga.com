package odga.bt.service;

import odga.bt.domain.Touritems;

import java.util.List;

import odga.bt.domain.ListResult;
import odga.bt.domain.Member;
import odga.bt.vo.TouritemsVo;

public interface TouritemsService {
	ListResult getTouritemsListResult(int cp, int ps, int rangeSize);
	ListResult getTouritemsListResult(String catgo, String keyword, int cp, int ps, int rangeSize);  //keyword 異붽�濡� 諛쏆쑝硫� where 議곌굔�젅�씠 �깮湲대떎.  �꽌鍮꾩뒪�옉 Mapper�옉 媛숈쓣 �븘�슂媛��뾾�떎. �씠由꾩씠
	ListResult getTouritemsListResult();
	
	Touritems selectByTitleS(String contentid);
	

	

}

