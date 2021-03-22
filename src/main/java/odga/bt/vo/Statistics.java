package odga.bt.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Statistics {
	private int memberCnt;
	private int boardCnt;
	private int tourCnt;
	private Date m_rdate;
	private Date b_rdate;
	private Date p_rdate;
}
