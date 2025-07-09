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
	private String location;
	private  Double distance;
	private Double rating;
	
	
	
	@Lob
	private byte[] kitchenImage;
	
	

}
