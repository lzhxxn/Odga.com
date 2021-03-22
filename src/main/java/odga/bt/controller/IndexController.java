package odga.bt.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;

import odga.bt.domain.Review;
import odga.bt.service.ReviewService;


@Controller
public class IndexController {

   @Autowired
   private ReviewService rservice;
   /* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
   @RequestMapping("/")
   public ModelAndView index() {
	  List<Review> review = rservice.selectBestReviewS();
	  ModelAndView mv = new ModelAndView("index","review", review);
	  
	  return mv;
   }
   @RequestMapping("/index.do")
   public ModelAndView index2() {
	  List<Review> review = rservice.selectBestReviewS();
	  ModelAndView mv = new ModelAndView("index","review", review);
	  return mv;
	}
   @RequestMapping("/use")
   public String use() {
      return "use"; 
   }
 //로그인 첫 화면 요청 메소드(네이버)
   @RequestMapping(value = "login", method = { RequestMethod.GET, RequestMethod.POST })
   public String login(Model model, HttpSession session) {
	   /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
	   String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	   System.out.println("네이버:" + naverAuthUrl);
	   //네이버
	   model.addAttribute("url", naverAuthUrl);
	   
      return "login";
   }
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response의 nickname값 파싱
		String nickname = (String)response_obj.get("nickname");
		String name = (String)response_obj.get("name");
		String email = (String)response_obj.get("email");
		String profile_image = (String)response_obj.get("profile_image");
		System.out.println(nickname);
		
		//4.파싱 닉네임 세션으로 저장
		session.setAttribute("sessionId",nickname); //세션 생성
		session.setAttribute("sessionNa",name);
		session.setAttribute("sessionEm",email);
		session.setAttribute("sessionPi",profile_image);

		model.addAttribute("result", apiResult);
		
		return "forward:/index.do";
	}
}