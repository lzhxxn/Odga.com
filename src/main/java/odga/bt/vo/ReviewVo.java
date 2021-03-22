package odga.bt.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor  //기본생성자
@AllArgsConstructor //파라미터생성자
@Data
public class ReviewVo {
	String searchOption; // 검색키
	String keyword;    //검색벨류 , for 검색      
	
	private int cp; //페이지번호
	private int ps; //페이지사이즈
	
	{
		cp = 1;
		ps = 5;   // 이렇게 멤버변수를 초기화해줘도 된다. 
	}
	
	public int getStartRow() {
		return (cp-1) * ps;  // 현제페이지 0 페이지수 5 = 0
	}
	public int getEndRow() {
		return cp * ps;  // 현재페이지 1 페이지수 5 = 5
	}
}