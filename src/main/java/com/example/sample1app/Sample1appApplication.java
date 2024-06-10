package com.example.sample1app;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class Sample1appApplication {

    @Value("${spring.datasource.url}")
    private String datasourceUrl;

    public static void main(String[] args) {
        SpringApplication.run(Sample1appApplication.class, args);
    }

    @Bean
    public CommandLineRunner commandLineRunner() {
        return args -> {
            System.out.println("Datasource URL: " + datasourceUrl);
        };
    }
}
