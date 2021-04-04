package odga.bt.mapper;

import odga.bt.domain.Member;


public interface MemberMapper {
	public int checkId(String m_email) throws Exception; //이메일 체크
	public void joinS(Member member) throws Exception; //회원가입
	public Member loginS(String m_email); //로그인
	public String findId(Member member); //아이디 찾기
	public void findPwd(Member member); //비밀번호찾기
	public boolean emailAuthIns(Member member) throws Exception; //이메일 인증키 생성
	public String emailAuthChk(String authkey) throws Exception; //이메일 인증키 체크
	public boolean emailAuthDel(String authkey) throws Exception; //이메일 인증키 삭제
	public int checkLogin(Member member) throws Exception;
}