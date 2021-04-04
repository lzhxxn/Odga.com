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
	public boolean updateS(Member member); //ȸ����������
	public boolean updateNofile(Member member); //ȸ����������(�̹���X)
	public void leaveS(Member member); //ȸ�� Ż��
	public ArrayList<Planner> myPlanner(long m_id); //���� ����
	public Planner thisplanner(long p_id);
	public ArrayList<S_Planner> planDetail(long p_id); //���� ���� ������
	public Touritems detailItem (String contentid); //������ ������
	List<Touritems> plannerImg(long m_id); //�÷��� ��ǥ ���� �̱�
	public void nullPlanDel(long m_id); //NULL�� �÷��� ����
	List<Review> selectByReview(long m_id); //���� �ı�
	void deleteByB_id(long b_id); //���� �ı� ����
	void updateByB_id(Review review); //���� �ı� ����
	void updateWithoutImg(Review review); //���� �ı� ����(�̹���X)
	List<Support> m_notifications(long m_id); //���� �����ϱ� ����Ʈ
}

