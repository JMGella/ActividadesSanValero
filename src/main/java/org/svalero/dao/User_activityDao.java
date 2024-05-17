package org.svalero.dao;

import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.svalero.domain.User_activity;

import java.util.List;

public interface User_activityDao {
    @SqlQuery("SELECT * FROM users_activities")
    List<User_activity> getAllregister();

    @SqlUpdate("INSERT INTO users_activities (user_id, act_id) VALUES (? , ?)")
    int addRregister(int user_id, int act_id);
}
