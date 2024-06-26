package org.svalero.dao;

import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;
import org.svalero.domain.Activity;

import java.util.Date;
import java.util.List;

public interface ActivityDao {

    @SqlQuery("SELECT * FROM ACTIVITIES")
    @UseRowMapper(ActivityMapper.class)
    List<Activity> getAllActivities();

    @SqlQuery("SELECT * FROM ACTIVITIES WHERE act_id = ?")
    @UseRowMapper(ActivityMapper.class)
    Activity getActivity(int act_id);

    @SqlUpdate("DELETE FROM activities WHERE act_id = ?")
    int removeActivity(int act_id);

    @SqlUpdate("INSERT INTO activities (act_name, act_start_date, act_end_date, act_description, act_image) VALUES (?, ?, ?, ?, ?)")
    int addActivity(String act_name, Date act_start_date, Date act_end_date, String act_description, String act_image);

    @SqlUpdate("UPDATE activities SET act_name = ?, act_start_date = ? , act_end_date = ? , act_description = ? , act_image = ? WHERE act_id = ?")
    int updateActivity(String act_name, Date act_start_date, Date act_end_date, String act_description, String act_image, int act_id);

}
