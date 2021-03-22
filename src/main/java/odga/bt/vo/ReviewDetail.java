package odga.bt.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import odga.bt.domain.Member;
import odga.bt.domain.Reply;
import odga.bt.domain.Review;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReviewDetail {
	private Review review;
	private Member writerInfo;
	private int countReply;
	private List<Reply> reply;
}
