package org.svalero.dao;

import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.svalero.domain.Reservation;

import java.util.List;

public interface ReservationDao {
    @SqlQuery("SELECT * FROM reservations")
    List<Reservation> getAllReservations();

    @SqlUpdate("INSERT INTO reservations (user_id, act_id) VALUES (? , ?)")
    int addReservation(int user_id, int act_id);
}
