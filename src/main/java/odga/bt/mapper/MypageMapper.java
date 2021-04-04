package odga.bt.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import odga.bt.domain.Member;
import odga.bt.domain.Planner;
import odga.bt.domain.Review;
import odga.bt.domain.S_Planner;
import odga.bt.domain.Support;
import odga.bt.domain.Touritems;


@Mapper
public interface MypageMapper {
	List<Review> listMyLike(long m_id); //나의 좋아요
	public boolean updateS(Member member); //회워정보수정
	public boolean updateNofile(Member member); //회워정보수정(이미지X)
	public void leaveS(Member member); //회원 탈퇴
	public ArrayList<Planner> myPlanner(long m_id); //나의 일정
	public Planner thisplanner(long p_id);
	public ArrayList<S_Planner> planDetail(long p_id); //나의 일정 디테일
	public Touritems detailItem (String contentid); //디테일 아이템
	List<Touritems> plannerImg(long m_id); //플래너 대표 사진 뽑기
	public void nullPlanDel(long m_id); //NULL인 플래너 삭제
	List<Review> selectByReview(long m_id); //나의 후기
	void deleteByB_id(long b_id); //나의 후기 삭제
	void updateByB_id(Review review); //나의 후기 수정
	void updateWithoutImg(Review review); //나의 후기 수정(이미지X)
	List<Support> m_notifications(long m_id); //나의 문의하기 리스트
}

