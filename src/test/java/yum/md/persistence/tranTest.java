package yum.md.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import odga.bt.domain.S_Planner;
import odga.bt.domain.Touritems;
import odga.bt.service.PlannerService;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class tranTest {
	@Setter(onMethod_ = {@Autowired})
	private PlannerService service;
	private Touritems touritems;
	static {
		try {
			Class.forName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
		}catch(ClassNotFoundException cnfe) {
			log.info("##�뵒鍮� �뿰寃� �떎�뙣");
		}
	}
	
	@Test
	public void testConnectionJdbc() {
		String url = "jdbc:log4jdbc:oracle:thin:@localhost:1521:JAVA";
		try {
			Connection con = DriverManager.getConnection(url, "ODGA", "JAVA");
			log.info("#con from Jdbc: " + con);
		}catch(SQLException se) {
			log.info("#testConnectionJdbc() exception: " + se);
		}
	}
	
}
