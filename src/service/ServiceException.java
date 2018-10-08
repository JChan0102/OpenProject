package service;

import java.sql.SQLException;

public class ServiceException extends RuntimeException {
    public ServiceException(String s, SQLException e) {
        super(s,e);
    }
}
