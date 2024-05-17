package org.svalero.dao;

import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.svalero.domain.User;
import java.util.List;

public interface UserDao {
    @SqlQuery("SELECT * FROM users")
    List<User> getAllUsers();

    @SqlUpdate("INSERT INTO users (user_name, user_lastname, user_phone, password) VALUES ( ? , ? , ?, SHA1(?))")
    int addUser(String user_name, String user_lastname, String user_phone, String password);
}
