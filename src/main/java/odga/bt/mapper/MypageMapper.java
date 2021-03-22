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
	List<Review> listMyLike(long m_id); //���� ���ƿ�
	//ȸ����������
	public boolean updateS(Member member);
	public boolean updateNofile(Member member);
	public void leaveS(Member member);
	//���������� ���� ����
	public ArrayList<Planner> myPlanner(long m_id); 
	public Planner thisplanner(long p_id);
	public ArrayList<S_Planner> planDetail(long p_id);
	public Touritems detailItem (String contentid);
	
	//���� �ı�
	List<Review> selectByReview(long m_id);
	void deleteByB_id(long b_id);
	void updateByB_id(Review review);
	void updateWithoutImg(Review review);
	//���� �����ϱ� ����Ʈ
	List<Support> m_notifications(long m_id);
}

