package odga.bt.domain;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
import odga.bt.domain.Review;

@NoArgsConstructor 
@Data  
public class ReviewListResult {
	private int ps = 5;	
	private int rangeSize = 5;
	private int cp = 1;
	private long totalCount;
	private long totalPageCount;
	private int startPage;
	private int endPage;
	private int prevPage;
	private int nextPage;
	private List<Review> list;
	public ReviewListResult(int cp, long totalCount, int ps, List<Review> list, int rangeSize) {
		this.cp = cp;
		this.totalCount = totalCount;
		this.ps = ps;
		this.list = list;
		this.totalPageCount = calTotalPageCount();
		this.rangeSize = rangeSize;
		setPageCount(totalCount);
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


