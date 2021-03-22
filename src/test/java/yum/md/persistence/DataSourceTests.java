package yum.md.persistence;

import java.sql.Connection;

import javax.sql.DataSource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class DataSourceTests {
	@Autowired
	private DataSource dataSource;
	
	@Test
	public void testConnection() {
		try {
			log.info("#dataSource: " + dataSource);
			Connection con = dataSource.getConnection();
			log.info("#con: " + con);
		}catch(Exception e) {
			log.info("#testConnection() exception: " + e);
		}
	}
}
