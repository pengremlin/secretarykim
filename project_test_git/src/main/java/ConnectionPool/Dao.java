package ConnectionPool;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Dao {
	@Autowired
	private DataSource dataSource;

	public Connection getConnection() throws SQLException {
		Connection conn = null;

		conn = dataSource.getConnection();

		return conn;
	}
}
