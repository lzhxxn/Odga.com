package odga.bt.mapper;

import odga.bt.domain.Member;


public interface MemberMapper {
	
	public int checkId(String m_email) throws Exception;
	public void joinS(Member member) throws Exception;
	public Member loginS(String m_email);
	
	public String findId(Member member);
	public void findPwd(Member member);
		
	//�씠硫붿씪愿��젴
	public boolean emailAuthIns(Member member) throws Exception; //�씠硫붿씪 �씤利앺궎 ���옣
	public String emailAuthChk(String authkey) throws Exception; //�씠硫붿씪 �씤利앺궎 ��議�
	public boolean emailAuthDel(String authkey) throws Exception; //�씠硫붿씪 �씤利앺궎 �궘�젣

	public int checkLogin(Member member) throws Exception;
}