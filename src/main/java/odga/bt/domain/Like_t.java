package odga.bt.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Like_t {
	private long li_id;
	private long likeflag;
	private long b_id;
	private long m_id;
}
