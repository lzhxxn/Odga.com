package odga.bt.mapper;

import java.util.List;
import odga.bt.domain.Member;
import odga.bt.domain.Support;
import odga.bt.domain.Touritems;
import odga.bt.vo.Chart;
import odga.bt.vo.GenderChart;
import odga.bt.vo.Statistics;

public interface AdminMapper {
	List<Chart> areaChart(); //지역선호도 차트
	List<Member> memberChart(); //회원가입수 차트
	GenderChart female(); //회원 성비 차트
	GenderChart male();
	Statistics countMemeber(); //총 회원수
	Statistics countBoard(); //게시글 수
	Statistics countTouritem(); //관광지 수
	Statistics lastestMember(); //최근회원가입 일자
	Statistics lastestBoard(); //최근게시글 일자
	Statistics lastestPlanner(); //최근 플래너 일자
	List<Member> listAdmin(); //관리자 리스트
	Statistics lastestAdmin(); //최근 관리자 일자
	Touritems bestTouritem(); //선호관광지1등
	List<Member> list(); //회원리스트
	List<Support> notifications(); //문의하기 게시판(관리자)
	Support selectByTitle(long s_id); //문의게시판 상세페이지(관리자)
	void insert_reS(Support support); //문의 답글 작성
	void delete(long s_id); //문의글 삭제
}
