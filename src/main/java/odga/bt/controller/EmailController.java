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
 
    @RequestMapping(value = "/sign-up", method = RequestMethod.POST)
    public String regist(Member user, RedirectAttributes rttr) throws Exception{
    
        System.out.println("regesterPost ���� ");
        System.out.println("�̸��� : " + user.getM_email() );
        memberSvc.regist(user);
        rttr.addFlashAttribute("msg" , "���Խ� ����� �̸��Ϸ� �������ּ���");
        return HOME;
    }
     
    @RequestMapping(value = "/emailConfirm", method = RequestMethod.POST)
    public String emailConfirm(Member user, RedirectAttributes rttr) throws Exception { 
        
    	System.out.println("�ڡڡڡڡڡڡ������׽�Ʈ ����");
    	System.out.println("�ڡڡڡڡڡڡ������׽�Ʈ asd ==" + user.getAuthkey() );
    	
        if(user.getAuthkey() == null) {
            rttr.addFlashAttribute("msg", "����Ű�� �߸��Ǿ����ϴ�. �ٽ� ������ �ּ���");
            return HOME;
        }
        
        String result = memberSvc.userAuth(user.getAuthkey());
        
        if ( result.equals("no")) {
        	return result;
        }else {
        	return HOME;
        }
        
        
    }
}
