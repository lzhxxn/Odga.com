package odga.bt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import odga.bt.domain.Member;
import odga.bt.service.MemberService;

@Controller
public class EmailController {
	
	private final String HOME = "redirect:/";

    @Autowired
    private MemberService memberSvc;
    
    //이메일 인증시작
    @RequestMapping(value = "/sign-up", method = RequestMethod.POST)
    public String regist(Member user, RedirectAttributes rttr) throws Exception{
        memberSvc.regist(user);
        rttr.addFlashAttribute("msg" , "가입시 사용한 이메일로 인증해주세요");
        System.out.println("# 이메일 : " + user.getM_email()+" 인증 시작");
        return HOME;
    }
     //인증코드확인
    @RequestMapping(value = "/emailConfirm", method = RequestMethod.POST)
    public String emailConfirm(Member user, RedirectAttributes rttr) throws Exception { 
    	System.out.println("# 인증코드 : " + user.getAuthkey());
        if(user.getAuthkey() == null) {
            rttr.addFlashAttribute("msg", "인증키가 잘못되었습니다. 다시 인증해 주세요");
            return HOME;
        }
        String result = memberSvc.userAuth(user.getAuthkey());
        if ( result.equals("no")) {
        	System.out.println("# 인증 코드 틀림");
        	return result;
        }else {
        	System.out.println("# 인증 성공");
        	return HOME;
        }        
    }
}
