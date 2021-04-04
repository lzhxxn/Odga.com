package odga.bt.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import lombok.AllArgsConstructor;
import odga.bt.domain.Area_T;
import odga.bt.domain.Planner;
import odga.bt.domain.S_Planner;
import odga.bt.domain.Sigungu_T;
import odga.bt.domain.Touritems;
import odga.bt.mapper.PlannerMapper;
import odga.bt.vo.SearchResult;
import odga.bt.vo.Searchcode;
import odga.bt.vo.TotalList;

@Service
@AllArgsConstructor
public class PlannerServiceImpl implements PlannerService {
    private PlannerMapper plannerMapper;
    
	@Override
	public List<Touritems> selectDayById(long p_id, long sp_day) {
		return plannerMapper.selectDayById(p_id,sp_day);
	}
	@Override
	public void dayDelAll(long p_id, long sp_day) {
		plannerMapper.dayDelAll(p_id, sp_day);
	}
	@Override
	public SearchResult searchedList(Searchcode searchcode) {
		List<Touritems> lists = plannerMapper.selectResult(searchcode);
		int count = plannerMapper.countContent(searchcode);
		SearchResult searchResult = new SearchResult(lists, count);
		return searchResult;
	}
	@Override
	public void insert_sp(S_Planner s_planner) {
		plannerMapper.insert_sp(s_planner);
	}
	@Override
	public void delete_sp(long sp_id) {
		plannerMapper.delete_sp(sp_id);
	}
	@Transactional
	@Override
	public TotalList listS(long m_id) {
		newPlannerS(m_id); //신규 플래너 id 생성
		ArrayList<Area_T> list = plannerMapper.list();
		ArrayList<Sigungu_T> list_s = plannerMapper.list_s();
		long thisP_id = plannerMapper.thisP_id(m_id);
		TotalList totalList = new TotalList(list, list_s, thisP_id);
		if(list.size()==0) {
			return null;
		}else {
			return totalList;
		}
	}
	@Override
	public List<Touritems> selectResultS(Searchcode searchcode) { 
		List<Touritems> list = plannerMapper.selectResult(searchcode);
		return list;
	}
	@Override
	public void newPlannerS(long m_id) {
		plannerMapper.newPlanner(m_id);
	}
	@Override
	public void save(Planner planner) {
		plannerMapper.save(planner);
	}
	@Transactional
	@Override
	public void delPlan(long p_id) {
		plannerMapper.delete_sPlan(p_id);
		plannerMapper.delete_Plan(p_id);
	}
	@Override
   public Touritems getItemS(String contentid) {
      Touritems item = plannerMapper.getItem(contentid);
      return item;
   }
}
