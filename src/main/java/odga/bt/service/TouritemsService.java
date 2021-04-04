package odga.bt.service;

import odga.bt.domain.Touritems;
import odga.bt.domain.ListResult;

public interface TouritemsService {
	ListResult getTouritemsListResult(int cp, int ps, int rangeSize);
	ListResult getTouritemsListResult(String catgo, String keyword, int cp, int ps, int rangeSize);
	ListResult getTouritemsListResult();
	Touritems selectByTitleS(String contentid);
}

