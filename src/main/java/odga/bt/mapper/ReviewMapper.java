package odga.bt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import odga.bt.domain.Like_t;
import odga.bt.domain.Member;
import odga.bt.domain.Reply;
import odga.bt.domain.Review;
import odga.bt.domain.Support;
import odga.bt.vo.ReviewVo;

public interface ReviewMapper {
	List<Review> review(); //���丮����
	Review getReview(long b_id); //���������
	void insert(Review review); //���� �ۼ�
	void insertS(Support support);//���� �ۼ�
	List<Review> selectBestReview(); //����Ʈ����
	List<Review> searchList(@Param("searchOption")String searchOption,@Param("keyword") String keyword); //���� �˻�
	int countSearch(@Param("searchOption")String searchOption,@Param("keyword") String keyword); //�˻� ��� ��
	List<Review> catgoList(String catgo); //���� ī�װ� ����Ʈ
	int countCatgo(String catgo); //ī�װ� ��
	int countFamily(); //��������
	int countCouple(); //Ŀ�ÿ���
	int countFriend(); //��������
	int countAlone(); //ȥ�ڸ��ǿ���
	int countPackage(); //��Ű������
	List<Reply> listReply(long b_id); //��� ������
	int countReply(long b_id);	//��� ��
	void insert_re(Reply reply); //��� �ۼ�
	void deleteReply(long re_id); //��� ����
	void upReplyCnt(long b_id); //�Խñ��� ��ۼ� �ö󰡱�
	void likeUp(Review review); //������ ���ƿ� ��
	void likeDown(Review review); //���� ���ƿ� �ٿ�
	void insertLike(Like_t liket);	//����ũ��������
	Like_t listLike(@Param("b_id") long b_id, @Param("m_id")long m_id); //������ ���ƿ� ��������
	void likeClick(Like_t liket); //���ƿ� ����
	void likeUnclick(Like_t liket); //���ƿ� ���
	Review getPreReview(long b_id); //������
	Review getNextReview(long b_id); //������
	Member getWriterInfo(long b_id); //�ۼ��� ���� ��������
	List<Review> selectPerPage(ReviewVo reviewVo); //����¡
	long selectCount(); //����¡
	
}
