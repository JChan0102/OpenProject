package service;

import java.sql.SQLException;

public class ServiceException extends Throwable {
    public ServiceException(String s, SQLException e) {
        super(s,e);
    }
}
