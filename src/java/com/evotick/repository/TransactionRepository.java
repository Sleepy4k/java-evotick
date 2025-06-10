/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.repository;

import com.evotick.model.Event;
import com.evotick.model.EventPackage;
import com.evotick.model.EventStatus;
import com.evotick.model.EventType;
import com.evotick.model.Ticket;
import com.evotick.model.Transaction;
import com.evotick.model.User;
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
public class TransactionRepository extends BaseRepository<Transaction> {

  private final String TABLE_NAME = "transactions";
  private final String INSERT_SQL = "insert into transactions (transaction_id, event_id, user_id, purchased_at, amount, status_id, package_id) "
    + "values (?, ?, ?, ?, ?, ?, ?)";
  private final String UPDATE_SQL = "update transactions set event_id = ?, user_id = ?, purchased_at = ?, amount = ?, status_id = ?, package_id = ? "
    + "where transaction_id = ?";
  private final String DELETE_SQL = "delete from transactions where transaction_id = ?";
  private final String SELECT_ALL_SQL = "select transactions.transaction_id, transactions.purchased_at, transactions.amount, transactions.status_id, transactions.package_id, "
    + "events.event_id, events.name as event_name, events.description, events.start_date, events.end_date, events.location, "
    + "event_status.status_id as event_status_id, event_status.name as status_name, "
    + "event_type.type_event_id, event_type.title as type_title, event_type.guest as type_guest, event_type.duration as type_duration, "
    + "event_type.rules as type_rules, "
    + "tickets.ticket_id, tickets.unique_code, "
    + "users.user_id, users.username as user_username, users.full_name as user_full_name, users.email as user_email "
    + "from transactions "
    + "join events on transactions.event_id = events.event_id "
    + "join event_status on events.status_id = event_status.status_id "
    + "join event_type on events.type_id = event_type.type_event_id "
    + "join tickets on transactions.transaction_id = tickets.transaction_id "
    + "join users on transactions.user_id = users.user_id limit ?, ?";
  private final String COUNT_SQL = "select count(transaction_id) as total from transactions";
  private final String SELECT_ONE_SQL = "select transactions.transaction_id, transactions.purchased_at, transactions.amount, transactions.status_id, transactions.package_id, "
    + "events.event_id, events.name as event_name, events.description, events.start_date, events.end_date, events.location, "
    + "event_status.status_id as event_status_id, event_status.name as status_name, "
    + "event_type.type_event_id, event_type.title as type_title, event_type.guest as type_guest, event_type.duration as type_duration, "
    + "event_type.rules as type_rules, "
    + "tickets.ticket_id, tickets.unique_code, "
    + "users.user_id, users.username as user_username, users.full_name as user_full_name, users.email as user_email "
    + "from transactions "
    + "join events on transactions.event_id = events.event_id "
    + "join event_status on events.status_id = event_status.status_id "
    + "join event_type on events.type_id = event_type.type_event_id "
    + "join tickets on transactions.transaction_id = tickets.transaction_id "
    + "join users on transactions.user_id = users.user_id where transaction_id = ?";
  private final String SELECT_ONE_CUSTOM_SQL = "select transactions.transaction_id, transactions.purchased_at, transactions.amount, transactions.status_id, transactions.package_id, "
    + "events.event_id, events.name as event_name, events.description, events.start_date, events.end_date, events.location, "
    + "event_status.status_id as event_status_id, event_status.name as status_name, "
    + "event_type.type_event_id, event_type.title as type_title, event_type.guest as type_guest, event_type.duration as type_duration, "
    + "event_type.rules as type_rules, "
    + "tickets.ticket_id, tickets.unique_code, "
    + "users.user_id, users.username as user_username, users.full_name as user_full_name, users.email as user_email "
    + "from transactions "
    + "join events on transactions.event_id = events.event_id "
    + "join event_status on events.status_id = event_status.status_id "
    + "join event_type on events.type_id = event_type.type_event_id "
    + "join tickets on transactions.transaction_id = tickets.transaction_id "
    + "join users on transactions.user_id = users.user_id where $1 = ?";

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
  protected void setInsertStatementParams(PreparedStatement statement, Transaction transaction) throws SQLException {
    statement.setString(1, transaction.getId().toString());
    statement.setString(2, transaction.getEvent().getId().toString());
    statement.setString(3, transaction.getUser().getId().toString());
    statement.setTimestamp(4, transaction.getPurchased_at());
    statement.setDouble(5, transaction.getAmount());
    statement.setString(6, transaction.getStatus().getId().toString());
    if (transaction.getEventPackage() != null) {
      statement.setString(7, transaction.getEventPackage().getId().toString());
    } else {
      statement.setNull(7, java.sql.Types.VARCHAR);
    }
  }

  @Override
  protected void setUpdateStatementParams(PreparedStatement statement, Transaction transaction) throws SQLException {
    statement.setString(1, transaction.getEvent().getId().toString());
    statement.setString(2, transaction.getUser().getId().toString());
    statement.setTimestamp(3, transaction.getPurchased_at());
    statement.setDouble(4, transaction.getAmount());
    statement.setString(5, transaction.getStatus().getId().toString());
    if (transaction.getEventPackage() != null) {
      statement.setString(6, transaction.getEventPackage().getId().toString());
    } else {
      statement.setNull(6, java.sql.Types.VARCHAR);
    }
    statement.setString(7, transaction.getId().toString());
  }

  @Override
  protected Transaction mapResultSetToModel(ResultSet resultSet) throws SQLException {
    Transaction transaction = new Transaction();
    transaction.setId(UUID.fromString(resultSet.getString("transaction_id")));
    transaction.setPurchased_at(resultSet.getTimestamp("purchased_at"));
    transaction.setAmount(resultSet.getInt("amount"));

    Event event = new Event();
    event.setId(UUID.fromString(resultSet.getString("event_id")));
    event.setName(resultSet.getString("event_name"));
    event.setDescription(resultSet.getString("description"));
    event.setStart_date(resultSet.getTimestamp("start_date"));
    event.setEnd_date(resultSet.getTimestamp("end_date"));
    event.setLocation(resultSet.getString("location"));

    EventStatus status = new EventStatus();
    status.setId(UUID.fromString(resultSet.getString("event_status_id")));
    status.setName(resultSet.getString("status_name"));

    EventType type = new EventType();
    type.setId(UUID.fromString(resultSet.getString("type_event_id")));
    type.setTitle(resultSet.getString("type_title"));
    type.setGuest(resultSet.getString("type_guest"));
    type.setDuration(resultSet.getTimestamp("type_duration"));
    type.setRules(resultSet.getString("type_rules"));

    event.setStatus(status);
    event.setType(type);

    transaction.setEvent(event);

    Ticket ticket = new Ticket();
    ticket.setId(UUID.fromString(resultSet.getString("ticket_id")));
    ticket.setUnique_code(resultSet.getString("unique_code"));

    transaction.setTicket(ticket);

    User user = new User();
    user.setId(UUID.fromString(resultSet.getString("user_id")));
    user.setUsername(resultSet.getString("user_username"));
    user.setFull_name(resultSet.getString("user_full_name"));
    user.setEmail(resultSet.getString("user_email"));

    transaction.setUser(user);

    if (resultSet.getObject("package_id") != null) {
      EventPackage eventPackage = new EventPackage();
      eventPackage.setId(UUID.fromString(resultSet.getString("package_id")));
      transaction.setEventPackage(eventPackage);
    }

    return transaction;
  }

  public List<Transaction> findCustom(Connection db, String key, String value) {
    List<Transaction> models = new ArrayList<>();
    String query = getSelectOneCustomSql().replace("$1", key); // Placeholder for column name
    try (PreparedStatement statement = db.prepareStatement(query)) {
      statement.setString(1, value);
      try (ResultSet resultSet = statement.executeQuery()) {
        while (resultSet.next()) {
          Transaction model = mapResultSetToModel(resultSet);
          models.add(model);
        }
      }
    } catch (SQLException ex) {
      Logger.getLogger(BaseRepository.class.getName()).log(Level.SEVERE, null, ex);
    }
    return models;
  }
}
