package com.rasoikart.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class KitchenEntity {
	
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY )
	private Long kitchenId;
	
	
	private String kitchenName;
	private String address;     //
	private Double latitude;     // 
	private Double longitude;
	private Double rating;

	private Long phonenumber;
	
	@Lob
	private byte[] kitchenImage;
	
	

}
