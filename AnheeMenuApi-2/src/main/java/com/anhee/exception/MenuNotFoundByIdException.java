package com.anhee.exception;

import org.springframework.dao.DataAccessException;

public class MenuNotFoundByIdException extends RuntimeException {

	public MenuNotFoundByIdException(String msg) {
		super(msg);
	}

	public MenuNotFoundByIdException(String msg, DataAccessException ex) {
		super(msg,ex);
	}

}
