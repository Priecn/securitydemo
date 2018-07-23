package com.prince.springdemo.config;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;
import java.util.logging.Logger;

@Configuration
@PropertySource("classpath:persistence-mysql.properties")
public class DemoDBConfig {

    private Logger logger = Logger.getLogger(getClass().getName());

    // reading JDBC props from properties file
    @Value("${jdbc.driver}")
    private String driverClass;
    @Value("${jdbc.url}")
    private String url;
    @Value("${jdbc.user}")
    private String user;
    @Value("${jdbc.password}")
    private String password;

    // reading connection pool props from properties file
    @Value("${connection.pool.initialPoolSize}")
    private int initialPoolSize;
    @Value("${connection.pool.minPoolSize}")
    private int minPoolSize;
    @Value("${connection.pool.maxPoolSize}")
    private int maxPoolSize;
    @Value("${connection.pool.maxIdleTime}")
    private int maxIdleTime;


    @Bean
    public DataSource securityDataSource() {

        // create connection pool
        ComboPooledDataSource securityDataSource = new ComboPooledDataSource();

        // set JDBC driver class
        try {
            securityDataSource.setDriverClass(driverClass);
        } catch (PropertyVetoException e) {
            throw new RuntimeException(e);
        }

        // log the connection props
        logger.info(">>> jdbc.url: "+ url);
        logger.info(">>> jdbc.user: "+ user);

        // set database connection properties
        securityDataSource.setJdbcUrl(url);
        securityDataSource.setUser(user);
        securityDataSource.setPassword(password);

        // set connection pool props
        securityDataSource.setInitialPoolSize(initialPoolSize);
        securityDataSource.setMaxPoolSize(maxPoolSize);
        securityDataSource.setMinPoolSize(minPoolSize);
        securityDataSource.setMaxIdleTime(maxIdleTime);

        return securityDataSource;
    }
}
