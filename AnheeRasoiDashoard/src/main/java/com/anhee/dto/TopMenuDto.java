package com.anhee.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TopMenuDto {
	
	 private Long id;
	    private String itemName;
	    private String imageBase64;

}
