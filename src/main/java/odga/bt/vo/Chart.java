package odga.bt.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Chart {
	private String areacode;
	private String area;
	private int count;
	private String contentid;
}
