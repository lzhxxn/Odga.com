package odga.bt.service;

import java.util.List;
import java.util.Map;

import odga.bt.domain.Admin;
import odga.bt.domain.Member;
import odga.bt.domain.Support;
import odga.bt.domain.Touritems;
import odga.bt.vo.Chart;
import odga.bt.vo.GenderChart;

public interface AdminService {	
	List<Chart> areaChart();
	List<Member> memberChart();
	List<GenderChart> genderChart();
	
	Map<String,Object> getStatistics();
	
	List<Member> listAdmin();
	
	Touritems bestTouritem();	
	
	// ȸ������Ʈ
	List<Member> m_listS();
	
	//���ǰԽ���(������)
	List<Support> notificationsS();
	//���ǰԽ��ǻ�������(������)
	Support selectByTitle(long s_id);
	void insertreS(Support support);
	void deleteS(long s_id);
	void delmemS(Member mem);
}
