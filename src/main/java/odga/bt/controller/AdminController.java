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
	@Autowired
	private MemberService mservice;
	
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

	@RequestMapping("/memberList.do")
	public ModelAndView m_listing() {
		List<Member> m_list = service.m_listS();
		ModelAndView mv = new ModelAndView("admin/member_list", "m_list", m_list);
			
		return mv;	
	}

   @RequestMapping("/admin_info.do") 
   public String user() {
      return "admin/admin_info"; 
   }
   @RequestMapping(value = "/admin_info.do", method = RequestMethod.POST)
   private String updateS(Member member, @RequestParam String m_newpwd, @RequestParam MultipartFile file, HttpSession session, RedirectAttributes rttr) throws Exception {
		
	    Member member1 = member;
		if(file.getSize()!=0) {
			   member1 = mservice.saveStore(member, file); 
			   String m_ofname = file.getOriginalFilename(); 

				member1.setM_pwd(m_newpwd);
				member1.setM_ofname(m_ofname);
				System.out.println(member.getM_pwd());
				if(session.getAttribute("LOGINUSER") == null) {
					return "redirect:login.do";
				}
				session.setAttribute("LOGINUSER", mservice.updateS(member1));
				rttr.addFlashAttribute("msg", "회원정보 수정 완료");
				return "redirect:admin_info.do"; 
		}else {
			member1.setM_pwd(m_newpwd);
			if(session.getAttribute("LOGINUSER") == null) {
					return "redirect:login.do";
			}
			session.setAttribute("LOGINUSER", mservice.updateS(member1));
			rttr.addFlashAttribute("msg", "회원정보 수정 완료");
			return "redirect:admin_info.do";
		}
	}
   @GetMapping("/support_list.do")
	public ModelAndView notifications() {
		List<Support> notifications = service.notificationsS();
		ModelAndView mv = new ModelAndView("admin/support_list", "notifications", notifications);
		return mv;
	}
   @GetMapping("/support_content.do") 
	public ModelAndView content(long s_id) {
		System.out.println("#subject: " + s_id);
		Support support = service.selectByTitle(s_id);
		ModelAndView mv = new ModelAndView("admin/support_content", "support", support);
		return mv;
	}
  @GetMapping("/reply.do")
	public String reply(Support support) {
		int origin_no1 = support.getOrigin_no();
	    support.setOrigin_no(origin_no1);

		return "admin/support_reply";
	}
  	@PostMapping("/reply.do")
	public String support_reply(Support support) {
	   System.out.println("####");
	    service.insertreS(support);	
		return "redirect:support_list.do";
	}
	@GetMapping("support_delete.do")
	public String delete(@RequestParam long s_id) {
		service.deleteS(s_id);
		return "redirect:support_list.do";
	}
	@GetMapping("delMem.do")
	public String delMem(@RequestParam String m_email, @RequestParam String m_pwd) {
		Member mem = new Member(m_email, m_pwd);
		service.delmemS(mem);
		return "redirect:memberList.do";
	}
}
