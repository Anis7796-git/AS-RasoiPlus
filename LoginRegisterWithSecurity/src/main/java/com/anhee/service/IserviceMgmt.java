package com.anhee.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.anhee.dto.ChefDto;
import com.anhee.dto.CustomerDto;
import com.anhee.dto.DelveryBoyDto;

import com.anhee.dto.kitchenDto;
import com.anhee.entity.ChefEntity;
import com.anhee.entity.CustomerEntity;
import com.anhee.entity.DilveryBoyEntity;
import com.anhee.entity.kitchenEntity;

public interface IserviceMgmt extends UserDetailsService {

	public String SaveCustomer(CustomerDto custDto,byte[] image);

	public String SaveChef(ChefDto chefdto,byte[] image);

	public String SaveDilveryBoy(DelveryBoyDto custDto,byte[] image);

	public String SaveKitchen(kitchenDto kitchenDto,byte[] image);

	public ChefEntity findChefBYEmail(String name);

	public CustomerEntity findcustomerBYEmail(String name);

	public kitchenEntity findkitchenBYEmail(String name);

	public DilveryBoyEntity finddeliveryboyBYEmail(String name);


}
