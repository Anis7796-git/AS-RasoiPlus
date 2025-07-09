package com.rasoikart.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.rasoikart.entity.KitchenEntity;
import com.rasoikart.entity.kitchendto;

public interface IKitchenServiceMGmt {

	List<KitchenEntity> getAllKitchen();

	

	String saveKitchen(kitchendto dto, MultipartFile image);

}
// ye jala bhakhiche tu add add karun ghe global exception and user define msg 
// manual add karu nako chat gpt code tak ani te karun de te  bye have good night you and heena ok good night from heena and mi