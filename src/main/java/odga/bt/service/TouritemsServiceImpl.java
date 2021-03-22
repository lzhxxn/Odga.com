package odga.bt.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import odga.bt.domain.Touritems;
import odga.bt.domain.ListResult;
import odga.bt.vo.TouritemsVo;
import odga.bt.mapper.TouritemsMapper;

@Service
@AllArgsConstructor
@Log4j

public class TouritemsServiceImpl implements TouritemsService {
	@Resource
	private TouritemsMapper touritemsMapper;
	
	//由ъ뒪�똿
	@Override
	public ListResult getTouritemsListResult(int cp, int ps, int rangeSize) {
		long totalCount = touritemsMapper.selectCount();
		TouritemsVo touritemsVo = new TouritemsVo(null, null, cp, ps);
		List<Touritems> list = touritemsMapper.selectPerPage(touritemsVo);
		
		return new ListResult(cp, totalCount, ps, list, rangeSize);
	}
	
	//寃��깋
	@Override
	public ListResult getTouritemsListResult(String catgo, String keyword, int cp, int ps, int rangeSize) {
		TouritemsVo touritemsVo = new TouritemsVo(catgo, keyword, cp, ps);
		long totalCount = touritemsMapper.selectCountByCatgo(touritemsVo);
		List<Touritems> list = touritemsMapper.selectByCatgo(touritemsVo);
		
		return new ListResult(cp, totalCount, ps, list, rangeSize);
	}
	
	
	//由ъ뒪�똿 �뵒�뀒�씪 異붿쿇�옣�냼
	@Override
	public ListResult getTouritemsListResult() {
		TouritemsVo touritemsVo = new TouritemsVo();
		List<Touritems> list = touritemsMapper.selectHotspot(touritemsVo);
		
		return new ListResult(-1, -1, -1, list, -1);
	}
	
	//�긽�꽭�럹�씠吏�
	@Override
	public Touritems selectByTitleS(String contentid) {
		return touritemsMapper.selectByTitle(contentid);
	}

}
