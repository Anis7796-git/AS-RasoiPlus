package com.anhee.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
public class kitchenEntity {

	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY )
	private Long kitchenId;
	
	
	

	private String fullname;
	private String email;
	private String password;
	
	private String role;
	
	
	private String kitchenName;


	
	
	
	private String address;     //
	private Double latitude;     // 
	private Double longitude;
	private Double rating;

	private Long phonenumber;
	
	@Lob
    @Column(length = 46777215)
	
	private byte[] kitchenImage;
	
}
