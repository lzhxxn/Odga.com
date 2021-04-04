package odga.bt.controller;

import java.security.GeneralSecurityException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;
import javax.crypto.Cipher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import odga.bt.domain.Member;
import odga.bt.service.MemberService;

@Controller
@RequestMapping("/")
public class LoginController {
   @Autowired
   private MemberService service;
   @Autowired
   private ServletContext servletContext;
   //NaverLoginBO
   private NaverLoginBO naverLoginBO;
   
   //네이버로그인
   @Autowired
   private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
      this.naverLoginBO = naverLoginBO;
   }
   //로그아웃
   @RequestMapping(value = "logout", method = RequestMethod.GET)
   private String logout(HttpServletResponse response, HttpSession session) throws Exception {
      service.logout(response, session);
      return "forward:index.do";
   }
   //아이디, 비번 찾기
   @GetMapping("findIdPwd")
   private String findIdPwd() {
      return "forgot";
   }
   //로그인
   @RequestMapping("login.do")
   public String MoveLogin(@ModelAttribute Member member, Model model, HttpServletRequest request,HttpServletResponse response)throws GeneralSecurityException {
      HttpSession session = request.getSession();
      String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
      model.addAttribute("url", naverAuthUrl);
      if(member.getM_email() != null) return "index";
      else {
         KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
         generator.initialize(1024);
         KeyPair keyPair = generator.genKeyPair();
         KeyFactory keyFactory = KeyFactory.getInstance("RSA");
         PublicKey publicKey = keyPair.getPublic();
         PrivateKey privateKey = keyPair.getPrivate();         
         session.setAttribute("_RSA_WEB_Key_", privateKey);   //세션에 RSA 개인키를 세션에 저장한다.
         RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
         String publicKeyModulus = publicSpec.getModulus().toString(16);
         String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
         request.setAttribute("RSAModulus", publicKeyModulus);  //로그인 폼에 Input Hidden에 값을 셋팅하기위해서
         request.setAttribute("RSAExponent", publicKeyExponent);   //로그인 폼에 Input Hidden에 값을 셋팅하기위해서
         return "login";
      }
   }
   //암호화
   public String decryptRsa(PrivateKey privateKey, String securedValue) {
       String decryptedValue = "";
       try{
         Cipher cipher = Cipher.getInstance("RSA");
         /**
         * 암호화 된 값은 byte 배열이다.
         * 이를 문자열 폼으로 전송하기 위해 16진 문자열(hex)로 변경한다. 
         * 서버측에서도 값을 받을 때 hex 문자열을 받아서 이를 다시 byte 배열로 바꾼 뒤에 복호화 과정을 수행한다.
         */
         byte[] encryptedBytes = hexToByteArray(securedValue);
         cipher.init(Cipher.DECRYPT_MODE, privateKey);
         byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
         decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의.
       }catch(Exception e)
       {
          System.out.println("# 암호화 에러 발생 : "+e.getMessage());
       }
         return decryptedValue;
   } 
 
   	//16진 문자열을 byte 배열로 변환 
    public static byte[] hexToByteArray(String hex) {
      if (hex == null || hex.length() % 2 != 0) {
         return new byte[]{};
      }
    
      byte[] bytes = new byte[hex.length() / 2];
      for (int i = 0; i < hex.length(); i += 2) {
         byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16);
         bytes[(int) Math.floor(i / 2)] = value;
      }
      return bytes;
   }
    //로그인 체크
    @RequestMapping(value = "/login.proc",headers="Accept=application/json",method = RequestMethod.POST)
    public @ResponseBody JSONObject loginChk(HttpServletRequest request) 
    {
       Member loginMember = new Member();
       JSONObject listObj = new JSONObject();
       String uemail = request.getParameter("m_email");
       String pwd = request.getParameter("m_pwd");
       HttpSession session = request.getSession();
       System.out.println("# 암호화 된 아이디: "+uemail+", # 암호화 된 비밀번호: "+pwd);
       PrivateKey privateKey = (PrivateKey) session.getAttribute("_RSA_WEB_Key_");  //로그인전에 세션에 저장된 개인키를 가져온다.
       if (privateKey == null) { 
    	   System.out.println("# LoginCon / 로그인체크 실패");
          listObj.put("state", "false"); 
          //json 형태의 데이터를 DB나 웹서버에서 가져올때는 json데이터를 넣어주지않고 적절하게 가공만 하면 되므로 문제되지 않지만 다음과 같이 직접적으로 Generic 타입 선언 없이 put으로만 일방적으로 넣었을때 경고가 나타난것이다.
       }
       else{
          try{
             //암호화처리된 사용자계정정보를 복호화 처리한다.
             String _uemail = decryptRsa(privateKey, uemail);
             String _pwd = decryptRsa(privateKey, pwd);
             //복호화 처리된 계정정보를 member에 담아서 myBatis와 연동한다.
             loginMember.setM_email(_uemail);
             loginMember.setM_pwd(_pwd);
             Member m1 = service.login(loginMember, null, servletContext);
             if(m1.getM_email().length() > 0) { 
                  session.setAttribute("LOGINUSER", m1);
                  System.out.println("# LoginCon / 로그인체크 정상 작동");
                  listObj.put("state", "true");
             }else { 
                listObj.put("state", "false");
             } 
             //iBatis 처리 및 로그인후 session 처리
          }
          catch(Exception e)
          {
             listObj.put("state", "false");
             System.out.println("# LoginCon / 로그인체크 ERROR : "+e.getMessage()); 
          }
       } 
       System.out.println("# LoginCon / 로그인체크 정상 작동");
       return listObj;  
    }
}