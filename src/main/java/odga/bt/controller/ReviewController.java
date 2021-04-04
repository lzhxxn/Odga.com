package odga.bt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import odga.bt.domain.Like_t;
import odga.bt.domain.Reply;
import odga.bt.domain.Review;
import odga.bt.domain.ReviewListResult;
import odga.bt.domain.Support;
import odga.bt.service.ReviewService;
import odga.bt.vo.ReviewDetail;

@Controller
@RequestMapping("")
public class ReviewController {
	@Autowired
	private ReviewService service;
	private Like_t liket;
	
	//리뷰 작성 페이지
	@GetMapping("write")
	public String write() {
		return "community/write"; 
	}
	//리뷰 작성
	@PostMapping("write")
	public String write(Review review, MultipartFile file) {
		if(file.isEmpty()) {
			review.setB_img("insteadimg.png");
		}else {
			review.setB_img(service.saveStore(file));
		}
		service.insertS(review);
		System.out.println("# "+review.getM_id()+"번 회원 여행 후기 작성 완료");
		return "redirect:review"; 		
	}
	//문의하기 페이지
	@RequestMapping("/support.do")
    public String support(Support support) {
	   return "community/support";
	}
	//문의 작성
	@PostMapping("/support.do")
	public String supportS(Support support,String goPage) {
		service.insertI(support);
		System.out.println("# "+support.getM_id()+"번 회원 문의글 작성 완료");
		if(goPage.equalsIgnoreCase("index")) { //홈으로
			  return "redirect:index.do";
		  }else{ //마이페이지로
			  return "redirect:support_mlist.do?m_id="+support.getM_id();
		  }
	}
	//리뷰 리스팅 페이지
	@GetMapping("/review")
	public ModelAndView review(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		// cp 
		int cp = 1;
		if(cpStr == null) {
			Object cpObj = session.getAttribute("cp");
			if(cpObj != null) {
				cp = (Integer)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			cp = Integer.parseInt(cpStr);
		}
		session.setAttribute("cp", cp);
		// ps 
		int ps = 5;
		if(psStr == null) {
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				ps = (Integer)psObj;
			}
		}else {
			psStr = psStr.trim();
			int psParam = Integer.parseInt(psStr);
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				int psSession = (Integer)psObj;
				if(psSession != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}else {
				if(ps != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}
			ps = psParam;
		}
		session.setAttribute("ps", ps);
		// ModelAndView
		ReviewListResult reviewlistResult = null;
		int rangeSize = 5;
		reviewlistResult = service.getReviewListResult(cp, ps, rangeSize);
		Map<String, Object> reviewSidebar = service.reviewSidebar();
		ModelAndView mv = new ModelAndView("community/review","reviewlistResult", reviewlistResult);
		mv.addObject("reviewSidebar", reviewSidebar);
		if(reviewlistResult.getList().size() == 0) {
			if(cp>1)
				return new ModelAndView("redirect:review.do?cp="+(cp-1));
			else
				return new ModelAndView("community/review", "reviewlistResult", null);
		}
		return mv;
	}
	//리뷰 상세 페이지
	@GetMapping("/review_details")
	public ModelAndView review_details(long b_id,long m_id) {
		Map<String, Object> reviewSidebar = service.reviewSidebar();
		Map<String, Object> getOtherReview = service.getOtherReview(b_id);
		ReviewDetail reviewDetail = service.reviewDetail(b_id);
		long likeflag=0;
		liket = service.listLike(b_id, m_id);		
		if (liket == null){
			liket = new Like_t(0,0,b_id,m_id);
			service.insertLike(liket);
			likeflag = liket.getLikeflag();
		}	
		likeflag = liket.getLikeflag();
		ModelAndView mv = new ModelAndView("community/review_details","reviewDetail",reviewDetail);
		mv.addObject("reviewSidebar", reviewSidebar);
		mv.addObject("getOtherReview", getOtherReview);
		mv.addObject("likeflag",likeflag);
		return mv;
	}   
	//리뷰 검색
	@PostMapping("search")
	public ModelAndView search(@RequestParam String searchOption, @RequestParam String keyword) {						
		Map<String, Object> reviewSearch = new HashMap<String, Object>();
		Map<String, Object> reviewSidebar = service.reviewSidebar();
		List<Review> list = service.searchList(searchOption, keyword);
		int count = service.countSearch(searchOption,keyword);
		reviewSearch.put("list",list);
		reviewSearch.put("count",count);
		reviewSearch.put("searchOption",searchOption);
		reviewSearch.put("keyword",keyword);
		ModelAndView mv = new ModelAndView("community/review","reviewSearch",reviewSearch);		
		mv.addObject("reviewSidebar", reviewSidebar);
		return mv;
	}
	//리뷰 카테고리별 리스팅
	@GetMapping("catgo")
	public ModelAndView catgo(@RequestParam String catgo) {
		Map<String, Object> reviewCatgo = new HashMap<String, Object>();
		Map<String, Object> reviewSidebar = service.reviewSidebar();
		List<Review> list = service.catgoList(catgo);		
		int count = service.countCatgo(catgo);
		reviewCatgo.put("list",list);
		reviewCatgo.put("count",count);
		reviewCatgo.put("catgo",catgo);
		ModelAndView mv = new ModelAndView("community/review","reviewCatgo",reviewCatgo);		
		mv.addObject("reviewSidebar", reviewSidebar);
		return mv;
	}
	//댓글 작성
	@PostMapping("write_re")
	public String write_re(Reply reply,long m_id) {
		service.insert_re(reply);
		long b_id = reply.getB_id();
		service.upReplyCnt(b_id);
		System.out.println("# "+m_id+"번 회원 "+b_id+"번 리뷰에 댓글 작성");
		return "redirect:review_details?b_id="+b_id+"&m_id="+m_id; 
	}
	//댓글 삭제
	@GetMapping("del_re")
	public String write_re(long re_id, long b_id) {	
		service.deleteReply(re_id);
		System.out.println("# "+b_id+"번 리뷰에 댓글 삭제");
		return "redirect:review_details?b_id="+b_id; 
	}
	//좋아요
	@GetMapping("likeUp")
	public @ResponseBody int likeUp(long b_id,long m_id) {
		Review review = service.getReviewS(b_id);
		liket = service.listLike(b_id,m_id);
		liket.setB_id(b_id);liket.setM_id(m_id);
		long likeflag = liket.getLikeflag();
		int b_like = review.getB_like();
		if(likeflag == 0) { //라이크 업			
			service.likeUp(review);
			service.likeClick(liket);
			review = service.getReviewS(b_id);
			b_like = review.getB_like();
			likeflag = 1; liket.setLikeflag(likeflag);
			System.out.println("# "+m_id+"번 회원 "+b_id+"번 리뷰에 좋아요 클릭");
		}else if(likeflag == 1) { //라이크 다운
			service.likeDown(review);
			service.likeUnclick(liket);
			review = service.getReviewS(b_id);
			b_like = review.getB_like();
			likeflag = 0; liket.setLikeflag(likeflag);
			System.out.println("# "+m_id+"번 회원 "+b_id+"번 리뷰에 좋아요 취소");
		}							
		return b_like; 
	}
}
