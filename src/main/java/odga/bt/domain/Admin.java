package odga.bt.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Admin {
	private long a_id;
	private String a_email;
	private String a_pwd;
	private String a_phone;
}
