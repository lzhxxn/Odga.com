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
	List<Review> review(); //리뷰리스팅
	Review getReview(long b_id); //리뷰디테일
	void insert(Review review); //리뷰 작성
	void insertS(Support support);//문의 작성
	List<Review> selectBestReview(); //베스트리뷰
	List<Review> searchList(@Param("searchOption")String searchOption,@Param("keyword") String keyword); //리뷰 검색
	int countSearch(@Param("searchOption")String searchOption,@Param("keyword") String keyword); //검색 결과 수
	List<Review> catgoList(String catgo); //리뷰 카테고리 리스트
	int countCatgo(String catgo); //카테고리 수
	int countFamily(); //가족여행
	int countCouple(); //커플여행
	int countFriend(); //우정여행
	int countAlone(); //혼자만의여행
	int countPackage(); //패키지여행
	List<Reply> listReply(long b_id); //댓글 리스팅
	int countReply(long b_id);	//댓글 수
	void insert_re(Reply reply); //댓글 작성
	void deleteReply(long re_id); //댓글 삭제
	void upReplyCnt(long b_id); //게시글의 댓글수 올라가기
	void likeUp(Review review); //리뷰의 좋아요 업
	void likeDown(Review review); //리뷰 좋아요 다운
	void insertLike(Like_t liket);	//라이크정보생성
	Like_t listLike(@Param("b_id") long b_id, @Param("m_id")long m_id); //리뷰의 좋아요 가져오기
	void likeClick(Like_t liket); //좋아요 생성
	void likeUnclick(Like_t liket); //좋아요 취소
	Review getPreReview(long b_id); //이전글
	Review getNextReview(long b_id); //다음글
	Member getWriterInfo(long b_id); //작성자 정보 가져오기
	List<Review> selectPerPage(ReviewVo reviewVo); //페이징
	long selectCount(); //페이징
	
}
