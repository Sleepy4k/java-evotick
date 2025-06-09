/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.repository;

import com.evotick.model.Event;
import com.evotick.model.EventPackage;
import com.evotick.model.EventStatus;
import com.evotick.model.EventType;
import com.evotick.model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.UUID;

/**
 *
 * @author Pandu
 */
public class EventRepository extends BaseRepository<Event> {

  private final String TABLE_NAME = "events";
  private final String INSERT_SQL = "insert into events (event_id, name, description, start_date, end_date, location, status_id, type_id, penyelenggara, poster_url, created_by) "
    + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
  private final String UPDATE_SQL = "update events set name = ?, description = ?, start_date = ?, end_date = ?, location = ?, status_id = ?, type_id = ?, penyelenggara = ?, poster_url = ? "
    + "where event_id = ?";
  private final String DELETE_SQL = "delete from events where event_id = ?";
  private final String SELECT_ALL_SQL = "select events.event_id, events.name as event_name, events.description, events.start_date, events.end_date, events.location, events.status_id, events.type_id, events.penyelenggara, events.poster_url, events.created_by, " +
    "event_status.name as status_name, " +
    "event_type.type_event_id, event_type.title as type_title, event_type.guest as type_guest, event_type.duration as type_duration, event_type.rules as type_rules, event_type.venue as type_venue, " +
    "admin.username as admin_username, admin.full_name as admin_full_name, admin.email as admin_email, admin.password as admin_password, " +
    "(select min(price) from event_package where event_package.event_id = events.event_id) as lowest_package_price " +
    "from events " +
    "join event_status on events.status_id = event_status.status_id " +
    "join event_type on events.type_id = event_type.type_event_id " +
    "join admin on events.created_by = admin.admin_id limit ?, ?";
  private final String COUNT_SQL = "select count(event_id) as total from events";
  private final String SELECT_ONE_SQL = "select events.event_id, events.name as event_name, events.description, events.start_date, events.end_date, events.location, events.status_id, events.type_id, events.penyelenggara, events.poster_url, events.created_by, " +
    "event_status.name as status_name, " +
    "event_type.type_event_id, event_type.title as type_title, event_type.guest as type_guest, event_type.duration as type_duration, event_type.rules as type_rules, event_type.venue as type_venue, " +
    "admin.username as admin_username, admin.full_name as admin_full_name, admin.email as admin_email, admin.password as admin_password, " +
    "(select min(price) from event_package where event_package.event_id = events.event_id) as lowest_package_price " +
    "from events " +
    "join event_status on events.status_id = event_status.status_id " +
    "join event_type on events.type_id = event_type.type_event_id " +
    "join admin on events.created_by = admin.admin_id where event_id = ?";
  private final String SELECT_ONE_CUSTOM_SQL = "select events.event_id, events.name as event_name, events.description, events.start_date, events.end_date, events.location, events.status_id, events.type_id, events.penyelenggara, events.poster_url, events.created_by, " +
    "event_status.name as status_name, " +
    "event_type.type_event_id, event_type.title as type_title, event_type.guest as type_guest, event_type.duration as type_duration, event_type.rules as type_rules, event_type.venue as type_venue, " +
    "admin.username as admin_username, admin.full_name as admin_full_name, admin.email as admin_email, admin.password as admin_password, " +
    "(select min(price) from event_package where event_package.event_id = events.event_id) as lowest_package_price " +
    "from events " +
    "join event_status on events.status_id = event_status.status_id " +
    "join event_type on events.type_id = event_type.type_event_id " +
    "join admin on events.created_by = admin.admin_id where $1 = ?";

  @Override
  protected String getTableName() {
    return TABLE_NAME;
  }

  @Override
  protected String getInsertSql() {
    return INSERT_SQL;
  }

  @Override
  protected String getUpdateSql() {
    return UPDATE_SQL;
  }

  @Override
  protected String getDeleteSql() {
    return DELETE_SQL;
  }

  @Override
  protected String getSelectAllSql() {
    return SELECT_ALL_SQL;
  }

  @Override
  protected String getCountSql() {
    return COUNT_SQL;
  }

  @Override
  protected String getSelectOneSql() {
    return SELECT_ONE_SQL;
  }

  @Override
  protected String getSelectOneCustomSql() {
    return SELECT_ONE_CUSTOM_SQL;
  }

  @Override
  protected void setInsertStatementParams(PreparedStatement statement, Event event) throws SQLException {
    statement.setObject(1, event.getId());
    statement.setString(2, event.getName());
    statement.setString(3, event.getDescription());
    statement.setTimestamp(4, event.getStart_date());
    statement.setTimestamp(5, event.getEnd_date());
    statement.setString(6, event.getLocation());
    statement.setObject(7, event.getStatus().getId());
    statement.setObject(8, event.getType().getId());
    statement.setString(9, event.getPenyelenggara());
    statement.setString(10, event.getPoster_url());
    statement.setObject(11, event.getCreated_by().getId());
  }

  @Override
  protected void setUpdateStatementParams(PreparedStatement statement, Event event) throws SQLException {
    statement.setString(1, event.getName());
    statement.setString(2, event.getDescription());
    statement.setTimestamp(3, event.getStart_date());
    statement.setTimestamp(4, event.getEnd_date());
    statement.setString(5, event.getLocation());
    statement.setObject(6, event.getStatus().getId());
    statement.setObject(7, event.getType().getId());
    statement.setString(8, event.getPenyelenggara());
    statement.setString(9, event.getPoster_url());
    statement.setObject(10, event.getId());
  }

  @Override
  protected Event mapResultSetToModel(ResultSet resultSet) throws SQLException {
    Event event = new Event();
    event.setId(UUID.fromString(resultSet.getString("event_id")));
    event.setName(resultSet.getString("event_name"));
    event.setDescription(resultSet.getString("description"));
    event.setStart_date(resultSet.getTimestamp("start_date"));
    event.setEnd_date(resultSet.getTimestamp("end_date"));
    event.setLocation(resultSet.getString("location"));

    EventStatus status = new EventStatus();
    status.setId(UUID.fromString(resultSet.getString("status_id")));
    status.setName(resultSet.getString("status_name"));

    EventType type = new EventType();
    type.setId(UUID.fromString(resultSet.getString("event_type.type_event_id")));
    type.setTitle(resultSet.getString("type_title"));
    type.setGuest(resultSet.getString("type_guest"));
    type.setDuration(resultSet.getTimestamp("type_duration"));
    type.setRules(resultSet.getString("type_rules"));
    type.setVenue(resultSet.getString("type_venue"));

    event.setStatus(status);
    event.setType(type);

    event.setPenyelenggara(resultSet.getString("penyelenggara"));
    event.setPoster_url(resultSet.getString("poster_url"));

    User createdBy = new User();
    createdBy.setId(UUID.fromString(resultSet.getString("created_by")));
    createdBy.setUsername(resultSet.getString("admin_username"));
    createdBy.setFull_name(resultSet.getString("admin_full_name"));
    createdBy.setEmail(resultSet.getString("admin_email"));
    createdBy.setIs_admin(true);
    createdBy.setPassword(resultSet.getString("admin_password"));

    EventPackage eventPackage = new EventPackage();
    eventPackage.setPrice(resultSet.getDouble("lowest_package_price"));

    ArrayList<EventPackage> packages = new ArrayList<>();
    packages.add(eventPackage);
    event.setPackages(packages);

    event.setCreated_by(createdBy);

    return event;
  }
}
