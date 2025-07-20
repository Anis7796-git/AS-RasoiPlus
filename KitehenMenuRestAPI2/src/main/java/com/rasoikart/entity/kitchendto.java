package com.rasoikart.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class kitchendto {
	

	private String kitchenName;
	private String address;     //
	private Double latitude;     // 
	private Double longitude;
	private Double rating;
	
	private Long phonenumber;
	

}