package odga.bt.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Review {
	private long b_id;			//글 id(SEQ)
	private String b_writer;	//작성자
	private String b_subject; 	//글 제목
	private String b_content; 	//글 내용
	private String b_img;
	private Date b_rdate; 		//작성일
	private String b_catgo;		//카테고리
	private int b_like; 		//좋아요수
	private int m_id; 			//회원id
	private int b_reply;
	private Like_t likgt;
}
