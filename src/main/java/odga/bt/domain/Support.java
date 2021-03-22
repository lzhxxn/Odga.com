package odga.bt.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class Support {
	private long s_id;			
	private String s_subject;	
	private String s_content; 	
	private Date s_rdate; 		
	private int m_id;
    private int origin_no;
	private int group_ord;
	
	//join
	private String m_name;
	private String m_verify;
	
}
