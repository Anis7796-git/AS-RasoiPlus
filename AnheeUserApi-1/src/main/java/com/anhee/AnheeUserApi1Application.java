package com.anhee;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient

public class AnheeUserApi1Application {

	public static void main(String[] args) {
		SpringApplication.run(AnheeUserApi1Application.class, args);
	}

}
