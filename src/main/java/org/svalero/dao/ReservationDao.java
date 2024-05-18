package org.svalero.dao;

import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;
import org.svalero.domain.Reservation;

import java.util.List;

public interface ReservationDao {
    @SqlQuery("SELECT * FROM reservations")
    @UseRowMapper(ReservationMapper.class)
    List<Reservation> getAllReservations();

    @SqlQuery("SELECT * FROM reservations WHERE user_id = ?")
    @UseRowMapper(ReservationMapper.class)
    List<Reservation> getReservationsbyUser(int user_id);

    @SqlUpdate("INSERT INTO reservations (user_id, act_id) VALUES (? , ?)")
    int addReservation(int user_id, int act_id);

    @SqlUpdate("DELETE FROM reservations WHERE user_id =? AND act_id = ?")
    int deleteReservation(int user_id, int act_id);

}
