package odga.bt.domain;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
import odga.bt.domain.Review;

@NoArgsConstructor //기본생성자
@Data  // setter getter 
public class ReviewListResult {
	
	/** 한 페이지당 게시글 수 **/
	private int ps = 5;
	
	/** 한 블럭(range)당 페이지 수 **/
	private int rangeSize = 5;
	
	 /** 현재 페이지 **/
	private int cp = 1;
	
	/** 총 게시글 수 **/
	private long totalCount;
	
	 /** 총 페이지 수 **/
	private long totalPageCount;
	
	
	/** 시작 페이지 **/
	private int startPage;
	
	/** 끝 페이지 **/
	private int endPage;
	
	/** 이전 페이지 **/
	private int prevPage;
	
	/** 다음 페이지 **/
	private int nextPage;

	private List<Review> list;

	public ReviewListResult(int cp, long totalCount, int ps, List<Review> list, int rangeSize) {
		this.cp = cp;
		this.totalCount = totalCount;
		this.ps = ps;
		this.list = list;
		this.totalPageCount = calTotalPageCount();
		this.rangeSize = rangeSize;
		
		//총 페이지 수
		setPageCount(totalCount);
		//블럭(range) setting
		rangeSetting(cp);
	}
	private long calTotalPageCount() {
		long tpc = totalCount/ps;  
		if(totalCount%ps != 0) tpc++;
		
		return tpc;
	}
	private void setPageCount(long totalCount) {
		this.totalPageCount = (int)Math.ceil(totalCount*1.0/ps);
	}
	
	
	private void rangeSetting(int cp) {
		this.endPage = (((int)Math.ceil((double)cp / (double)rangeSize)) * rangeSize);
		this.startPage = endPage - rangeSize + 1;
		if(endPage>totalPageCount) {
			this.endPage=(int) totalPageCount;
		}
		this.prevPage = cp-1;
		this.nextPage = cp+1;
	}

	public int getPageSize() {
		return ps;
	}
	public int getRangeSize() {
		return rangeSize;
	}

	public int getCurrentPage() {
		return cp;
	}

	public long getListCount() {
		return totalCount;
	}
	
	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}


	public long getPageCount() {
		return totalPageCount;
	}

}


