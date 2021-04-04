package odga.bt.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;
import lombok.AllArgsConstructor;
import odga.bt.domain.Member;
import odga.bt.domain.Support;
import odga.bt.domain.Touritems;
import odga.bt.mapper.AdminMapper;
import odga.bt.mapper.MypageMapper;
import odga.bt.vo.Chart;
import odga.bt.vo.GenderChart;

@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService {
	private AdminMapper adminMapper;
	private MypageMapper mypageMapper;
	@Override
	public List<Chart> areaChart() {
		return adminMapper.areaChart();
	}
	@Override
	public List<Member> memberChart() {
		return adminMapper.memberChart();
	}
	@Override
	public List<GenderChart> genderChart() {
		List<GenderChart> genList = new ArrayList<GenderChart>();
		genList.add(adminMapper.female());
		genList.add(adminMapper.male());
		return genList;
	}
	@Override
	public Map<String, Object> getStatistics() {
		Map<String, Object> statistic = new HashMap<String, Object>();
		SimpleDateFormat format = new SimpleDateFormat ("yyyy- MM-dd");
		Date today = new Date();
		statistic.put("memberCnt", (Object)adminMapper.countMemeber().getMemberCnt());
		statistic.put("boardCnt", (Object)adminMapper.countBoard().getBoardCnt());
		statistic.put("tourCnt", (Object)adminMapper.countTouritem().getTourCnt());
		statistic.put("newMember", (Object)adminMapper.lastestMember().getM_rdate());
		statistic.put("newBoard", (Object)adminMapper.lastestBoard().getB_rdate());
		statistic.put("newPlanner", (Object)adminMapper.lastestPlanner().getP_rdate());
		statistic.put("newAdmin", (Object)adminMapper.lastestAdmin().getM_rdate());
		statistic.put("today", (Object)format.format(today));
		return statistic;
	}
	@Override
	public List<Member> listAdmin() {
		return adminMapper.listAdmin();
	}
	@Override
	public Touritems bestTouritem() {
		return adminMapper.bestTouritem();
	}
	@Override
	public List<Member> m_listS() {
		return adminMapper.list();
	}
	@Override
	public List<Support> notificationsS() {
		return adminMapper.notifications(); 
	}
	@Override
	public Support selectByTitle(long s_id) {
		return adminMapper.selectByTitle(s_id);
	}
	@Override
	public void insertreS(Support support) {
		adminMapper.insert_reS(support);
	}
	@Override
	public void deleteS(long s_id) {
		adminMapper.delete(s_id);
	}
	@Override
	public void delmemS(Member mem) {
		mypageMapper.leaveS(mem);
	}
}
