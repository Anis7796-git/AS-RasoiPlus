package com.anhee.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.anhee.entity.Menu;

public interface IMenuRepository extends JpaRepository<Menu, Long> {

}
