package odga.bt.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import odga.bt.domain.Area_T;
import odga.bt.domain.Planner;
import odga.bt.domain.S_Planner;
import odga.bt.domain.Sigungu_T;
import odga.bt.domain.Touritems;
import odga.bt.vo.Searchcode;

@Mapper
public interface PlannerMapper {
	List<Touritems> selectDayById(@Param("p_id")long p_id,@Param("sp_day")long sp_day); //세부츨랜리스트
	void dayDelAll(@Param("p_id")long p_id,@Param("sp_day") long sp_day); //세부플랜 전체 삭제
	List<Touritems> searchedList(Searchcode searchcode); //관광지 검색 리스트
	int countContent(Searchcode searchcode); //검색된 결과 수
	void insert_sp(S_Planner s_planner); //세부플랜 추가
	void delete_sp(long sp_id); //세부플래 삭제
	ArrayList<Area_T> list(); //지역리스트
	ArrayList<Sigungu_T> list_s(); //시군구리스트
	ArrayList<Touritems> selectResult(Searchcode searchcode); //필터링
	void newPlanner(long m_id); //플래너 생성
	void save(Planner planner); //플래너 저장
	long thisP_id(long m_id); //생성된 플랜 id
	void delete_sPlan(long p_id); //플래너 작성 취소시 세부플랜삭제
	void delete_Plan(long p_id); //플래너 작성 취소시 플랜삭제
	Touritems getItem(String contentid); //투어아이템 가져오기
}

