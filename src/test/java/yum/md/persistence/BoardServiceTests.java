/*package yum.md.service;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import yum.md.dao.AddressDao;
import yum.md.domain.Board;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceTests {
	@Setter(onMethod_ = {@Autowired})
	private BoardService boardService;
	
	@Test
	public void testList() {
		List<Board> list = boardService.listS();
	    log.info("@list(1): " + list);
	}
	@Test
	public void testInsert() {
		Board Board = new Board(-1, "유민", "ymhur2030@naver.com","제목","내용", null);
		boardService.insertS(Board);
		
		List<Board> list = boardService.listS();
	    log.info("@list(2): " + list);
	}
	@Test
	public void testDelete() {
		boardService.deleteS(20);
		List<Board> list = boardService.listS();
	    log.info("@list(3): " + list);
	}
}
*/