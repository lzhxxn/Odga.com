package odga.bt.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import lombok.AllArgsConstructor;
import odga.bt.domain.Member;
import odga.bt.emailutill.MailHandler;
import odga.bt.emailutill.TempKey;
import odga.bt.filesetting.Path;
import odga.bt.mapper.MemberMapper;
import odga.bt.mapper.MypageMapper;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	@Autowired
	public MemberMapper memberMapper;
	@Autowired
	public MypageMapper mypageMapper;
	@Autowired
	HttpSession session;
	@Autowired
	private JavaMailSender mailSender;

	@Override
	public boolean joinS(Member member) {
		try {
			memberMapper.joinS(member);
			return true;
		}catch(Exception e) {
			return false;
		}
	}
	// 이메일 중복검사 AJAX 
	@Override
	public int checkId(String m_email, HttpServletResponse response) throws Exception {
		int i = memberMapper.checkId(m_email);
		System.out.println("# MemberServiceImpl : 아이디 있음");
		return i;
	}	
	@Override
	public Member login(Member member, HttpServletResponse response, ServletContext servletContext) throws Exception {
		if(memberMapper.checkId(member.getM_email()) == 0) {
			System.out.println("<script>");
			System.out.println("salert('등록된 이메일이 없습니다.');");
			System.out.println("history.go(-1);");
			System.out.println("</script>");
			return null;
		} else {
			Member member1 = memberMapper.loginS(member.getM_email());
			String pwd1 = member1.getM_pwd();
			String pwd2 = member.getM_pwd();
			if(pwd1.equals(pwd2)) {
				member1.setM_pwd("");
				return member1;
			}else {
				System.out.println("# MemberServiceImpl : 로그인 실패");
				return null;
			}
		}
	}
	@Override
	public void logout(HttpServletResponse response, HttpSession session) {
		session.invalidate();
	}
	@Override
	public Member updateS(Member member) throws Exception {
		if(member.getM_fname() !=null) {
			mypageMapper.updateS(member);
			return memberMapper.loginS(member.getM_email());
		}else {
			mypageMapper.updateNofile(member);
			return memberMapper.loginS(member.getM_email());
		}		
	}
	//회원탈퇴 
	@Override
	public boolean leaveS(Member member, HttpSession session, HttpServletResponse response){
		Member m1 = memberMapper.loginS(member.getM_email());
		response.setContentType("text/html;charset=utf-8");
		String pwd1 = m1.getM_pwd();
		String pwd2 = member.getM_pwd();
		if(pwd1.equals(pwd2)) { 
			mypageMapper.leaveS(member);
			return true;
		}else {
			System.out.println("# MemberServiceImpl : 회원탈퇴 실패");
			return false;
		}
	}
	@Override
	   public Member updateS(Member member, String old_pwd) throws Exception {
	      Member member1 = memberMapper.loginS(member.getM_email());
	      if(member.getM_fname() !=null) {
	         if(member1.getM_pwd().equals(old_pwd)) {
	            mypageMapper.updateS(member);
	            System.out.println("# MemberServieImpl : 새로운비밀번호 : " + member);
	         return memberMapper.loginS(member.getM_email());
	         }else { 
	            System.out.println("# MemberServieImpl : 수정 실패(기존비밀번호 불일치):" + member1);
	            return null;
	         }
	      }else {
	         if(member1.getM_pwd().equals(old_pwd)) {
	            mypageMapper.updateNofile(member);
	            System.out.println("# MemberServieImpl : 새로운비밀번호 : " + member);
	         return memberMapper.loginS(member.getM_email());
	         }else { 
	        	 System.out.println("# MemberServieImpl : 수정 실패(기존비밀번호 불일치):" + member1);
	            return null;
	         }
	      }      
	   }
/*---------------------------------------------
 *  이메일 관련 메서드 시작
 *--------------------------------------------*/
	   public void regist(Member member) throws Exception {
	        String key = new TempKey().generateKey(30);  // 인증키 생성
	        member.setAuthkey(key);	        
	        memberMapper.emailAuthIns(member); // 이메일 보내기전에 인증키값을 테이블에 저장
	        //메일 전송
	        MailHandler sendMail = new MailHandler(mailSender);
	        sendMail.setSubject("서비스 이메일 인증");
	        sendMail.setText(
	                new StringBuffer()
	                .append("<h1 style=\"font-weight: bold; font-family: Arial;\">나만의 여행 플래너 오디가!</h1>")
	                .append("<h1 style=\"font-family: Arial;\">쉽고 빠르게 여행을 계획하세요.</h1><br>")
	                .append("<h2 style=\"font-family: Arial;\">아래의 인증키를 입력하세요</h2>")
	                .append(key)
	                .toString());
	        sendMail.setFrom("thecolorpoetic@gmail.com", "오디가 프로젝트");
	        sendMail.setTo(member.getM_email());
	        sendMail.send();
	    }
    //이메일 인증 키 검증
    public String userAuth(String authkey) throws Exception {
    	String resultVal = "";
        Member member = new Member();
        if(member!=null){
            try{ 	
            	String dv = memberMapper.emailAuthChk(authkey);            	
            	if ( dv != null ) {
            		memberMapper.emailAuthDel(authkey);
            		System.out.println("# MemberServiceImpl : 이메일 인증 성공");
            		resultVal = "yes";
            	}else {
            		System.out.println("삭제안됨");
            		System.out.println("# MemberServiceImpl : 이메일 인증 실패");
            		resultVal = "no";
            	}
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
        return resultVal;
    }
    @Override
    public boolean writeFile(MultipartFile file, String saveFileName) {
        File rDir = new File(Path.FILE_STORE);
           if(!rDir.exists()) rDir.mkdirs();
           FileOutputStream fos = null;
           try {
	           byte data[] = file.getBytes();
	           fos = new FileOutputStream(Path.FILE_STORE+saveFileName);
	           fos.write(data);
	           fos.flush();
	           return true;
           }catch(IOException ie) {
              return false;
           }finally {
              try {
                 if(fos != null) fos.close();
              }catch(IOException ie) {}
           }
    }
    @Override
    public String saveStore(MultipartFile file) {
       String ofname = file.getOriginalFilename();
           System.out.println("#ofname: " + ofname);
           int idx = ofname.lastIndexOf(".");    // 인덱스를 찾아온다.
           String ofheader = ofname.substring(0, idx); // 0이상 idx파일미만.
           String ext = ofname.substring(idx);
           StringBuilder sb = new StringBuilder();
           sb.append(ofheader);
           sb.append("_");
           sb.append(ext);
           String saveFileName = sb.toString();    // String result = "abc_123456.jpg"           
           boolean flag = writeFile(file, saveFileName);
           if(flag) {
        	   System.out.println("# MemberServiceImpl : 업로드 성공");
           }else {
        	   System.out.println("# MemberServiceImpl : 업로드 실패");
           }
           return Path.FILE_STORE + saveFileName;
    }
    @Override
    public Member saveStore(Member member, MultipartFile file) {
       String ofname = file.getOriginalFilename();
           int idx = ofname.lastIndexOf(".");    // 인덱스를 찾아온다. 0 1        abc.jpg
           String ofheader = ofname.substring(0, idx); // 0이상 idx파일미만.    abc.jpg
           String ext = ofname.substring(idx);
           long ms = System.currentTimeMillis();    //1970.1.1 0시부터 밀리세컨드단위 1000분의 1초로 현재시간까지 가져온다. 다른 파일과 겹치지않게 도와준다.
           StringBuilder sb = new StringBuilder(); // abc _ 123456.jpg
           sb.append(ofheader);
           sb.append("_");
           sb.append(ms);
           sb.append(ext);
           String saveFileName = sb.toString();    // String result = "abc_123456.jpg"
           member.setM_fname(saveFileName);           
           boolean flag = writeFile(file, saveFileName);
           if(flag) {
        	   System.out.println("# MemberServiceImpl : 업로드 성공");
           }else {
        	   System.out.println("# MemberServiceImpl : 업로드 실패");
           }
           return member;
    }
	@Override
	public String findIdS(Member member) {
		String email = memberMapper.findId(member);
		System.out.println(email);
		return email;
	}
	@Override
	public void findPwd(Member member) {
		memberMapper.findPwd(member);
	}
	@Override
   public int checkLogin(Member member, HttpServletResponse response) throws Exception {
      System.out.println("memver =" + member.toString());
      int i = memberMapper.checkLogin(member);
      return i;
   }
}
/*---------------------------------------------
 *  이메일 관련 메서드 끝
 *--------------------------------------------*/
   
