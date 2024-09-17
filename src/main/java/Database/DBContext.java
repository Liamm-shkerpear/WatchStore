/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Database context for establishing SQL Server connections with UTF-8 encoding.
 * Ensure the JDBC driver supports UTF-8 or use an alternative method if necessary.
 */
public class DBContext {
    protected Connection connection;

    public DBContext(){
        try {
            String user="sa";
            String password = "123123";
            // Added characterEncoding parameter for UTF-8 support
            String url = "jdbc:sqlserver://localhost:1433;databaseName=swp_projects;encrypt=true;TrustServerCertificate=true;characterEncoding=UTF-8";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
    }
}
