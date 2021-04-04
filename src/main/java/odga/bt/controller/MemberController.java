package odga.bt.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import odga.bt.domain.Member;
import odga.bt.service.MemberService;
import odga.bt.service.MypageService;


@Controller
public class MemberController {
   @Autowired
   private MemberService service;
   @Autowired
   private MypageService service2;
   
   //회원가입
    @PostMapping("/join.do")
      public String joinS(@RequestParam(value = "file", required = false) MultipartFile file, Member member,String e_check) {
        Member member1 = member;
        if(e_check.equals("checkcheck")) {
           System.out.println("# 이메일 인증 : O");
           if (file.isEmpty()) {
              member1.setM_fname("defaultProfile.png");
              member1.setM_ofname("defaultProfile.png");
              service.joinS(member1);
              System.out.println("# "+member1.getM_id()+"번  "+member1.getM_name()+"회원 가입 성공");System.out.println("# "+member1);
              return "redirect:login.do";
           }else {
              member1 = service.saveStore(member, file);
               String m_ofname = file.getOriginalFilename();
               member1.setM_ofname(m_ofname);       
               service.joinS(member);
               System.out.println("# "+member1.getM_id()+"번  "+member1.getM_name()+"회원 가입 성공");System.out.println("# "+member1);
               return "redirect:login.do";
           }
        }else {
        	 System.out.println("# 이메일 인증 : X");
        	 System.out.println("# 회원 가입 실패");
           return "redirect:login.do";
        }
      }
   // 아이디 찾기
   @PostMapping("findId")
   public @ResponseBody String findId(Member member) {
      String email = service.findIdS(member);
      if(email != null) {
         System.out.println("# "+member.getM_name()+" 회원 아이디 찾기 성공 : "+email);
         return email;
      }else {
         System.out.println("# "+member.getM_name()+" 회원 아이디 찾기 실패");
         return "??";
      }
   }
   //비밀번호 찾기
   @PostMapping("findPwd")
   public @ResponseBody String findPwd(Member member) {   
      service.findPwd(member);
      System.out.println("# "+member.getM_email()+" 회원 비밀번호 찾기 성공 : "+member.getM_pwd());
      return "1";
   }
   // 아이디 중복 체크
   @RequestMapping(value = "checkId.jy", method = RequestMethod.POST)
   public @ResponseBody int checkId(@RequestParam String m_email, HttpServletResponse response) throws Exception {
      int checkid = service.checkId(m_email, response);
      return checkid;
   }
   // 회원정보 수정 패쓰워드 확인용
   @RequestMapping("pwdValid.jy")
   public @ResponseBody int pwdValid(Member member) throws Exception {
      int pwdValid = service2.pwdValid(member);
      return pwdValid;
   }
   //회원정보수정
   @RequestMapping(value = "/member.do", method = RequestMethod.POST)
   private String updateS(Member member, @RequestParam String m_newpwd, @RequestParam MultipartFile file, HttpSession session, RedirectAttributes rttr) throws Exception {
         Member member1 = member;
         String old_pwd = member.getM_pwd();
         m_newpwd.trim();
         if(m_newpwd==""||m_newpwd.isEmpty()) {
        	 m_newpwd=old_pwd;
         }
         if(file.getSize()!=0) {
               member1 = service.saveStore(member, file); 
               String m_ofname = file.getOriginalFilename(); 
               member1.setM_pwd(m_newpwd);      
               member1.setM_ofname(m_ofname);
               if(session.getAttribute("LOGINUSER") == null) {
            	  System.out.println("# 회원 정보 수정 실패 : 세션만료");
                  return "redirect:login.do";
               }
               System.out.println(member.getM_pwd());
               session.setAttribute("LOGINUSER", service.updateS(member1, old_pwd));
               rttr.addFlashAttribute("msg", "회원정보 수정 완료");
               System.out.println("# "+member1.getM_name()+" 회원정보 수정 완료");System.out.println("# "+member1);
               return "redirect:member.do"; 
         }else {
            member1.setM_pwd(m_newpwd);
            if(session.getAttribute("LOGINUSER") == null) {
            	System.out.println("# 회원 정보 수정 실패 : 세션만료");
                  return "redirect:login.do";
            }
            Member memberR = service.updateS(member1, old_pwd);
            if(memberR != null) {
               session.setAttribute("LOGINUSER", memberR);
               rttr.addFlashAttribute("msg", "회원정보 수정 완료");
               System.out.println("# "+member1.getM_name()+" 회원정보 수정 완료");System.out.println("# "+member1);
               return "redirect:member.do";
            }else {
               return "redirect:member.do";
            }
            
         }
      }
      // 회원 탈퇴
      @RequestMapping(value = "leaveM", method = RequestMethod.POST)
      private String leaveS(@ModelAttribute Member member, HttpSession session, HttpServletResponse response) {
         if(session.getAttribute("LOGINUSER") == null) {
        	 System.out.println("# 회원  탈퇴 실패 : 세션만료");
            return "redirect:login.do";
         }
         boolean result = service.leaveS(member, session, response);
         System.out.println("# "+member.getM_name()+" 회원 탈퇴 완료");
         if (result) {
            session.invalidate();
            return "index";
         }else {         
            return "login/leave";
         }
      }
}
