package de.hska.iwi.oauth.server;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;

/**
 * @author Jakob Fels
 */
@SpringBootApplication
@EnableResourceServer
public class OauthServerApp {

    @Autowired
    private javax.sql.DataSource dataSource;
    private PasswordEncoder passwordEncoder = NoOpPasswordEncoder.getInstance();

    public static void main(String[] args) {
        SpringApplication.run(OauthServerApp.class, args);
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder builder) throws Exception {
        builder.jdbcAuthentication().dataSource(dataSource).passwordEncoder(passwordEncoder);
    }
}
