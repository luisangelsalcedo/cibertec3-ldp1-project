package eparking.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionMySQL {
	public static Connection getConnection() {

		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
			
			String url = "jdbc:mysql://localhost:3306/eparkingdb?useSSL=false&serverTimezone=UTC-5&allowPublicKeyRetrieval=true";
			String user = "root";
			String password = "123456";
			
			connection = DriverManager.getConnection(url, user, password);

		} catch (Exception e) {
			System.out.println("ERROR conexión: " + e.getMessage());
		}

		return connection;

	}
}
