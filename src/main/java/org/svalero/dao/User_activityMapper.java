package org.svalero.dao;

import org.jdbi.v3.core.statement.StatementContext;
import org.svalero.domain.User_activity;
import org.jdbi.v3.core.mapper.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User_activityMapper implements RowMapper<User_activity> {
    @Override
    public User_activity map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new User_activity(rs.getInt("reg_id"),
                rs.getInt("user_id"),
                rs.getInt("act_id"));
    }
}
