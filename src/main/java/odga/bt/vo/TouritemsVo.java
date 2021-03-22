package odga.bt.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor  //湲곕낯�깮�꽦�옄
@AllArgsConstructor //�뙆�씪誘명꽣�깮�꽦�옄
@Data
public class TouritemsVo {
	String catgo; // 寃��깋�궎
	String keyword;    //寃��깋踰⑤쪟 , for 寃��깋      
	
	private int cp; //�럹�씠吏�踰덊샇
	private int ps; //�럹�씠吏��궗�씠利�
	
	{                              
		cp = 1;
		ps = 5;   // �씠�젃寃� 硫ㅻ쾭蹂��닔瑜� 珥덇린�솕�빐以섎룄 �맂�떎. 
	}
	
	public int getStartRow() {
		return (cp-1) * ps;  // �쁽�젣�럹�씠吏� 0 �럹�씠吏��닔 5 = 0
	}
	public int getEndRow() {
		return cp * ps;  // �쁽�옱�럹�씠吏� 1 �럹�씠吏��닔 5 = 5
	}
}
	