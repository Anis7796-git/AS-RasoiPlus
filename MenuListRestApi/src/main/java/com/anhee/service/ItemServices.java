package com.anhee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.anhee.entity.ItemsEntity;
import com.anhee.exception.GetItemNullPointerException;
import com.anhee.repository.ItemRepository;

@Service
public class ItemServices implements IItemServiceMgmt {

	@Autowired private ItemRepository repo;
	
	
	@Override
	public List<ItemsEntity> getAllItems(Long kitchenId) {
		
		List<ItemsEntity> itemlist=repo.findAllByKitchenId(kitchenId);
		
		if(itemlist!=null) {
			return itemlist;
		}else {
			throw new GetItemNullPointerException("Kitchen Menu Not availble please report to kitchen");
		}
		
		
		
	}


	@Override
	public String saveItem(ItemsEntity entity) {
		
		return repo.save(entity).getId()+" item save successfully";
	}

}
