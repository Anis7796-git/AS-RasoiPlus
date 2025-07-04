package com.anhee.service;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.anhee.dto.MenuDto;
import com.anhee.dto.UpdateMenuDto;
import com.anhee.entity.Menu;
import com.anhee.exception.AddingMenuException;
import com.anhee.exception.MenuNotFoundByIdException;
import com.anhee.exception.NoMenuPresentException;
import com.anhee.exception.WrongUpdateMenuIdException;
import com.anhee.repository.IMenuRepository;

@Service
@Transactional(readOnly = true)
public class MenuServiceMgmt implements IServiceMgmt {

    private static final String MENU_ITEM_NOT_FOUND = "Menu item not found with ID: ";
    private static final String NO_MENU_ITEMS_AVAILABLE = "No menu items available in the system";
    private static final String MENU_ADDITION_FAILED = "Failed to add menu item";
    private static final String MENU_UPDATE_FAILED = "Failed to update menu item with ID: ";

    @Autowired 
    private IMenuRepository repo;

    @Override
    @Transactional
    public String addMenu(MenuDto menuDto,MultipartFile image)  {
        try {
            Menu menuEntity = new Menu();
            BeanUtils.copyProperties(menuDto, menuEntity);
            try {
            	 byte[] imagebyte = image.getBytes();
            	 
            	 menuEntity.setImage(imagebyte);
                 
            } catch (IOException e) {
                throw new RuntimeException("Failed to read image.", e);
            }
           
            Menu savedMenu = repo.save(menuEntity);
            
            if(savedMenu.getId() == null) {
                throw new AddingMenuException(MENU_ADDITION_FAILED);
            }
            
            return String.format("Menu item '%s' added successfully with ID: %d", 
                                savedMenu.getItemName(), savedMenu.getId());
        } catch (DataAccessException ex) {
            throw new AddingMenuException(MENU_ADDITION_FAILED, ex);
        }
    }

    @Override
    @Transactional
    public String UpdateMenu(UpdateMenuDto updateMenuDto) {
        Optional<Menu> optionalMenu = repo.findById(updateMenuDto.getUpdateItemId());
        
        if(!optionalMenu.isPresent()) {
            throw new WrongUpdateMenuIdException(MENU_ITEM_NOT_FOUND + updateMenuDto.getUpdateItemId());
        }
        
        Menu menu = optionalMenu.get();
        menu.setItemName(updateMenuDto.getItemName());
        menu.setPrice(updateMenuDto.getPrice());
        menu.setDescription(updateMenuDto.getDescription());
        try {
			menu.setImage(updateMenuDto.getImage().getBytes());
		} catch (IOException e) {
			 throw new WrongUpdateMenuIdException(MENU_UPDATE_FAILED + updateMenuDto.getUpdateItemId());
		}
        menu.setAvailable(updateMenuDto.isAvailable());
        
        try {
            Menu updatedMenu = repo.save(menu);
            return String.format("Menu item '%s' updated successfully", updatedMenu.getItemName());
        } catch (DataAccessException ex) {
            throw new WrongUpdateMenuIdException(MENU_UPDATE_FAILED + updateMenuDto.getUpdateItemId(), ex);
        }
    }

    @Override
    @Transactional
    public String deleteItem(Long id) {
        if(!repo.existsById(id)) {
            throw new MenuNotFoundByIdException(MENU_ITEM_NOT_FOUND + id);
        }
        
        try {
            repo.deleteById(id);
            return String.format("Menu item with ID %d deleted successfully", id);
        } catch (DataAccessException ex) {
            throw new MenuNotFoundByIdException("Failed to delete menu item with ID: " + id, ex);
        }
    }

    @Override
    public List<Menu> getAllMenu() {
        List<Menu> allMenus = repo.findAll();
        
        if(allMenus.isEmpty()) {
            throw new NoMenuPresentException(NO_MENU_ITEMS_AVAILABLE);
        }
        
        return allMenus;
    }

    @Override
    public Menu getItemById(Long id) {
        return repo.findById(id)
                 .orElseThrow(() -> new MenuNotFoundByIdException(MENU_ITEM_NOT_FOUND + id));
    }
}