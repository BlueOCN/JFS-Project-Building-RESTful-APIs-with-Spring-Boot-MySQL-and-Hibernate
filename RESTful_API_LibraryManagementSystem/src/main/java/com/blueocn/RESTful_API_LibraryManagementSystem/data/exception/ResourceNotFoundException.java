package com.blueocn.RESTful_API_LibraryManagementSystem.data.exception;

public class ResourceNotFoundException extends RuntimeException {
    public ResourceNotFoundException(String message) {
        super(message);
    }
}
