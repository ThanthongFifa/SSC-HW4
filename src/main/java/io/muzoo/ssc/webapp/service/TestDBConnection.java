package io.muzoo.ssc.webapp.service;

import com.zaxxer.hikari.HikariDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TestDBConnection {
    public static void main(String[] args) {
        final HikariDataSource ds = new HikariDataSource();
        ds.setMaximumPoolSize(20);
        ds.setDriverClassName("org.mariadb.jdbc.Driver");
        ds.setJdbcUrl("jdbc:mariadb://localhost:13306/login_webapp");
        ds.addDataSourceProperty("user", "ssc");
        ds.addDataSourceProperty("password", "password");
        ds.setAutoCommit(false);

        try {
            Connection connection = ds.getConnection();
            String sql = "INSERT INTO tbl_user (username, password, display_name) VALUES (?, ?, ?);";
            PreparedStatement ps = connection.prepareStatement(sql);
            //set username
            ps.setString(1, "test_user");
            //set password
            ps.setString(2, "test_password");
            //set display name
            ps.setString(3, "test_dName");
            ps.executeUpdate();
            //commit to db
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
