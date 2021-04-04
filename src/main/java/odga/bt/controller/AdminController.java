package odga.bt.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import odga.bt.domain.Member;
import odga.bt.domain.Support;
import odga.bt.domain.Touritems;
import odga.bt.service.AdminService;
import odga.bt.service.MemberService;
import odga.bt.vo.Chart;
import odga.bt.vo.GenderChart;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	
	//대시보드
	@RequestMapping("dashboard.do") 
    public ModelAndView chart() {
		List<Chart> areaC = service.areaChart();
		List<Member> memberC = service.memberChart();
		List<GenderChart> genderC = service.genderChart();
		Map<String, Object> statistic = service.getStatistics();
		List<Member> adminList = service.listAdmin();
		Touritems bestItem = service.bestTouritem();
		ModelAndView mv = new ModelAndView("admin/dashboard","areaC",areaC);
		mv.addObject("memberC", memberC);
		mv.addObject("genderC", genderC);
		mv.addObject("statistic", statistic);
		mv.addObject("admin", adminList);
		mv.addObject("bestItem", bestItem);
		return mv;
    }
	//회원리스트
	@RequestMapping("/memberList.do")
	public ModelAndView m_listing() {
		List<Member> m_list = service.m_listS();
		ModelAndView mv = new ModelAndView("admin/member_list", "m_list", m_list);
		return mv;	
	}
	//관리자 정보수정페이지
   @RequestMapping("/admin_info.do") 
   public String user() {
      return "admin/admin_info"; 
   }
   //문의글 리스트
   @GetMapping("/support_list.do")
	public ModelAndView notifications() {
		List<Support> notifications = service.notificationsS();
		ModelAndView mv = new ModelAndView("admin/support_list", "notifications", notifications);
		return mv;
	}
   //문의글 상세보기
   @GetMapping("/support_content.do") 
	public ModelAndView content(long s_id) {
		Support support = service.selectByTitle(s_id);
		ModelAndView mv = new ModelAndView("admin/support_content", "support", support);
		return mv;
	}
   //문의글 답글페이지
  @GetMapping("/reply.do")
	public String reply(Support support) {
		int origin_no1 = support.getOrigin_no();
	    support.setOrigin_no(origin_no1);
		return "admin/support_reply";
	}
  //문의글 답글달기
  	@PostMapping("/reply.do")
	public String support_reply(Support support) {
	    service.insertreS(support);
	    System.out.println("# "+support.getM_name()+" 관리자 답글 작성 완료");
		return "redirect:support_list.do";
	}
  	//문의글 삭제
	@GetMapping("support_delete.do")
	public String delete(@RequestParam long s_id) {
		service.deleteS(s_id);
		System.out.println("# "+s_id+"번 답글 삭제 완료");
		return "redirect:support_list.do";
	}
	//회원 강제 탈퇴
	@GetMapping("delMem.do")
	public String delMem(@RequestParam String m_email, @RequestParam String m_pwd) {
		Member mem = new Member(m_email, m_pwd);
		service.delmemS(mem);
		System.out.println("# 회원 "+mem.getM_name()+" 삭제 완료");
		return "redirect:memberList.do";
	}
}
