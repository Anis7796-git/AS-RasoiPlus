package com.anhee.dto;

import jakarta.persistence.Column;
import jakarta.persistence.Lob;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Menu {

	 private Long id;

	    private String category;

	    private String itemName;

	    @Column(length = 5000)
	    private String description;

	    private Double price;

	    @Lob
	    private byte[] imageData;
	    
	    private Long kitchenId;

}
