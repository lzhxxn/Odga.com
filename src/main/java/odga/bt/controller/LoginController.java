package odga.bt.controller;

import javax.servlet.ServletContext;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import odga.bt.domain.Member;
import odga.bt.service.MemberService;

@Controller
@RequestMapping("/")
public class LoginController {
	@Autowired
	private MemberService service;
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	   private String login(@ModelAttribute Member member, HttpSession session, HttpServletResponse response) throws Exception {	      	     
	      Member m1 = service.login(member, response, servletContext);
	      
	      if(m1 != null) {      
	         session.setAttribute("LOGINUSER", m1);
	         return "forward:index.do";
	      }else {
	         return "login";
	      }
	   }
		@RequestMapping(value = "logout", method = RequestMethod.GET)
		private String logout(HttpServletResponse response, HttpSession session) throws Exception {
			service.logout(response, session);
			return "forward:index.do";
		}
		@GetMapping("findIdPwd")
		private String findIdPwd() {
			return "forgot";
		}
}
