package com.anhee.service;

import java.util.Collections;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.anhee.dto.ChefDto;
import com.anhee.dto.CustomerDto;
import com.anhee.dto.DelveryBoyDto;
import com.anhee.dto.kitchenDto;
import com.anhee.entity.ChefEntity;
import com.anhee.entity.CustomerEntity;
import com.anhee.entity.DilveryBoyEntity;
import com.anhee.entity.kitchenEntity;
import com.anhee.exception.FindByEmailNullpointerException;
import com.anhee.exception.RegistrationException;

import com.anhee.repository.IChefRepo;
import com.anhee.repository.IDelveryBoyRepo;

import com.anhee.repository.IcustomerRepo;
import com.anhee.repository.IkitchenRepo;

@Service
public class ServiceMgmt implements IserviceMgmt {

	@Autowired
	private BCryptPasswordEncoder pwdEncoder;

	@Autowired
	private IChefRepo chefrepo;

	@Autowired
	private IcustomerRepo customerrepo;

	@Autowired
	private IkitchenRepo kitchenRepo;

	@Autowired
	private IDelveryBoyRepo dilvaryBoyRepo;

	@Override
	public String SaveCustomer(CustomerDto custDto, byte[] image) {
		try {
			if (custDto == null) {
				throw new RegistrationException("Customer data cannot be null");
			}

			CustomerEntity entity = new CustomerEntity();
			String encode = pwdEncoder.encode(custDto.getPassword());
			custDto.setPassword(encode);

			BeanUtils.copyProperties(custDto, entity);
			entity.setProfileImage(image);

			Long customerId = customerrepo.save(entity).getCustomerId();

			return "Customer registered successfully with ID: " + customerId;
		} catch (Exception e) {
			throw new RegistrationException("Failed to register customer: " + e.getMessage(), e);
		}
	}

	@Override
	public String SaveChef(ChefDto chefdto, byte[] image) {
		try {
			if (chefdto == null) {
				throw new RegistrationException("Chef data cannot be null");
			}

			String encode = pwdEncoder.encode(chefdto.getPassword());
			chefdto.setPassword(encode);

			ChefEntity entity = new ChefEntity();
			BeanUtils.copyProperties(chefdto, entity);
			entity.setProfileImage(image);

			Long chefId = chefrepo.save(entity).getChefId();

			return "Chef registered successfully with ID: " + chefId;
		} catch (Exception e) {
			throw new RegistrationException("Failed to register chef: " + e.getMessage(), e);
		}
	}

	@Override
	public String SaveDilveryBoy(DelveryBoyDto dilveryBoyDto, byte[] image) {
		try {
			if (dilveryBoyDto == null) {
				throw new RegistrationException("Delivery boy data cannot be null");
			}

			String encode = pwdEncoder.encode(dilveryBoyDto.getPassword());
			dilveryBoyDto.setPassword(encode);

			DilveryBoyEntity entity = new DilveryBoyEntity();
			BeanUtils.copyProperties(dilveryBoyDto, entity);
			entity.setImage(image);

			Long dilveryBoyId = dilvaryBoyRepo.save(entity).getDeliveryBoyId();

			return "Delivery boy registered successfully with ID: " + dilveryBoyId;
		} catch (Exception e) {
			throw new RegistrationException("Failed to register delivery boy: " + e.getMessage(), e);
		}
	}

	@Override
	public String SaveKitchen(kitchenDto kitchenDto, byte[] image) {
		try {
			if (kitchenDto == null) {
				throw new RegistrationException("Kitchen data cannot be null");
			}

			String encode = pwdEncoder.encode(kitchenDto.getPassword());
			kitchenDto.setPassword(encode);

			kitchenEntity entity = new kitchenEntity();
			BeanUtils.copyProperties(kitchenDto, entity);
			entity.setKitchenImage(image);

			Long kitchenId = kitchenRepo.save(entity).getKitchenId();

			return "Kitchen registered successfully with ID: " + kitchenId;
		} catch (Exception e) {
			throw new RegistrationException("Failed to register kitchen: " + e.getMessage(), e);
		}
	}

//	@Override
//	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
//		
//		kitchenEntity byEmail = kitchenRepo.findByEmail(email);
//		
//		
//		
//		
//		return new User(byEmail.getEmail(),byEmail.getPassword(),Collections.emptyList());
//	}

//    
//    @Override
//    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
//        // Check all repositories for the user
//        CustomerEntity customer = customerrepo.findByEmail(email);
//        if (customer != null) {
//            String role =  (customer.getRole() != null ? customer.getRole().toUpperCase() : "CUSTOMER");
//            return new User(customer.getEmail(), customer.getPassword(), 
//                    Collections.singletonList(new SimpleGrantedAuthority(role)));
//        }
//
//        ChefEntity chef = chefrepo.findByEmail(email);
//        if (chef != null) {
//            return new User(chef.getEmail(), chef.getPassword(), 
//                    Collections.singletonList(new SimpleGrantedAuthority("CHEF")));
//        }
//
//        kitchenEntity kitchen = kitchenRepo.findByEmail(email);
//        if (kitchen != null) {
//            String role =  (kitchen.getRole() != null ? kitchen.getRole().toUpperCase() : "KITCHEN");
//            return new User(kitchen.getEmail(), kitchen.getPassword(), 
//                    Collections.singletonList(new SimpleGrantedAuthority(role)));
//        }
//
//        DilveryBoyEntity deliveryBoy = dilvaryBoyRepo.findByEmail(email);
//        if (deliveryBoy != null) {
//            String role =(deliveryBoy.getRole() != null ? deliveryBoy.getRole().toUpperCase() : "DELIVERY");
//            return new User(deliveryBoy.getEmail(), deliveryBoy.getPassword(), 
//                    Collections.singletonList(new SimpleGrantedAuthority(role)));
//        }
//
//        throw new UsernameNotFoundException("User not found with email: " + email);
//    }

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		// Check all repositories for the user
		CustomerEntity customer = customerrepo.findByEmail(email);
		if (customer != null) {
			String role = "ROLE_" + (customer.getRole() != null ? customer.getRole().toUpperCase() : "CUSTOMER");
			return new User(customer.getEmail(), customer.getPassword(),
					Collections.singletonList(new SimpleGrantedAuthority(role)));
		}

		ChefEntity chef = chefrepo.findByEmail(email);
		if (chef != null) {
			return new User(chef.getEmail(), chef.getPassword(),
					Collections.singletonList(new SimpleGrantedAuthority("ROLE_CHEF")));
		}

		kitchenEntity kitchen = kitchenRepo.findByEmail(email);
		if (kitchen != null) {
			String role = "ROLE_" + (kitchen.getRole() != null ? kitchen.getRole().toUpperCase() : "KITCHEN");
			return new User(kitchen.getEmail(), kitchen.getPassword(),
					Collections.singletonList(new SimpleGrantedAuthority(role)));
		}

		DilveryBoyEntity deliveryBoy = dilvaryBoyRepo.findByEmail(email);
		if (deliveryBoy != null) {
			String role = "ROLE_"
					+ (deliveryBoy.getRole() != null ? deliveryBoy.getRole().toUpperCase() : "DELIVERYBOY");
			return new User(deliveryBoy.getEmail(), deliveryBoy.getPassword(),
					Collections.singletonList(new SimpleGrantedAuthority(role)));
		}

		throw new UsernameNotFoundException("User not found with email: " + email);
	}

	// Dashboard Controller

	@Override
	public ChefEntity findChefBYEmail(String email) {

		ChefEntity byEmail = chefrepo.findByEmail(email);

		if (byEmail != null) {
			return byEmail;
		} else {
			throw new FindByEmailNullpointerException("Invalid username please login again ...");

		}
	}

	@Override
	public CustomerEntity findcustomerBYEmail(String email) {

		CustomerEntity byEmail = customerrepo.findByEmail(email);

		if (byEmail != null) {
			return byEmail;
		} else {
			throw new FindByEmailNullpointerException("Invalid username please login again ...");

		}
	}

	@Override
	public kitchenEntity findkitchenBYEmail(String email) {

		kitchenEntity byEmail = kitchenRepo.findByEmail(email);

		if (byEmail != null) {
			return byEmail;
		} else {
			throw new FindByEmailNullpointerException("Invalid username please login again ...");

		}
	}

	@Override
	public DilveryBoyEntity finddeliveryboyBYEmail(String email) {

		DilveryBoyEntity byEmail = dilvaryBoyRepo.findByEmail(email);

		if (byEmail != null) {
			return byEmail;
		} else {
			throw new FindByEmailNullpointerException("Invalid username please login again ...");

		}
	}

}