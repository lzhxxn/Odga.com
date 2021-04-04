package odga.bt.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import odga.bt.domain.ListResult;
import odga.bt.domain.Review;
import odga.bt.domain.Support;
import odga.bt.service.MypageService;
import odga.bt.service.PlannerService;
import odga.bt.service.ReviewService;
import odga.bt.service.TouritemsService;
import odga.bt.vo.DetailVo;
import odga.bt.vo.MyPlanner;
import odga.bt.vo.TotalList;

@Controller
@RequestMapping("/")
public class MypageController {
	@Autowired
	private MypageService service;	
	@Autowired
    private ReviewService rservice;    
    @Resource
    private PlannerService serviceP;
    @Resource
    private TouritemsService tservice;
    
    //나의 좋아요
	@GetMapping("myLike.do")
	public ModelAndView tables(long m_id) {	
		List<Review> mylike = service.listMyLike(m_id);
		ModelAndView mv = new ModelAndView("mypage/myLike","mylike",mylike);
		return mv; 
	}
	//회원정보수정 페이지
	@RequestMapping("/member.do")
   public String member() {		   
      return "mypage/member"; 
   }
	//회원 탈뢰 페이지
   @RequestMapping("/leaveM")
   public String leave() {
      return "mypage/leave"; 
   }
   //나의 플래너
   @RequestMapping("/member_plan.do")
   public ModelAndView member_plan(long m_id) {
	   ModelAndView mv = new ModelAndView();
	   service.nullPlanDel(m_id);
	   MyPlanner myPlans = service.myPlanS(m_id);
	   if(myPlans!=null) {
		   mv = new ModelAndView("mypage/myPlan", "myPlans", myPlans);
	   return mv;
   }
   else {
	   mv = new ModelAndView("mypage/myPlan");
		   return mv;
	   }
   }
   //나의 플래너 상세보기
   @RequestMapping("/plan_detail.do")
   public ModelAndView plan_detail(long m_id, long p_id) {
	   DetailVo planDetail = service.planDetails(m_id, p_id);
	   if(planDetail!=null) {
		   return new ModelAndView("mypage/plan_detail", "planDetail", planDetail);
   }else{
	   return new ModelAndView("mypage/plan_detail"); 
	   }	       
   }
   //플랜 삭제
   @RequestMapping("delPlan")
   public String delPlan(long p_id, long m_id) {
	   serviceP.delPlan(p_id);
	   System.out.println("# "+m_id+"번 회원 "+p_id+"번 플랜 삭제 완료");
	   String view = "forward:member_plan.do";
	   return view;
   }
   //플랜 수정
   @GetMapping("updateplan")
   public ModelAndView updateplan(long p_id, long m_id) {
      TotalList lists = service.listS(m_id, p_id);
      System.out.println("# "+m_id+"번 회원 "+p_id+"번 플랜 수정");
      ModelAndView mv = new ModelAndView("plan/planner", "list", lists);
      return mv;
   }
   //나의 여행후기
   @RequestMapping("/member_review.do")
   public ModelAndView member_review(@RequestParam long m_id, HttpServletRequest request) {
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
		int ps = 10;
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
		int rangeSize = 10;
		List<Review> review = service.selectByReviewS(m_id);
		ListResult listResult = tservice.getTouritemsListResult(cp, ps, rangeSize);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/member_review");
	    mv.addObject("review", review);
		mv.addObject("listResult", listResult);
		System.out.println("#review: " + review);
		return mv;
	   }
   		//나의 여행후기 삭제
	   @GetMapping("/delete.do")
	   public ModelAndView review_delete(Review review, long b_id, long m_id, HttpServletRequest request) {
			HttpSession session = request.getSession();
			if(session.getAttribute("LOGINUSER") != null) {
				service.deleteByB_idS(b_id);
				System.out.println("# "+m_id+"번 회원 "+b_id+"번 후기 삭제 완료");
			}else {
				System.out.println("# "+m_id+"번 회원 "+b_id+"번 후기 삭제 실패 : 세션만료");
			}
			return new ModelAndView("redirect:/member_review.do?m_id="+ review.getM_id(), "review", service.selectByReviewS(m_id));
		}   
		//나의 여행후기 수정 페이지
		@GetMapping("/update.do")
		public ModelAndView review_update(long b_id) {
			return new ModelAndView("community/update", "review", rservice.getReviewS(b_id));
		}  
		//나의 여행후기 수정하기
		@PostMapping("/update.do")
		public ModelAndView review_update(Review review, long m_id, MultipartFile file) {
			try {
				review.setB_img(rservice.saveStore(file));
				service.updateByB_idS(review);
				System.out.println("# "+m_id+"번 회원 "+review.getB_id()+"번 후기 수정 ");
			}catch(Exception e) {
				service.updateWithoutImgS(review);
				System.out.println("# "+m_id+"번 회원 "+review.getB_id()+"번 후기 수정 ");
			}
			return new ModelAndView("redirect:member_review.do?m_id="+ review.getM_id(), "review", service.selectByReviewS(m_id));
		}
		//나의 문의
		@GetMapping("/support_mlist.do") 
	 	public ModelAndView m_notifications(@RequestParam long m_id) {
			List<Support> notifications = service.m_notificationsS(m_id);
			ModelAndView mv = new ModelAndView("mypage/support_mlist", "notifications", notifications);
			return mv;
		}
}
