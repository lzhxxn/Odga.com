package odga.bt.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import lombok.AllArgsConstructor;
import odga.bt.domain.Touritems;
import odga.bt.domain.ListResult;
import odga.bt.vo.TouritemsVo;
import odga.bt.mapper.TouritemsMapper;

@Service
@AllArgsConstructor
public class TouritemsServiceImpl implements TouritemsService {
	@Resource
	private TouritemsMapper touritemsMapper;
	
	@Override
	public ListResult getTouritemsListResult(int cp, int ps, int rangeSize) {
		long totalCount = touritemsMapper.selectCount();
		TouritemsVo touritemsVo = new TouritemsVo(null, null, cp, ps);
		List<Touritems> list = touritemsMapper.selectPerPage(touritemsVo);
		return new ListResult(cp, totalCount, ps, list, rangeSize);
	}
	@Override
	public ListResult getTouritemsListResult(String catgo, String keyword, int cp, int ps, int rangeSize) {
		TouritemsVo touritemsVo = new TouritemsVo(catgo, keyword, cp, ps);
		long totalCount = touritemsMapper.selectCountByCatgo(touritemsVo);
		List<Touritems> list = touritemsMapper.selectByCatgo(touritemsVo);
		return new ListResult(cp, totalCount, ps, list, rangeSize);
	}
	@Override
	public ListResult getTouritemsListResult() {
		TouritemsVo touritemsVo = new TouritemsVo();
		List<Touritems> list = touritemsMapper.selectHotspot(touritemsVo);
		return new ListResult(-1, -1, -1, list, -1);
	}
	@Override
	public Touritems selectByTitleS(String contentid) {
		return touritemsMapper.selectByTitle(contentid);
	}

}
