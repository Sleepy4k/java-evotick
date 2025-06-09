/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.repository;

import com.evotick.model.Event;
import com.evotick.model.EventPackage;
import com.evotick.model.EventStatus;
import com.evotick.model.EventType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pandu
 */
public class EventPackageRepository extends BaseRepository<EventPackage> {

  private final String TABLE_NAME = "event_package";
  private final String INSERT_SQL = "insert into event_package (type_package_id, name, price, quota, detail, event_id) "
    + "values (?, ?, ?, ?, ?, ?)";
  private final String UPDATE_SQL = "update event_package set name = ?, price = ?, quota = ?, detail = ? "
    + "where type_package_id = ?";
  private final String DELETE_SQL = "delete from event_package where type_package_id = ?";
  private final String SELECT_ALL_SQL = "select event_package.type_package_id, event_package.name as package_name, event_package.price, event_package.quota, event_package.detail, "
    + "events.event_id, events.name as event_name, events.description, events.start_date, events.end_date, events.location, "
    + "event_status.status_id, event_status.name as status_name, "
    + "event_type.type_event_id, event_type.title as type_title, event_type.guest as type_guest, event_type.duration as type_duration, "
    + "event_type.rules as type_rules, event_type.venue as type_venue "
    + "from event_package "
    + "join events on event_package.event_id = events.event_id "
    + "join event_status on events.status_id = event_status.status_id "
    + "join event_type on events.type_id = event_type.type_event_id limit ?, ?";
  private final String COUNT_SQL = "select count(type_package_id) as total from event_package";
  private final String SELECT_ONE_SQL = "select event_package.type_package_id, event_package.name as package_name, event_package.price, event_package.quota, event_package.detail, "
    + "events.event_id, events.name as event_name, events.description, events.start_date, events.end_date, events.location, "
    + "event_status.status_id, event_status.name as status_name, "
    + "event_type.type_event_id, event_type.title as type_title, event_type.guest as type_guest, event_type.duration as type_duration, "
    + "event_type.rules as type_rules, event_type.venue as type_venue "
    + "from event_package "
    + "join events on event_package.event_id = events.event_id "
    + "join event_status on events.status_id = event_status.status_id "
    + "join event_type on events.type_id = event_type.type_event_id where event_package.type_package_id = ?";
  private final String SELECT_ONE_CUSTOM_SQL = "select event_package.type_package_id, event_package.name as package_name, event_package.price, event_package.quota, event_package.detail, "
    + "events.event_id, events.name as event_name, events.description, events.start_date, events.end_date, events.location, "
    + "event_status.status_id, event_status.name as status_name, "
    + "event_type.type_event_id, event_type.title as type_title, event_type.guest as type_guest, event_type.duration as type_duration, "
    + "event_type.rules as type_rules, event_type.venue as type_venue "
    + "from event_package "
    + "join events on event_package.event_id = events.event_id "
    + "join event_status on events.status_id = event_status.status_id "
    + "join event_type on events.type_id = event_type.type_event_id where $1 = ?";

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
  protected void setInsertStatementParams(PreparedStatement statement, EventPackage eventPackage) throws SQLException {
    statement.setObject(1, eventPackage.getId() != null ? eventPackage.getId() : UUID.randomUUID());
    statement.setString(2, eventPackage.getName());
    statement.setDouble(3, eventPackage.getPrice());
    statement.setInt(4, eventPackage.getQuota());
    statement.setString(5, eventPackage.getDetail());
    statement.setObject(6, eventPackage.getEvent() != null ? eventPackage.getEvent().getId() : null);
  }

  @Override
  protected void setUpdateStatementParams(PreparedStatement statement, EventPackage eventPackage) throws SQLException {
    statement.setString(1, eventPackage.getName());
    statement.setDouble(2, eventPackage.getPrice());
    statement.setInt(3, eventPackage.getQuota());
    statement.setString(4, eventPackage.getDetail());
    statement.setObject(5, eventPackage.getId());
  }

  @Override
  protected EventPackage mapResultSetToModel(ResultSet resultSet) throws SQLException {
    EventPackage eventPackage = new EventPackage();
    eventPackage.setId(UUID.fromString(resultSet.getString("type_package_id")));
    eventPackage.setName(resultSet.getString("package_name"));
    eventPackage.setPrice(resultSet.getDouble("price"));
    eventPackage.setQuota(resultSet.getInt("quota"));
    eventPackage.setDetail(resultSet.getString("detail"));

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
    type.setId(UUID.fromString(resultSet.getString("type_event_id")));
    type.setTitle(resultSet.getString("type_title"));
    type.setGuest(resultSet.getString("type_guest"));
    type.setDuration(resultSet.getTimestamp("type_duration"));
    type.setRules(resultSet.getString("type_rules"));
    type.setVenue(resultSet.getString("type_venue"));

    event.setStatus(status);
    event.setType(type);

    eventPackage.setEvent(event);

    return eventPackage;
  }

  public List<EventPackage> findCustom(Connection db, String key, String value) {
    List<EventPackage> models = new ArrayList<>();
    String query = getSelectOneCustomSql().replace("$1", key); // Placeholder for column name
    try (PreparedStatement statement = db.prepareStatement(query)) {
      statement.setString(1, value);
      try (ResultSet resultSet = statement.executeQuery()) {
        while (resultSet.next()) {
          EventPackage model = mapResultSetToModel(resultSet);
          models.add(model);
        }
      }
    } catch (SQLException ex) {
      Logger.getLogger(BaseRepository.class.getName()).log(Level.SEVERE, null, ex);
    }
    return models;
  }
}
