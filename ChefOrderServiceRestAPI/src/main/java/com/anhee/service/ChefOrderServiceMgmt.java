package com.anhee.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anhee.entity.AcceptOrder;
import com.anhee.entity.ActiveOrder;
import com.anhee.entity.ActiverOrdrDto;
import com.anhee.entity.ChefEntity;
import com.anhee.excetpion.ActiveOrderNullPointerException;
import com.anhee.excetpion.FailedAcceptanceException;
import com.anhee.repository.AcceptRepo;
import com.anhee.repository.ActiveRepo;
import com.anhee.repository.ChefRepo;

@Service
public class ChefOrderServiceMgmt implements IChefOrderServiceMGT {

    @Autowired
    private AcceptRepo acceptRepo;
    
    @Autowired
    private ActiveRepo activeRepo;
    
    @Autowired
    private ChefRepo chefRepo;

    @Override
    public String saveacceptOrder(AcceptOrder entity) {
    	Long acceptOrderId = acceptRepo.save(entity).getAcceptOrderId();
    	
    	if(acceptOrderId!=null) 
    	{
    		return "Order Successfully accepted and id is"+acceptOrderId;
    	}
    	else {
    	 throw  new FailedAcceptanceException("Something went wrong please contact admin");
    	}
    }
    
    
    
    
    
    
	@Override
	public List<ActiveOrder> getActiveOrderList(Long chefId) {
	
		List<ActiveOrder> allByChefId = Optional.ofNullable(activeRepo.findAllByChefId(chefId))
				.orElseThrow(()->new ActiveOrderNullPointerException("No active orders found for chef: " ));
		
		
	
		return allByChefId;
	}



	@Override
	public String updateStatus(AcceptOrder entity) {
		
		return null;
	}

	@Override
	public String registerChef(ChefEntity entity) {
		Long chefId = chefRepo.save(entity).getChefId();
		return "ChefregisterSuccessfully"+chefId;
	}






	@Override
	public List<AcceptOrder> getAcceptOrder(String accept) {
		List<AcceptOrder> allByStutusAcceptOrRejected = acceptRepo.findAllByStutusAcceptOrRejected(accept);
		return allByStutusAcceptOrRejected;
	}






	@Override
	public String setActiveOrder(ActiverOrdrDto dto) {
		ActiveOrder entity = new ActiveOrder();
		BeanUtils.copyProperties(dto, entity);
		
		entity.setChefId(1L);
		entity.setCustomerid(1L);
		
		
		Long activeId = activeRepo.save(entity).getActiveId();
		
		System.out.println("chef Saved Successfully with Active id"+ activeId);
		return "chef Saved Successfully with Active id"+ activeId;
	}


  
}
