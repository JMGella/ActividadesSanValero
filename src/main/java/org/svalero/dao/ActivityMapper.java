package org.svalero.dao;

import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;
import org.svalero.domain.Activity;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ActivityMapper implements RowMapper<Activity> {
    @Override
    public Activity map(ResultSet rs, StatementContext ctx) throws SQLException{
        return new Activity(rs.getInt("act_id"),
                rs.getString("act_name"),
                rs.getDate("act_start_date"),
                rs.getDate("act_end_date"),
                rs.getString("act_description"),
                rs.getString("act_image"));
    }
}
