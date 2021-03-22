package odga.bt.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Area_T {
	private String areacode;
	private String area;
	private double latitude;
	private double longitude;
}
