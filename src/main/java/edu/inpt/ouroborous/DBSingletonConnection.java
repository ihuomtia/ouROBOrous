package edu.inpt.ouroborous;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBSingletonConnection {
    String db = "ouroborous_db";
    String user = "ouroborous_admin";
    String pwd = "ouroborous_pwd";
    String url = "jdbc:mysql://localhost:3306/" + db;
    private static Connection connection = null;

    private DBSingletonConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, pwd);
            System.out.println("instance created!!");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("----------------------------- Error happened!");
        }

    }

    public static Connection getConnection() {
        if (connection == null)
            new DBSingletonConnection();
        return connection;
    }
}
