package odga.bt.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private long m_id;
	private String m_email;
	private String m_pwd;
	private String m_name;
	private String m_phone;
	private String m_gender;
	private Date m_birth;
	private Date m_rdate;
	private String m_fname;
	private String m_ofname;
	private int m_verify;
	private String m_about;
	private int count;
	private String Authkey; //이메일 인증키
	public Member(String m_email, String m_pwd) {
	      super();
	      this.m_email = m_email;
	      this.m_pwd = m_pwd;
	   }
}
