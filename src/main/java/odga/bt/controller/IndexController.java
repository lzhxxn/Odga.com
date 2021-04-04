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
   
   //네이버로그인정보
   @Autowired
   private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
      this.naverLoginBO = naverLoginBO;
   }
   
   //메인페이지
   @RequestMapping("/")
   public ModelAndView index() {
     List<Review> review = rservice.selectBestReviewS(); //베스트여행후기
     ModelAndView mv = new ModelAndView("index","review", review);
     return mv;
   }
   //메인페이지
   @RequestMapping("/index.do")
   public ModelAndView index2() {
     List<Review> review = rservice.selectBestReviewS(); //베스트여행후기
     ModelAndView mv = new ModelAndView("index","review", review);
     return mv;
   }
   //이용방법
   @RequestMapping("/use")
   public String use() {
      return "use"; 
   }
   //네이버 정보 받는거
   @RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
   public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
      OAuth2AccessToken oauthToken;
      oauthToken = naverLoginBO.getAccessToken(session, code, state);
      apiResult = naverLoginBO.getUserProfile(oauthToken); 
      JSONParser parser = new JSONParser();
      Object obj = parser.parse(apiResult);
      JSONObject jsonObj = (JSONObject) obj;

      JSONObject response_obj = (JSONObject)jsonObj.get("response");
      String nickname = (String)response_obj.get("nickname");
      String name = (String)response_obj.get("name");
      String email = (String)response_obj.get("email");
      String profile_image = (String)response_obj.get("profile_image");
      System.out.println(nickname);
      
      session.setAttribute("sessionId",nickname);       
      session.setAttribute("sessionNa",name);
      session.setAttribute("sessionEm",email);
      session.setAttribute("sessionPi",profile_image);
      model.addAttribute("result", apiResult);
      System.out.println("# 네이버 세션 정보 담음");
      return "forward:/index.do";
   }
}