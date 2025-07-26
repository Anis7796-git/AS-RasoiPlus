package com.anhee.service;

import java.util.List;
import java.util.Optional;

import com.anhee.entity.AcceptOrder;
import com.anhee.entity.ActiveOrder;
import com.anhee.entity.ActiverOrdrDto;
import com.anhee.entity.ChefEntity;

public interface IChefOrderServiceMGT {

	List<ActiveOrder> getActiveOrderList(Long chefId);

	

	String updateStatus(AcceptOrder entity);

	String registerChef(ChefEntity entity);

	String saveacceptOrder(AcceptOrder entity);

	List<AcceptOrder> getAcceptOrder(String accept);



	String setActiveOrder(ActiverOrdrDto dto);

	

	

}
