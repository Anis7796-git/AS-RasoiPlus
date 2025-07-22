package com.anhee.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

import jakarta.servlet.http.HttpServletRequest;

@ControllerAdvice
public class ExceptionController {

    // Handle RegistrationException for both API and web
    @ExceptionHandler(RegistrationException.class)
    public Object handleRegistrationException(RegistrationException e, HttpServletRequest request) {
        if (isApiRequest(request)) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
        return buildErrorModel(e, request, "Registration Error", HttpStatus.BAD_REQUEST.value());
    }

    // Handle FindByEmailNullpointerException for both API and web
    @ExceptionHandler(FindByEmailNullpointerException.class)
    public Object handleFindByEmailNullpointerException(FindByEmailNullpointerException e, HttpServletRequest request) {
        if (isApiRequest(request)) {
            return ResponseEntity.internalServerError().body("Email lookup error: " + e.getMessage());
        }
        return buildErrorModel(e, request, "Email Lookup Error", HttpStatus.INTERNAL_SERVER_ERROR.value());
    }

    // Handle 404 errors
    @ExceptionHandler(NoHandlerFoundException.class)
    public Object handleNoHandlerFoundException(NoHandlerFoundException e, HttpServletRequest request) {
        if (isApiRequest(request)) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("Resource not found: " + e.getRequestURL());
        }
        return buildErrorModel(e, request, "Page Not Found", HttpStatus.NOT_FOUND.value());
    }

    // General exception handler for both API and web
    @ExceptionHandler(Exception.class)
    public Object handleException(Exception e, HttpServletRequest request) {
        if (isApiRequest(request)) {
            return ResponseEntity.internalServerError()
                    .body("An unexpected error occurred: " + e.getMessage());
        }
        return buildErrorModel(e, request, "Unexpected Error", HttpStatus.INTERNAL_SERVER_ERROR.value());
    }

    // Helper method to build error model for JSP views
    private ModelAndView buildErrorModel(Exception e, HttpServletRequest request, 
                                       String errorTitle, int statusCode) {
        ModelAndView modelAndView = new ModelAndView("error");
        
        // Add error details to the model
        modelAndView.addObject("errorMessage", e.getMessage());
        modelAndView.addObject("errorTitle", errorTitle);
        modelAndView.addObject("statusCode", statusCode);
        modelAndView.addObject("requestUri", request.getRequestURI());
        modelAndView.addObject("exception", e.getClass().getSimpleName());
        
        // Set HTTP status
        modelAndView.setStatus(HttpStatus.valueOf(statusCode));
        
        return modelAndView;
    }

    // Helper method to check if request is an API call
    private boolean isApiRequest(HttpServletRequest request) {
        return request.getHeader("Accept") != null 
               && request.getHeader("Accept").contains("application/json");
    }
}