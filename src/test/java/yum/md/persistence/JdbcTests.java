package yum.md.persistence;

import java.sql.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class JdbcTests {
	static {
		try {
			Class.forName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
		}catch(ClassNotFoundException cnfe) {
			log.info("#?ò§?ùº?Å¥ ?ìú?ùº?ù¥Î≤? ?ù∏?ãù ?ã§?å®");
		}
	}
	
	@Test
	public void testConnectionJdbc() {
		String url = "jdbc:log4jdbc:oracle:thin:@localhost:1521:JAVA";
		try {
			Connection con = DriverManager.getConnection(url, "odga", "java");
			log.info("#con from Jdbc: " + con);
		}catch(SQLException se) {
			log.info("#testConnectionJdbc() exception: " + se);
		}
	}
}
