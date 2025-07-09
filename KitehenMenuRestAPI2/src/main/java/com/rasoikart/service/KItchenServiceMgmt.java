package com.rasoikart.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.rasoikart.entity.KitchenEntity;
import com.rasoikart.entity.kitchendto;
import com.rasoikart.repository.IKichenRepo;

@Service
public class KItchenServiceMgmt implements IKitchenServiceMGmt {

    @Autowired
    private IKichenRepo repo;

    @Override
    public List<KitchenEntity> getAllKitchen() {
        return repo.findAll();
    }

    @Override
    public String saveKitchen(kitchendto dto, MultipartFile image) {
        if (dto.getKitchenName() == null || dto.getKitchenName().isBlank()) {
            throw new IllegalArgumentException("Kitchen name must not be blank.");
        }
        if (dto.getRating() < 0 || dto.getRating() > 5) {
            throw new IllegalArgumentException("Rating must be between 0 and 5.");
        }

        KitchenEntity entity = new KitchenEntity();
        BeanUtils.copyProperties(dto, entity);

        try {
            entity.setKitchenImage(image.getBytes());
        } catch (IOException e) {
            throw new RuntimeException("Failed to process uploaded image.", e);
        }

        Long kitchenId = repo.save(entity).getKitchenId();
        return "Kitchen '" + dto.getKitchenName() + "' saved successfully with ID: " + kitchenId;
    }
}
