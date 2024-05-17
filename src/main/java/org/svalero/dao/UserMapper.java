package org.svalero.dao;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;
import org.svalero.domain.User;

import java.sql.ResultSet;
import java.sql.SQLException;
public class UserMapper implements RowMapper<User> {
    @Override
    public User map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new User(rs.getInt("user_id"),
                rs.getString("user_name"),
                rs.getString("user_lastname"),
                rs.getInt("user_phone"),
                rs.getString("user_role"));


    }

}
