package odga.bt.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Touritems {
	private String addr1;
	private String addr2; 
	private String areacode;
	private String cat1;
	private String cat2;
	private String cat3;
	private String contentid;
	private String contenttypeid;
	private String createdtime;
	private String firstimage;
	private String firstimage2;
	private String mapx;
	private String mapy;
	private String mlevel;
	private String modifiedtime;
	private String readcount;
	private String sigungucode;
	private String tel;
	private String title;
	private String zipcode;
	
	private long sp_id;
	private S_Planner s_planner;
}
