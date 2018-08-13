package db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conn {
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/insurance_is_db?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
			return conn;
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
			return null;
		}
		catch ( SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
