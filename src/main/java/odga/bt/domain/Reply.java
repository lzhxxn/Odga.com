package odga.bt.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
	private long re_id;
	private String re_writer;
	private String re_content;
	private String re_rdate;
	private long b_id;
	private String re_fname;
}
