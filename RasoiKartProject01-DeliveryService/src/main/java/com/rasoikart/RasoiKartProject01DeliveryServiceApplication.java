package com.rasoikart;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class RasoiKartProject01DeliveryServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(RasoiKartProject01DeliveryServiceApplication.class, args);
	}

}
