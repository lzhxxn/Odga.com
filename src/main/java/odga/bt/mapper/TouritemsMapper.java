package odga.bt.mapper;

import java.util.List;

import odga.bt.domain.Touritems;
import odga.bt.vo.TouritemsVo;

public interface TouritemsMapper {
	List<Touritems> selectPerPage(TouritemsVo touritemsVo); //페이징
	List<Touritems> selectByCatgo(TouritemsVo touritemsVo); //검색
	List<Touritems> selectHotspot(TouritemsVo touritemsVo); //근처장소추천
	long selectCount();
	long selectCountByCatgo(TouritemsVo touritemsVo);  
	Touritems selectByTitle(String contentid); //타이틀로 검색
}
