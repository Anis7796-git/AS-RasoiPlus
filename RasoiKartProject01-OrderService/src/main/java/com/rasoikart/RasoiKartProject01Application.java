package com.rasoikart;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;


@SpringBootApplication
@EnableDiscoveryClient
public class RasoiKartProject01Application {

	public static void main(String[] args) {
		SpringApplication.run(RasoiKartProject01Application.class, args);
	}

}
