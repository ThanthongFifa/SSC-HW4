package io.muzoo.ssc.webapp.service;

import com.zaxxer.hikari.HikariDataSource;
import io.muzoo.ssc.webapp.config.ConfigProperties;
import io.muzoo.ssc.webapp.config.ConfigurationLoader;

import java.sql.Connection;
import java.sql.SQLException;

public class DBConnectionService {

    private final HikariDataSource ds;
    private static DBConnectionService service;

    /**
     * DB connection pool using hikari
     * secret and variables are loaded from disk
     */

    public DBConnectionService() {
        ds = new HikariDataSource();
        ds.setMaximumPoolSize(20);

        ConfigProperties cp = ConfigurationLoader.load();
        if ( cp == null) {
            throw new RuntimeException("Unable to rad the config.properties");
        }
        ds.setDriverClassName(cp.getDatabaseDriverClassName());
        ds.setJdbcUrl(cp.getDatabaseConnectionUrl());
        ds.addDataSourceProperty("user", cp.getDatabaseUsername());
        ds.addDataSourceProperty("password", cp.getDatabasePassword());
        ds.setAutoCommit(false);
    }

    public Connection getConnection() throws SQLException {
        return ds.getConnection();
    }

    public static DBConnectionService getInstance() {
        if (service == null){
            service = new DBConnectionService();
        }
        return service;
    }
}