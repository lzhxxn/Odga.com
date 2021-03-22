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
	List<Review> review();
	Review getReview(long b_id);
	void insert(Review review);
	void insertS(Support support);//문의하기
	
	List<Review> selectBestReview();
	//List<Review> selectByReview(long m_id);
		
	List<Review> searchList(@Param("searchOption")String searchOption,@Param("keyword") String keyword);
	int countSearch(@Param("searchOption")String searchOption,@Param("keyword") String keyword);
	
	List<Review> catgoList(String catgo);
	int countCatgo(String catgo);
	int countFamily();
	int countCouple();
	int countFriend();
	int countAlone();
	int countPackage();
	
	List<Reply> listReply(long b_id);
	int countReply(long b_id);	
	void insert_re(Reply reply);
	void deleteReply(long re_id);
	void upReplyCnt(long b_id);
	
	void likeUp(Review review);
	void likeDown(Review review);
	void insertLike(Like_t liket);	
	Like_t listLike(@Param("b_id") long b_id, @Param("m_id")long m_id);
	void likeClick(Like_t liket);
	void likeUnclick(Like_t liket);
	
	Review getPreReview(long b_id);
	Review getNextReview(long b_id);
	
	Member getWriterInfo(long b_id);
	 //페이징
	List<Review> selectPerPage(ReviewVo reviewVo);
	long selectCount();
	
}
