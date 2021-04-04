package odga.bt.service;

import java.util.List;

import odga.bt.domain.Planner;
import odga.bt.domain.S_Planner;
import odga.bt.domain.Touritems;
import odga.bt.vo.SearchResult;
import odga.bt.vo.Searchcode;
import odga.bt.vo.TotalList;

public interface PlannerService {	
	List<Touritems> selectDayById(long p_id, long sp_day);
	void dayDelAll(long p_id, long sp_day);
	SearchResult searchedList(Searchcode searchcode);
	void insert_sp(S_Planner s_planner);
	void delete_sp(long sp_id);
	TotalList listS(long m_id);
	List<Touritems> selectResultS(Searchcode searchcode);
	void newPlannerS(long m_id);
	void save(Planner planner);
	void delPlan(long p_id);
	Touritems getItemS(String contentid);
}
