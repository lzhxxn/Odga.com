package odga.bt.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class S_Planner {
	private long sp_id;
	private long sp_day;
	private String sp_sday;
	private String sp_eday;
	private String contentid;
	private long p_id;
	private Touritems touritems;
}
