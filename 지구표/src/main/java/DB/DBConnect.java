package DB;

import java.sql.*;


public class DBConnect {

	public static Connection getConnection() throws Exception{
		
		Connection conn = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "System";
		String pw = "1234";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url,id,pw);
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
		return conn;

	}

}
