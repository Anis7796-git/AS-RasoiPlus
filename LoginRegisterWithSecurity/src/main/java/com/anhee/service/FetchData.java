package com.anhee.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.anhee.dto.KitchenAndMenuListDto;
import com.anhee.feign.IFeignClientMenu;
import com.anhee.feign.IFienclientKitchen;

@Service
public class FetchData {

    @Autowired
    IFienclientKitchen kitchenFeign;

    @Autowired
    IFeignClientMenu menuFeign;

    public void getKitchensWithMenus() {
        // Step 1: Get all kitchens
        ResponseEntity<List<KitchenAndMenuListDto>> kitchenResponse = kitchenFeign.getAllKitchens();
        List<KitchenAndMenuListDto> kitchens = kitchenResponse.getBody();

        System.err.println("FetchData.getKitchensWithMenus()");
        if (kitchens == null || kitchens.isEmpty()) {
            System.out.println("No kitchens found.");
            return;
        }

        // Step 2: For each kitchen, get menus
        for (KitchenAndMenuListDto kitchen : kitchens) {
            Long kitchenId = kitchen.getKitchenId();
            String kitchenName = kitchen.getKitchenName();

            ResponseEntity<?> menuResponse = menuFeign.getAllItems(kitchenId);
            System.err.println("FetchData.getKitchensWithMenus()");
            if (menuResponse.getBody() instanceof List<?>) {
                @SuppressWarnings("unchecked")
                List<Object> menus = (List<Object>) menuResponse.getBody();

                // Step 3: Print or Store
                System.out.println("Kitchen: " + kitchenName);
                System.out.println("Menus:");
                for (Object obj : menus) {
                    System.out.println(" - " + obj.toString()); // change to proper cast if needed
                }
                System.out.println("-----------");
            } else {
                System.out.println("No menu found for kitchen: " + kitchenName);
            }
        }
    }

	public KitchenAndMenuListDto getKitchns() {
		FetchData get= new FetchData();
		get.getKitchensWithMenus();
		return null;
	}
}
