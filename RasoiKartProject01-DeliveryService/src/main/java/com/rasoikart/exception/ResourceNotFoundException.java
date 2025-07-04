package com.rasoikart.exception;

public class ResourceNotFoundException extends RuntimeException
{
   /**
	 * 
	 */
	private static final long serialVersionUID = -2483724978467688180L;

  public ResourceNotFoundException(String msg)
   {
	   super(msg);
   }
}
