package odga.bt.mapper;

import java.util.ArrayList;
import odga.bt.domain.Area_T;
import odga.bt.domain.Sigungu_T;

public interface Area_T_Mapper {
	ArrayList<Area_T> list(); //지역리스트
	ArrayList<Sigungu_T> list_s(); //시군구 리스트
}
