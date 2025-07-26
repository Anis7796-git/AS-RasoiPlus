package com.anhee.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.anhee.entity.AcceptOrder;
@Repository
public interface AcceptRepo extends JpaRepository<AcceptOrder, Long> {

	

	
	@Query("SELECT a FROM AcceptOrder a WHERE a.stutusAcceptOrRejected = :status")
	List<AcceptOrder> findAllByStutusAcceptOrRejected(@Param("status") String status);
}
