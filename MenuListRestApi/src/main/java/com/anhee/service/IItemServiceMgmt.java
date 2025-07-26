package com.anhee.service;

import java.util.List;

import com.anhee.entity.ItemsEntity;


public interface IItemServiceMgmt {

	List<ItemsEntity> getAllItems(Long kitchenId);

	String saveItem(ItemsEntity entity);

}
