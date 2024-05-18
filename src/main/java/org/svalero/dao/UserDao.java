package org.svalero.dao;

import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;
import org.svalero.domain.User;
import java.util.List;

public interface UserDao {
    @SqlQuery("SELECT * FROM users")
    List<User> getAllUsers();

    @SqlQuery("SELECT * FROM users WHERE username = ? AND password = SHA1(?)")
    @UseRowMapper(UserMapper.class)
    User getUser(String username, String password);

    @SqlQuery("SELECT * FROM users WHERE user_id = ?")
    @UseRowMapper(UserMapper.class)
    User getUserid(int user_id);


    @SqlUpdate("INSERT INTO users (username, user_firstname, user_lastname, user_phone, password) VALUES ( ? , ?, ? , ?, SHA1(?))")
    int addUser(String username, String user_firstname, String user_lastname, int user_phone, String password);
}
