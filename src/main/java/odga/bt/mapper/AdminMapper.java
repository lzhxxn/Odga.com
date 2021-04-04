package odga.bt.mapper;

import java.util.List;
import odga.bt.domain.Member;
import odga.bt.domain.Support;
import odga.bt.domain.Touritems;
import odga.bt.vo.Chart;
import odga.bt.vo.GenderChart;
import odga.bt.vo.Statistics;

public interface AdminMapper {
	List<Chart> areaChart(); //������ȣ�� ��Ʈ
	List<Member> memberChart(); //ȸ�����Լ� ��Ʈ
	GenderChart female(); //ȸ�� ���� ��Ʈ
	GenderChart male();
	Statistics countMemeber(); //�� ȸ����
	Statistics countBoard(); //�Խñ� ��
	Statistics countTouritem(); //������ ��
	Statistics lastestMember(); //�ֱ�ȸ������ ����
	Statistics lastestBoard(); //�ֱٰԽñ� ����
	Statistics lastestPlanner(); //�ֱ� �÷��� ����
	List<Member> listAdmin(); //������ ����Ʈ
	Statistics lastestAdmin(); //�ֱ� ������ ����
	Touritems bestTouritem(); //��ȣ������1��
	List<Member> list(); //ȸ������Ʈ
	List<Support> notifications(); //�����ϱ� �Խ���(������)
	Support selectByTitle(long s_id); //���ǰԽ��� ��������(������)
	void insert_reS(Support support); //���� ��� �ۼ�
	void delete(long s_id); //���Ǳ� ����
}
