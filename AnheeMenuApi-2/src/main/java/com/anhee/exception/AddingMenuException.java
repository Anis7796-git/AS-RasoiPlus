package com.anhee.exception;

import org.springframework.dao.DataAccessException;

public class AddingMenuException extends RuntimeException {

	public AddingMenuException(String msg, DataAccessException ex) {
		super(msg,ex);
	}

	public AddingMenuException(String menuAdditionFailed) {
		super(menuAdditionFailed);
	}

}
