package com.anhee.exception;

import org.springframework.dao.DataAccessException;

public class WrongUpdateMenuIdException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public WrongUpdateMenuIdException(String msg) {
		super(msg);
	}

	public WrongUpdateMenuIdException(String msg, DataAccessException ex) {
		super(msg,ex);
	}

}
