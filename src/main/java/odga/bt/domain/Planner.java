package odga.bt.domain;

import java.sql.Date;
import java.util.List;

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
	private List<Touritems> p_img;
}
