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
import odga.bt.domain.Planner;
import odga.bt.domain.Review;
import odga.bt.domain.Support;
import odga.bt.service.MypageService;
import odga.bt.service.PlannerService;
import odga.bt.service.ReviewService;
import odga.bt.service.TouritemsService;
import odga.bt.vo.DetailVo;
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
    
	@GetMapping("myLike.do")
	public ModelAndView tables(long m_id) {	

		List<Review> mylike = service.listMyLike(m_id);
		ModelAndView mv = new ModelAndView("mypage/myLike","mylike",mylike);
		return mv; 
	}
	@RequestMapping("/member.do")
	   public String member() {		   
	      return "mypage/member"; 
	   }
	   @RequestMapping("/leaveM")
	   public String leave() {
	      return "mypage/leave"; 
	   }
	   @RequestMapping("/member_edit.do")
	   public String member_edit() {
	      return "mypage/member_edit"; 
	   }
	   @RequestMapping("/member_plan.do")
	   public ModelAndView member_plan(long m_id) {
		   System.out.println("###"+m_id);
		   List<Planner> myPlans = service.myPlanS(m_id);

		   int min=1, max=15;
		   for(Planner plan : myPlans) {		   
			   int ranNum =(int)(Math.random() * (max - min + 1) + min);
			   String li = ranNum+".jpg";
			   plan.setRandomImg(li);
		   }
		   if(myPlans!=null) return new ModelAndView("mypage/myPlan", "myPlans", myPlans);
		   else {
			   return new ModelAndView("mypage/myPlan"); 
		   }
	   }
	   @RequestMapping("/plan_detail.do")
	   public ModelAndView plan_detail(long m_id, long p_id) {
		   System.out.println(p_id);	   
		   DetailVo planDetail = service.planDetails(m_id, p_id);
		   if(planDetail!=null) {
			   System.out.println(1);
			   return new ModelAndView("mypage/plan_detail", "planDetail", planDetail);
		   }else{
			   System.out.println(2);
			   return new ModelAndView("mypage/plan_detail"); 
		   }	       
	   }
	   @RequestMapping("delPlan")
	   public String delPlan(long p_id, long m_id) {
		   serviceP.delPlan(p_id);
		   
		   String view = "forward:member_plan.do";
		   return view;
	   }
	   @GetMapping("updateplan")
	   public ModelAndView updateplan(long p_id, long m_id) {
	      TotalList lists = service.listS(m_id, p_id);
	      System.out.println(lists.getThisP_id());
	      ModelAndView mv = new ModelAndView("plan/planner", "list", lists);
	      return mv;
	   }
	   @RequestMapping("/member_review.do")
	   public ModelAndView member_review(@RequestParam long m_id, HttpServletRequest request) {
		   HttpSession session = request.getSession();
			System.out.println("#m_id: " + m_id);
			String cpStr = request.getParameter("cp");
			String psStr = request.getParameter("ps");
			//(1) cp 
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
					
					//(2) ps 
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
	   @GetMapping("/delete.do")
		public ModelAndView review_delete(Review review, long b_id, long m_id, HttpServletRequest request) {
			HttpSession session = request.getSession();
			
			if(session.getAttribute("LOGINUSER") != null) {
				service.deleteByB_idS(b_id);
			}
			
			return new ModelAndView("redirect:/member_review.do?m_id="+ review.getM_id(), "review", service.selectByReviewS(m_id));
		}   
		
		@GetMapping("/update.do")
		public ModelAndView review_update(long b_id) {
			return new ModelAndView("community/update", "review", rservice.getReviewS(b_id));
		}  
		
		@PostMapping("/update.do")
		public ModelAndView review_update(Review review, long m_id, MultipartFile file) {
			
			try {
				review.setB_img(rservice.saveStore(file));
				service.updateByB_idS(review);
			}catch(Exception e) {
				service.updateWithoutImgS(review);
			}
			
			return new ModelAndView("redirect:member_review.do?m_id="+ review.getM_id(), "review", service.selectByReviewS(m_id));
		}
		@GetMapping("/support_mlist.do") 
	 	public ModelAndView m_notifications(@RequestParam long m_id) {
		    System.out.println("#m_id: " + m_id);
			List<Support> notifications = service.m_notificationsS(m_id);
			ModelAndView mv = new ModelAndView("mypage/support_mlist", "notifications", notifications);
			return mv;
		}
}
