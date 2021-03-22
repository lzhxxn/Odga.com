package odga.bt.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Planner {
	private long p_id;
	private Date p_rdate;
	private long m_id;
	private String  p_title;
	private String p_msize;
	private String p_concept;
	
	//랜덤 이미지 네임
	private String randomImg;
}
