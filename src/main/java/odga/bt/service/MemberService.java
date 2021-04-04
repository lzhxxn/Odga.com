package odga.bt.service;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.multipart.MultipartFile;
import odga.bt.domain.Member;

public interface MemberService {
	public int checkId(String m_email, HttpServletResponse response) throws Exception;
	public boolean joinS(Member member);
	Member login(Member member, HttpServletResponse response, ServletContext servletContext) throws Exception;
	void logout(HttpServletResponse response, HttpSession session);
	Member updateS(Member member) throws Exception;
	Member updateS(Member member, String old_pwd) throws Exception;
	boolean leaveS(Member member, HttpSession session, HttpServletResponse response);
	// 이메일
	public void regist(Member member) throws Exception;
	public String userAuth(String authkey) throws Exception;
	 // 이미지업로드
    boolean writeFile(MultipartFile file, String saveFileName);
    String saveStore(MultipartFile file);   
    Member saveStore(Member member, MultipartFile file); 
    //find id/pw
  	public String findIdS(Member member);
  	public void findPwd(Member member);
  	//로그인 체크
    public int checkLogin(Member member, HttpServletResponse response) throws Exception;
}
