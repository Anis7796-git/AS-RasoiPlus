package com.anhee.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "customer")
@Data
public class CustomerEntity {
	
	
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY )
	private Long customerId;
	
	
	
	private String fullname;
	private String email;
	private String password;
	
	private String role;
	private String mobileNumber;

	@Lob
    @Column(length = 46777215)
	private byte[] profileImage;

	private String address;
	
	private Double latitude;
	
	private Double longitude;
	
}
