package com.anhee.entity;

import java.util.Date;

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
@Table(name ="dilveryBoy")
@Data
public class DilveryBoyEntity {
	
	
	
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY )
	private Long dilveryBoyId;
	
	
	
		private String fullName;
		private String email;
		private String password;
		private String role;
		
		@Lob
	    @Column(length = 46777215)
		private byte[] image;
		
		private Date dateofBirth;
		
		private Long number;
		
		private String address;
		
		
		

}
