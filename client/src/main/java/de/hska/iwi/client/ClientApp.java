package de.hska.iwi.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

/**
 * @author Jakob Fels
 */
@SpringBootApplication
@RestController
public class ClientApp {

    @Autowired
    RestTemplate template;

    public static void main(String[] args) {
        SpringApplication.run(ClientApp.class, args);
    }

    @RequestMapping("/books")
    public String books() {
        return template.getForObject("http://localhost:8082/books", String.class);
    }

    @RequestMapping("/user")
    public String user() {
        return template.getForObject("http://localhost:8081/auth/user", String.class);
    }
}

