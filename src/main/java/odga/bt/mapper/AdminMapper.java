package odga.bt.mapper;

import java.util.List;

import odga.bt.domain.Admin;
import odga.bt.domain.Member;
import odga.bt.domain.Support;
import odga.bt.domain.Touritems;
import odga.bt.vo.Chart;
import odga.bt.vo.GenderChart;
import odga.bt.vo.Statistics;


public interface AdminMapper {
	List<Chart> areaChart();
	List<Member> memberChart();
	GenderChart female(); 
	GenderChart male();
	
	Statistics countMemeber();
	Statistics countBoard();
	Statistics countTouritem();
	Statistics lastestMember();
	Statistics lastestBoard();
	Statistics lastestPlanner();
	
	List<Member> listAdmin();
	Statistics lastestAdmin();
	
	Touritems bestTouritem();
	
	//회원리스트
	List<Member> list();
	
	//문의하기 게시판(관리자)
	List<Support> notifications();
	//문의게시판 상세페이지(관리자)
	Support selectByTitle(long s_id);
	void insert_reS(Support support);
	void delete(long s_id);
}
