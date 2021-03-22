package odga.bt.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import odga.bt.domain.Like_t;
import odga.bt.domain.Member;
import odga.bt.domain.Reply;
import odga.bt.domain.Review;
import odga.bt.domain.ReviewListResult;
import odga.bt.domain.Support;
import odga.bt.filesetting.Path;
import odga.bt.mapper.ReviewMapper;
import odga.bt.vo.ReviewDetail;
import odga.bt.vo.ReviewVo;

@Log4j
@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewMapper reviewMapper;
	
	@Override
	public List<Review> reviewS() {
		return reviewMapper.review();
	}

	@Override
	public void insertS(Review review) {
		reviewMapper.insert(review);
	}
	
	@Override
	public List<Review> searchList(String searchOption, String keyword) {
		return reviewMapper.searchList(searchOption,keyword);
	}

	@Override
	public int countSearch(String searchOption, String keyword) {
		return reviewMapper.countSearch(searchOption,keyword);
	}
	
	@Override
	public List<Review> catgoList(String catgo) {
		return reviewMapper.catgoList(catgo);
	}

	@Override
	public int countCatgo(String catgo) {
		return reviewMapper.countCatgo(catgo);
	}
	
	@Override
	public Map<String, Object> reviewSidebar() { //사이드 바에 카테고리별 결과 수, 최근 글 리스팅
		Map<String, Object> reviewSidebar = new HashMap<String, Object>();
		List<Review> recently = reviewMapper.review();
		reviewSidebar.put("recently",(Object)recently);
		reviewSidebar.put("family",(Object)reviewMapper.countFamily());
		reviewSidebar.put("couple",(Object)reviewMapper.countCouple());
		reviewSidebar.put("friend",(Object)reviewMapper.countFriend());
		reviewSidebar.put("alone",(Object)reviewMapper.countAlone());
		reviewSidebar.put("pack",(Object)reviewMapper.countPackage());
		return reviewSidebar;
	}

	@Override
	public void insert_re(Reply reply) {
		reviewMapper.insert_re(reply);
	}
	@Override
	public void upReplyCnt(long b_id) {
		reviewMapper.upReplyCnt(b_id);
		
	}
	@Override
	public void likeUp(Review review) {
		reviewMapper.likeUp(review);		
	}
	@Override
	public void likeDown(Review review) {
		reviewMapper.likeDown(review);		
	}
	@Override
	public void likeClick(Like_t liket) {
		reviewMapper.likeClick(liket);		
	}
	@Override
	public void likeUnclick(Like_t liket) {
		reviewMapper.likeUnclick(liket);		
	}
	
	@Override
	public void insertLike(Like_t liket) {
		reviewMapper.insertLike(liket);
	}

	@Override
	public Like_t listLike(long b_id, long m_id) {
		return reviewMapper.listLike(b_id,m_id);
	}

	@Override
	public Map<String, Object> getOtherReview(long b_id) { //이전글 다음글
		Map<String, Object> getOtherReview = new HashMap<String, Object>();
		getOtherReview.put("reviewNext", (Object)reviewMapper.getNextReview(b_id));
		getOtherReview.put("reviewPre", (Object)reviewMapper.getPreReview(b_id));
		return getOtherReview;
	}

	@Override
	public ReviewDetail reviewDetail(long b_id) { //리뷰디테일 화면구성
		ReviewDetail reviewDetail = new ReviewDetail();
		Review review= reviewMapper.getReview(b_id);
		Member writerInfo  = reviewMapper.getWriterInfo(b_id);
		List<Reply> reply = reviewMapper.listReply(b_id);
		int countReply = reviewMapper.countReply(b_id);
		reviewDetail.setReview(review);
		reviewDetail.setReply(reply);
		reviewDetail.setCountReply(countReply);
		reviewDetail.setWriterInfo(writerInfo);
		return reviewDetail;
	}
	
	@Override public Review getReviewS(long b_id) { 
		  return reviewMapper.getReview(b_id); 
	}

	@Override
	public void deleteReply(long re_id) {
		reviewMapper.deleteReply(re_id);		
	}
	
	//성환추가
	@Override
	public void insertI(Support support) {
		reviewMapper.insertS(support);
	}

	@Override
	public List<Review> selectBestReviewS() {
		return reviewMapper.selectBestReview();
	}

	@Override
	public String saveStore(MultipartFile file) {
		String ofname = file.getOriginalFilename();
		System.out.println("#ofname: " + ofname);
		int idx = ofname.lastIndexOf(".");
		String ofheader = ofname.substring(0, idx);
		String ext = ofname.substring(idx);
		long ms = System.currentTimeMillis();
		StringBuilder sb = new StringBuilder();
		sb.append(ofheader);
		sb.append("_");
		sb.append(ms);
		sb.append(ext);
		String name = sb.toString();
		
		long fsize = file.getSize();
		log.info("#ofname: " + ofname + ", name: " + name + ", fsize: "+fsize);
		
		boolean flag = writeFile(file, name);
		if(flag) {
			log.info("#############################���ε� ����#############################");
		}else {
			log.info("#############################���ε� ����#############################");
		}
		return name;
	}

	@Override
	public boolean writeFile(MultipartFile file, String name) {
		File rDir = new File(Path.FILE_REVIEW);
		if(!rDir.exists()) rDir.mkdirs();
		
		FileOutputStream fos = null;
		try {
			byte data[] = file.getBytes();
			fos = new FileOutputStream(Path.FILE_REVIEW+name);
			fos.write(data);
			fos.flush();
			
			return true;
		}catch(IOException ie) {
			return false;
		}finally {
			try {
				if(fos != null) fos.close();
			}catch(IOException ie) {}
		}
	}

	@Override
	public ReviewListResult getReviewListResult(int cp, int ps, int rangeSize) {
		long totalCount = reviewMapper.selectCount();
		ReviewVo reviewVo = new ReviewVo(null, null, cp, ps);
		List<Review> list = reviewMapper.selectPerPage(reviewVo);
		
		return new ReviewListResult(cp, totalCount, ps, list, rangeSize);
	}
}
