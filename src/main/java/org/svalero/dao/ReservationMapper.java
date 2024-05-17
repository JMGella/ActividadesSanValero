package org.svalero.dao;

import org.jdbi.v3.core.statement.StatementContext;
import org.svalero.domain.Reservation;
import org.jdbi.v3.core.mapper.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReservationMapper implements RowMapper<Reservation> {
    @Override
    public Reservation map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Reservation(rs.getInt("res_id"),
                rs.getInt("user_id"),
                rs.getInt("act_id"));
    }
}
