package odga.bt.controller;

import java.io.IOException;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.springframework.util.StringUtils;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;


public class NaverLoginBO {
	private final static String CLIENT_ID = "3peaahDHXS2EooanIoAb";
	private final static String CLIENT_SECRET = "IeB_B7xpk5";
	private final static String REDIRECT_URI = "http://localhost:8080/callback";
	private final static String SESSION_STATE = "oauth_state";
	//네이버프로필 조회 API URL
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	
	//네이버 아이디로 인증 URL 생성
	public String getAuthorizationUrl(HttpSession session) {
		String state = generateRandomString();
		setSession(session,state);
		OAuth20Service oauthService = new ServiceBuilder()
		.apiKey(CLIENT_ID)
		.apiSecret(CLIENT_SECRET)
		.callback(REDIRECT_URI)
		.state(state)
		.build(NaverLoginApi.instance());
		return oauthService.getAuthorizationUrl();
	}
	//네이버아이디로 Callback 처리 및 AccessToken 획득
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{
		String sessionState = getSession(session);
		if(StringUtils.pathEquals(sessionState, state)){
		OAuth20Service oauthService = new ServiceBuilder()
		.apiKey(CLIENT_ID)
		.apiSecret(CLIENT_SECRET)
		.callback(REDIRECT_URI)
		.state(state)
		.build(NaverLoginApi.instance());
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		return accessToken;
		}
		return null;
	}
	//세션 유효성 검증을 위한 난수 생성기
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}
	//http session에 데이터 저장
	private void setSession(HttpSession session,String state){
		session.setAttribute(SESSION_STATE, state);
	}
	//http session에서 데이터 가져오기
	private String getSession(HttpSession session){
		return (String) session.getAttribute(SESSION_STATE);
	}
	//Access Token을 이용하여 네이버 사용자 프로필 API를 호출
	public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException{
		OAuth20Service oauthService =new ServiceBuilder()
		.apiKey(CLIENT_ID)
		.apiSecret(CLIENT_SECRET)
		.callback(REDIRECT_URI).build(NaverLoginApi.instance());
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		return response.getBody();
	}
}
